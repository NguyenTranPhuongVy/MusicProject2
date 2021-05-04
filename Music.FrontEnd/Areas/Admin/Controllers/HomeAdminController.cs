    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Models;
using Music.FrontEnd.ViewModels;
using Music.Model.EF;
using Music.Model.DAO;
using Music.FrontEnd.Function;
namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        UsersDAO usersDAO = new UsersDAO();
        FunctionController function = new FunctionController();
        FilesController images = new FilesController();
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoginAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginAdmin(ViewLogin login)
        {
            if (function.CookieID() != null)
            {
                return Redirect("/");
            }
            if (ModelState.IsValid)
            {
                int status = usersDAO.Login(login.Email, login.Password);
                switch (status)
                {
                    case 1:
                        var user = db.Users.FirstOrDefault(t => t.user_email == login.Email);
                        HttpCookie cookie = new HttpCookie("Admin", user.user_id.ToString());
                        cookie.Expires.AddDays(10);
                        Response.Cookies.Set(cookie);
                        return Redirect("/Admin/HomeAdmin/Index");
                        if(user.role_id != 2)
                        {
                            return Redirect("/Home/Index");
                        }    
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
            }
            return View(login);
        }

        public ActionResult LogoffAdmin()
        {
            HttpCookie cookie = Request.Cookies["Admin"];
            cookie.Expires = DateTime.Now.AddDays(-10d);
            //Request.Cookies.Set(cookie);
            Response.SetCookie(cookie);
            return RedirectToAction("LoginAdmin");
        }

    }
}