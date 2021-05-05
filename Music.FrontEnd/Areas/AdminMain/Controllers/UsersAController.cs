using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;

namespace Music.FrontEnd.Areas.AdminMain.Controllers
{
    public class UsersAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: AdminMain/UsersA
        public ActionResult IndexVip()
        {
            var users = db.Users.Where(n => n.role_id == 1 && n.user_vip == true).OrderByDescending(n => n.user_datecreate).Include(u => u.Role);
            return View(users.ToList());
        }
        public ActionResult IndexAdmin()
        {
            var users = db.Users.Where(n => n.role_id == 2).OrderByDescending(n => n.user_datecreate).Include(u => u.Role);
            return View(users.ToList());
        }
        public ActionResult Index()
        {
            var users = db.Users.Where(n=>n.role_id == 1 && n.user_vip == false).OrderByDescending(n=>n.user_datecreate).Include(u => u.Role);
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
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name");
            return View();
        }

        // POST: AdminMain/UsersA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "user_id,user_name,user_img,user_email,user_pass,user_token,user_datecreate,user_datelogin,user_active,user_option,user_bin,user_code,user_point,user_deadline,user_birth,user_phone,user_note,user_address,user_vip,user_datevip,role_id")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
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
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            return View(user);
        }

        // POST: AdminMain/UsersA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "user_id,user_name,user_img,user_email,user_pass,user_token,user_datecreate,user_datelogin,user_active,user_option,user_bin,user_code,user_point,user_deadline,user_birth,user_phone,user_note,user_address,user_vip,user_datevip,role_id")] User user)
        {
            if (ModelState.IsValid)
            {
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
            return View(user);
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
