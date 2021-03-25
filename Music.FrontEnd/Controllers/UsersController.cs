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

namespace Music.FrontEnd.Controllers
{
    public class UsersController : Controller
    {
        UsersDAO usersDAO = new UsersDAO();
        FunctionController function = new FunctionController();
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Users
        public ActionResult Registration()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registration(ViewRegister register)
        {
            if (ModelState.IsValid)
            {
                if (db.Users.SingleOrDefault(t => t.user_email == register.Email) != null)
                {
                    TempData["noti_register"] = "Email đã tồn tại!";
                    return View(register);
                }
                var user = new User()
                {
                    user_email = register.Email,
                    user_pass = register.Password,
                    user_name = register.DisplayName
                };
                usersDAO.Add(user);

                return RedirectToAction("Login");
            }
            return View(register);
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(ViewLogin login)
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
                        HttpCookie cookie = new HttpCookie("user_id", user.user_id.ToString());
                        cookie.Expires.AddDays(10);
                        Request.Cookies.Add(cookie);
                        return Redirect("/");
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

        public ActionResult Profile()
        {
            if (function.CookieID() == null)
            {
                return RedirectToAction("Login");
            }
            return View(function.CookieID());
        }
    }
}