﻿using System;
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
    public class SingersAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: AdminMain/SingersA
        public ActionResult Index()
        {
            return View(db.Singers.OrderByDescending(n=>n.singer_name).ToList());
        }

        // GET: AdminMain/SingersA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Singer singer = db.Singers.Find(id);
            if (singer == null)
            {
                return HttpNotFound();
            }
            return View(singer);
        }

        // GET: AdminMain/SingersA/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminMain/SingersA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "singer_id,singer_name,singer_active,singer_bin,singer_note,singer_img,singer_datecreate,singer_dateupdate")] Singer singer)
        {
            if (ModelState.IsValid)
            {
                db.Singers.Add(singer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(singer);
        }

        // GET: AdminMain/SingersA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Singer singer = db.Singers.Find(id);
            if (singer == null)
            {
                return HttpNotFound();
            }
            return View(singer);
        }

        // POST: AdminMain/SingersA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "singer_id,singer_name,singer_active,singer_bin,singer_note,singer_img,singer_datecreate,singer_dateupdate")] Singer singer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(singer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(singer);
        }

        // GET: AdminMain/SingersA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Singer singer = db.Singers.Find(id);
            if (singer == null)
            {
                return HttpNotFound();
            }
            return View(singer);
        }

        // POST: AdminMain/SingersA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Singer singer = db.Singers.Find(id);
            db.Singers.Remove(singer);
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
