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
    public class PaysAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: AdminMain/PaysA
        public ActionResult Index()
        {
            var pays = db.Pays.OrderByDescending(n=>n.pay_datecreate).Include(p => p.Package).Include(p => p.User);
            return View(pays.ToList());
        }

        // GET: AdminMain/PaysA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pay pay = db.Pays.Find(id);
            if (pay == null)
            {
                return HttpNotFound();
            }
            return View(pay);
        }

        // GET: AdminMain/PaysA/Create
        public ActionResult Create()
        {
            ViewBag.pakage_id = new SelectList(db.Packages, "package_id", "package_name");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name");
            return View();
        }

        // POST: AdminMain/PaysA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pay_id,user_id,pakage_id,pay_datecreate,pay_dateexpiration,pay_summoney,pay_active,pay_status")] Pay pay)
        {
            if (ModelState.IsValid)
            {
                db.Pays.Add(pay);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.pakage_id = new SelectList(db.Packages, "package_id", "package_name", pay.pakage_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name", pay.user_id);
            return View(pay);
        }

        // GET: AdminMain/PaysA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pay pay = db.Pays.Find(id);
            if (pay == null)
            {
                return HttpNotFound();
            }
            ViewBag.pakage_id = new SelectList(db.Packages, "package_id", "package_name", pay.pakage_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name", pay.user_id);
            return View(pay);
        }

        // POST: AdminMain/PaysA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pay_id,user_id,pakage_id,pay_datecreate,pay_dateexpiration,pay_summoney,pay_active,pay_status")] Pay pay)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pay).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.pakage_id = new SelectList(db.Packages, "package_id", "package_name", pay.pakage_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name", pay.user_id);
            return View(pay);
        }

        // GET: AdminMain/PaysA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pay pay = db.Pays.Find(id);
            if (pay == null)
            {
                return HttpNotFound();
            }
            return View(pay);
        }

        // POST: AdminMain/PaysA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Pay pay = db.Pays.Find(id);
            db.Pays.Remove(pay);
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
