using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.FrontEnd.Controllers;
using Music.Model.DAO;
using Music.FrontEnd.ViewModels;

namespace Music.FrontEnd.Areas.AdminMain.Controllers
{
    public class ViewAController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: AdminMain/ViewA
        public JsonResult GetHistory(int? id)
        {
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MusicProject"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT [his_id]
      ,[user_id]
      ,[his_datecreate]
      ,[his_content]
  FROM [dbo].[Historys]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.Historys.OrderByDescending(n => n.his_datecreate).Select(n => new {
                        content = n.his_content,
                        img = n.User.user_img,
                        date = n.his_datecreate.Value.ToString(),
                        email = n.User.user_email

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            Hubs.HistoryHub.Show();
        }

        public ActionResult StaticPrice()
        {
            return View();
        }

        public PartialViewResult Login()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            var dao = new UsersDAO();
            int status = dao.LoginAdmin(Email, Password);
            switch (status)
            {
                case 1:
                    var user = db.Users.FirstOrDefault(t => t.user_email == Email);
                    HttpCookie cookie = new HttpCookie("admin_id", user.user_id.ToString());
                    cookie.Expires.AddDays(10);
                    Response.Cookies.Set(cookie);
                    return Redirect("/AdminMain/HomeA/Index");
                case -1:
                    TempData["noti_login"] = "Sai tài khoản hoặc mật khẩu!";
                    break;
                case -2:
                    TempData["noti_login"] = "Tài khoản của bạn đã bị xóa!";
                    break;
                case -3:
                    TempData["noti_login"] = "Tài khoản của bạn đã bị khóa!";
                    break;
                default:
                    TempData["noti_login"] = "Tài khoản của bạn không tồn tại!";
                    break;
            }
            return View();
        }
    }
}