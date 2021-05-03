using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.Model.DAO;
using Music.FrontEnd.Function;
using Music.Common;
using Music.FrontEnd.Models;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class UsersAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        UsersDAO usersDAO = new UsersDAO();
        // GET: Admin/UsersAdmin
        public ActionResult Index()
        {
            return View(db.Users.Where(n => n.user_bin == false).OrderBy(n => n.user_name).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Users.Where(n => n.user_bin == true).OrderBy(n => n.user_name).ToList());
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
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
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
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

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
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }
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
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Music.Model.EF.User user, HttpPostedFileBase IMG)
        {
            user.user_bin = false;

            if (user.user_active != true && user.user_active != false)
            {
                user.user_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_USER, code);
                user.user_img = code + IMG.FileName;
            }
            else
            {
                user.user_img = "notImg.png";
            }

            if (usersDAO.Add(user))
            {
                return Redirect("/Admin/UsersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
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
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.User user, HttpPostedFileBase IMG, string del)
        {
            User us = db.Users.Find(user.user_id);
            user.user_bin = false;
            user.user_active = true;
            user.user_option = true;
            user.user_datecreate = us.user_datecreate;
            user.user_datelogin = DateTime.Now;
            user.user_id = us.user_id;
            user.user_point = us.user_point;
            user.user_vip = us.user_vip;
            user.user_token = Guid.NewGuid().ToString();
            user.user_datevip = us.user_datevip;
            user.user_deadline = us.user_deadline;
            user.user_note = us.user_note;
            user.user_code = us.user_code;

            if (user.user_active != true && user.user_active != false)
            {
                user.user_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_USER, code);
                user.user_img = code + IMG.FileName;
            }
            else
            {
                user.user_img = us.user_img;
            }

            if (usersDAO.Edit(user))
            {
                return Redirect("/Admin/UsersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }
    }
}