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
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.Value.ToString("dd/MM/yyyy"),
                    user_datevip = n.user_datevip.Value.ToString("dd/MM/yyyy"),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        public ActionResult Option(int? id)
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
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.Value.ToString("dd/MM/yyyy"),
                    user_datevip = n.user_datevip.Value.ToString("dd/MM/yyyy"),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        public ActionResult Bin(int? id)
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
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.Value.ToString("dd/MM/yyyy"),
                    user_datevip = n.user_datevip.Value.ToString("dd/MM/yyyy"),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }
        public ActionResult Restore(int? id)
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
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.Value.ToString("dd/MM/yyyy"),
                    user_datevip = n.user_datevip.Value.ToString("dd/MM/yyyy"),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id
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
        public ActionResult Create(Music.Model.EF.User user)
        {
            usersDAO.Add(user);
            return RedirectToAction("Index");
        }
    }
}