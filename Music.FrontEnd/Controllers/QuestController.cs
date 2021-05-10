using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.Model.EF;

namespace Music.FrontEnd.Controllers
{
    public class QuestController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController functionController = new FunctionController();

        // GET: Quest
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult JoinQuest(int? id)
        {
            return View();
        }

        public ActionResult RedeemPoint()
        {
            return View(db.Packages.Where(n => n.package_active == true && n.package_bin == false && n.package_option == true && (n.package_type == 1 || n.package_type == 3)).OrderBy(n => n.pakage_price).ToList());
        }

        public ActionResult RedeemPointPost(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package package = db.Packages.Find(id);
            if (package == null)
            {
                return HttpNotFound();
            }
            var coo = new FunctionController();
            var user = coo.CookieID();
            db.Users.Find(user.user_id).user_datevip = DateTime.Now.AddMonths((int)package.package_month);
            db.Users.Find(user.user_id).user_vip = true;
            db.Users.Find(user.user_id).user_point -= package.pakage_price;
            db.SaveChanges();
            return Redirect("/Home/Index");
        }
    }
}