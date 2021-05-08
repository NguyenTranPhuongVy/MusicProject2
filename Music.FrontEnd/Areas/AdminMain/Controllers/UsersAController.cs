using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.Model.EF;

namespace Music.FrontEnd.Areas.AdminMain.Controllers
{
    public class UsersAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        private FilesController filesController = new FilesController();

        // GET: AdminMain/UsersA
        public ActionResult IndexVip()
        {
            var users = db.Users.Where(n => n.role_id == 1 && n.user_vip == true && n.user_bin == false).OrderByDescending(n => n.user_datecreate).Include(u => u.Role);
            return View(users.ToList());
        }
        public ActionResult IndexAdmin()
        {
            var users = db.Users.Where(n => n.role_id == 2 && n.user_bin == false).OrderByDescending(n => n.user_datecreate).Include(u => u.Role);
            return View(users.ToList());
        }
        public ActionResult Index()
        {
            var users = db.Users.Where(n=>n.role_id == 1 && n.user_vip == false && n.user_bin == false).OrderByDescending(n=>n.user_datecreate).Include(u => u.Role);
            return View(users.ToList());
        }

        // GET: AdminMain/UsersA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: AdminMain/UsersA/Create
        public ActionResult Create()
        {
            ViewBag.roleCreate = 1;
            return View();
        }

        public ActionResult CreateUserVip()
        {
            ViewBag.roleCreate = 2;
            return View("Create");
        }

        public ActionResult CreateAdmin()
        {
            ViewBag.roleCreate = 3;
            return View("Create");
        }


        // POST: AdminMain/UsersA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "user_id,user_name,user_img,user_email,user_pass,user_token,user_datecreate,user_datelogin,user_active,user_option,user_bin,user_code,user_point,user_deadline,user_birth,user_phone,user_note,user_address,user_vip,user_datevip,role_id")] User user, HttpPostedFileBase file_img, string url)
        {
            Random r = new Random();
            if(db.Users.FirstOrDefault(x => x.user_email == user.user_email) != null)
            {
                ViewBag.noti_failed = "Email đã tồn tại!";
            }
            else
            {
                if(file_img != null)
                {
                    user.user_img = filesController.AddImages(file_img, "Users", Guid.NewGuid().ToString());
                }
                user.user_datecreate = DateTime.Now;
                user.user_datelogin = DateTime.Now;
                user.user_active = true;
                user.user_bin = false;
                user.user_option = true;
                user.user_token = Guid.NewGuid().ToString();
                do
                {
                    user.user_code = "#music-" + r;
                } while (db.Users.Where(t => t.user_code == user.user_code) != null);
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction(url);
            }
            
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            return View(user);
        }

        // GET: AdminMain/UsersA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.roleCreate = 1;
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            return View(user);
        }

        public ActionResult EditUserVip(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.roleCreate = 2;
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            return View("Edit", user);
        }

        public ActionResult EditAdmin(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.roleCreate = 3;
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            return View("Edit", user);
        }

        // POST: AdminMain/UsersA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "user_id,user_name,user_img,user_email,user_pass,user_token,user_datecreate,user_datelogin,user_active,user_option,user_bin,user_code,user_point,user_deadline,user_birth,user_phone,user_note,user_address,user_vip,user_datevip,role_id")] User user, HttpPostedFileBase IMG)
        {
            if (ModelState.IsValid)
            {
                //Chèn ảnh
                if (IMG != null)
                {
                    var code = Guid.NewGuid().ToString();
                    var img = new FilesController();
                    img.AddImages(IMG, Common.Link.IMG_USER, code);
                    user.user_img = code + IMG.FileName;
                }
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            return View(user);
        }

        // GET: AdminMain/UsersA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            db.Users.Find(id).user_bin = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DeleteVip(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            db.Users.Find(id).user_bin = true;
            db.SaveChanges();
            return RedirectToAction("IndexVip");
        }

        public ActionResult DeleteAdmin(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            db.Users.Find(id).user_bin = true;
            db.SaveChanges();
            return RedirectToAction("IndexAdmin");
        }

        public ActionResult ChangeActive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            db.Users.Find(id).user_active = !db.Users.Find(id).user_active;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ChangeOption(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            db.Users.Find(id).user_option = !db.Users.Find(id).user_option;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        // POST: AdminMain/UsersA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
