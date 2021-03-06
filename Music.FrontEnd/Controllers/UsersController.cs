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
        FilesController images = new FilesController();
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

                user.role_id = 1;
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
                        Response.Cookies.Set(cookie);
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

        public ActionResult Logoff()
        {
            HttpCookie cookie = Request.Cookies["user_id"];
            cookie.Expires = DateTime.Now.AddDays(-10d);
            //Request.Cookies.Set(cookie);
            Response.SetCookie(cookie);
            return RedirectToAction("Login");
        }

        public ActionResult Profile()
        {
            if (function.CookieID() == null)
            {
                return RedirectToAction("Login");
            }
            return View();
        }
        [HttpPost]
        public JsonResult Edit(User user, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                user.user_img = images.AddImages(img, "User", Guid.NewGuid().ToString());
                usersDAO.Edit(user);

                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ResetPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ResetPassword(ViewResetPassword resetPassword)
        {
            if (function.CookieID() != null)
            {
                return Redirect("/");
            }
            else if (ModelState.IsValid)
            {
                var cookie = function.CookieID();
                if(resetPassword.OldPassword == db.Users.Find(cookie.user_id).user_pass)
                {
                    usersDAO.ResetPassword(cookie.user_id, resetPassword.NewPassword);
                    return Redirect("/");
                }
            }
            return View(resetPassword);
        }
        public ActionResult EditImages(HttpPostedFileBase IMG)
        {
            var id = function.CookieID();
            User user = db.Users.Find(id.user_id);

            if (IMG == null)
            {
                user.user_img = id.user_img;
            }
            else
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_USER, code);
                user.user_img = code + IMG.FileName;
            }

            db.SaveChanges();
            return Redirect("/Users/Profile");
        }
        public JsonResult EditAll(string name, string phone)
        {

            var id = function.CookieID();
            User user = db.Users.Find(id.user_id);

            if (name != null)
            {
                user.user_name = name;
            }
            else if(phone != null)
            {
                user.user_phone = phone;
            }
            else
            {

            }
            db.SaveChanges();


            var list = from item in db.Users
                       where item.user_id == id.user_id
                       select new
                       {
                           name = item.user_name,
                           phone = item.user_phone

                       };
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}