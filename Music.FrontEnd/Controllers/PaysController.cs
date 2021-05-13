using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MoMo;
using Music.FrontEnd.Function;
using Music.Model.EF;
using Newtonsoft.Json.Linq;

namespace Music.FrontEnd.Controllers
{
    public class PaysController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Pays
        public ActionResult Index()
        {
            return View(db.Packages.Where(n=>n.package_active == true).OrderBy(n=>n.pakage_price).ToList());
        }
        public ActionResult Details(int? id)
        {
            return View(db.Packages.Find(id));
        }
        public ActionResult PayMoMo(int? id)
        {
            var coo = new FunctionController();
            var idus = coo.CookieID();

            Package pakage = db.Packages.Find(id);


            //request params need to request to MoMo system
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMO5RGX20191128";
            string accessKey = "M8brj9K6E22vXoDB";
            string serectkey = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4";
            string orderInfo = "Nâng cấp vip " + pakage.package_name + " cho tài khoản " + idus.user_email;
            string returnUrl = "https://localhost:44325/Pays/ReturnUrl";
            string notifyurl = "https://localhost:44325/Pays/NotifyUrl";

            string amount = pakage.pakage_price.ToString();
            string orderid = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            string signature = crypto.signSHA256(rawHash, serectkey);
            //build body json request
            JObject message = new JObject
                {
                    { "partnerCode", partnerCode },
                    { "accessKey", accessKey },
                    { "requestId", requestId },
                    { "amount", amount },
                    { "orderId", orderid },
                    { "orderInfo", orderInfo },
                    { "returnUrl", returnUrl },
                    { "notifyUrl", notifyurl },
                    { "extraData", extraData },
                    { "requestType", "captureMoMoWallet" },
                    { "signature", signature }

                };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
            JObject jmessage = JObject.Parse(responseFromMomo);

            Session["idpake"] = id;

            return Redirect(jmessage.GetValue("payUrl").ToString());
        }
        public ActionResult ReturnUrl(int errorCode, int amount)
        {
            if(Session["idpake"] == null)
            {
                return RedirectToAction("History");
            }
            else
            {
                var coo = new FunctionController();
                var id = coo.CookieID();

                User user = db.Users.Find(id.user_id);

                int idpake = int.Parse(Session["idpake"].ToString());
                Package pakage = db.Packages.Find(idpake);

                if (errorCode.Equals(0))
                {

                    user.user_datevip = DateTime.Now.AddMonths((int)pakage.package_month);
                    user.user_vip = true;
                    db.SaveChanges();


                    Pay bills = new Pay
                    {
                        pay_datecreate = DateTime.Now,
                        pay_status = true,
                        user_id = id.user_id,
                        pakage_id = pakage.package_id,
                        pay_summoney = amount
                    };
                    db.Pays.Add(bills);
                    db.SaveChanges();

                    History history = new History()
                    {
                        user_id = id.user_id,
                        his_content = id.user_email + " đã mua gói " + pakage.package_name + " thành công với giá " + amount,
                        his_datecreate = DateTime.Now
                    };
                    db.Historys.Add(history);
                    db.SaveChanges();


                    Session["idpake"] = null;
                    return RedirectToAction("History");
                }
                else
                {
                    Pay bills = new Pay
                    {
                        pay_datecreate = DateTime.Now,
                        pay_status = false,
                        user_id = id.user_id,
                        pakage_id = pakage.package_id,
                        pay_summoney = amount
                    };
                    db.Pays.Add(bills);
                    db.SaveChanges();
                    Session["idpake"] = null;
                    return RedirectToAction("History");
                }
            }
        }
        public ActionResult History()
        {
            var coo = new FunctionController();
            var id = coo.CookieID();
            Session["idpake"] = null;

            return View(db.Pays.Where(n => n.user_id == id.user_id).OrderByDescending(n=>n.pay_datecreate).ToList());
        }
    }
}