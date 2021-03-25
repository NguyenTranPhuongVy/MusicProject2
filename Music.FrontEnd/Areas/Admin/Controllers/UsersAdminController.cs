using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.DAO;
using Music.Model.EF;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;
using Music.Common;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class UsersAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/UsersAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Users.Where(n => n.user_bin == true).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new UsersDAO();
            if (dao.Active(id))
            {
                List<User> users = db.Users.Where(n => n.user_bin == false).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.Value.ToString("dd/MM/yyyy"),
                    user_datelogin = n.user_datelogin.Value.ToString("dd/MM/yyyy"),
                    user_deadline = n.user_deadline.Value.ToString("dd/MM/yyyy"),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        public JsonResult Option(int? id)
        {
            var dao = new UsersDAO();
            if (dao.Option(id))
            {
                List<User> users = db.Users.Where(n => n.user_bin == false).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.Value.ToString("dd/MM/yyyy"),
                    user_datelogin = n.user_datelogin.Value.ToString("dd/MM/yyyy"),
                    user_deadline = n.user_deadline.Value.ToString("dd/MM/yyyy"),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm thêm
        [HttpPost]
        public ActionResult Add(User user, HttpPostedFileBase IMG, string del)
        {
            //Cập nhật có thay đổi
            user.user_option = true;
            user.user_bin = false;

            //Kiem tra thay đổi value

            if (user.user_active != true && user.user_active != false)
            {
                user.user_active = false;
            }

            //Hinh ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_USER, code);
                user.user_img = code + IMG.FileName;
            }
            else
            {

                user.user_img = "notImg.png";
            }

            var dao = new UsersDAO();
            var j = new JsonAdminController();

            if (dao.Add(user))
            {
                return Redirect("/Admin/UsersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User user, HttpPostedFileBase IMG)
        {
            User us = db.Users.Find(user.user_id);

            user.user_active = us.user_active;
            user.user_datecreate = us.user_datecreate;
            user.user_datelogin = DateTime.Now;
            user.user_bin = us.user_bin;
            user.user_option = us.user_option;
            user.user_code = us.user_code;
            user.user_token = us.user_token;

            var i = new ImagesController();
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_USER, code);
                user.user_img = code + IMG.FileName;
            }
            else
            {
                user.user_img = us.user_img;
            }


            var dao = new UsersDAO();
            if (dao.Edit(user))
            {
                return Redirect("/Admin/UsersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Thùng rác
        [HttpGet]
        public JsonResult Del(int? id)
        {
            var dao = new UsersDAO();
            if (dao.Del(id))
            {
                List<User> users = db.Users.Where(n => n.user_bin == false).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_datelogin = n.user_datelogin.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_deadline = n.user_deadline.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Khôi Phục
        [HttpGet]
        public JsonResult Restore(int? id)
        {
            var dao = new UsersDAO();
            if (dao.Restore(id))
            {
                List<User> users = db.Users.Where(n => n.user_bin == true).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_datelogin = n.user_datelogin.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_deadline = n.user_deadline.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteUser(int? id)
        {
            var dao = new UsersDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<User> users = db.Users.Where(n => n.user_bin == true).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_datelogin = n.user_datelogin.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_deadline = n.user_deadline.Value.ToString("dd/MM/yyyy hh:mm:ss"),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }
    }
}