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
    public class NationalsAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: AdminMain/NationalsA
        public ActionResult Index()
        {
            return View(db.Nationals.Where(n => n.nation_bin == false).OrderByDescending(n=>n.nation_datecreate).ToList());
        }

        // GET: AdminMain/NationalsA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            National national = db.Nationals.Find(id);
            if (national == null)
            {
                return HttpNotFound();
            }
            return View(national);
        }

        // GET: AdminMain/NationalsA/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminMain/NationalsA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "nation_id,nation_name,nation_active,nation_bin,nation_datecreate,nation_dateupdate,nation_option")] National national)
        {
            if (ModelState.IsValid)
            {
                national.nation_bin = false;
                national.nation_datecreate = DateTime.Now;
                db.Nationals.Add(national);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(national);
        }

        // GET: AdminMain/NationalsA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            National national = db.Nationals.Find(id);
            if (national == null)
            {
                return HttpNotFound();
            }
            return View(national);
        }

        // POST: AdminMain/NationalsA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "nation_id,nation_name,nation_active,nation_bin,nation_datecreate,nation_dateupdate,nation_option")] National national)
        {
            if (ModelState.IsValid)
            {
                national.nation_dateupdate = DateTime.Now;
                db.Entry(national).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(national);
        }

        // GET: AdminMain/NationalsA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            National national = db.Nationals.Find(id);
            if (national == null)
            {
                return HttpNotFound();
            }
            db.Nationals.Find(id).nation_bin = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ChangeActive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.National national = db.Nationals.Find(id);
            if (national == null)
            {
                return HttpNotFound();
            }
            db.Nationals.Find(id).nation_active = !db.Nationals.Find(id).nation_active;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ChangeOption(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.National national = db.Nationals.Find(id);
            if (national == null)
            {
                return HttpNotFound();
            }
            db.Nationals.Find(id).nation_option = !db.Nationals.Find(id).nation_option;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        // POST: AdminMain/NationalsA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            National national = db.Nationals.Find(id);
            db.Nationals.Remove(national);
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
