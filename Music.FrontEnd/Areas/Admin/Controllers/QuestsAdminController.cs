using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class QuestsAdminController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: Admin/QuestsAdmin
        public ActionResult Index()
        {
             return View();
        }

        // GET: Admin/QuestsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Quest quest = db.Quests.Find(id);
            if (quest == null)
            {
                return HttpNotFound();
            }
            return View(quest);
        }

        // GET: Admin/QuestsAdmin/Create
        //public ActionResult Create()
        //{
        //    ViewBag.quest_category = new SelectList(db.Categories, "category_id", "category_name");
        //    ViewBag.quest_top1 = new SelectList(db.Coupons, "coupons_id", "coupons_title");
        //    ViewBag.quest_top2 = new SelectList(db.Coupons, "coupons_id", "coupons_title");
        //    ViewBag.quest_top3 = new SelectList(db.Coupons, "coupons_id", "coupons_title");
        //    ViewBag.quest_gift = new SelectList(db.Coupons, "coupons_id", "coupons_title");
        //    ViewBag.quest_national = new SelectList(db.Nationals, "nation_id", "nation_name");
        //    ViewBag.quest_singer = new SelectList(db.Singers, "singer_id", "singer_name");
        //    return View();
        //}

        // POST: Admin/QuestsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "quest_id,quest_limit,quest_datecreate,quest_dateend,quest_active,quest_category,quest_national,quest_singer,quest_title,quest_top1,quest_top2,quest_top3,quest_gift")] Quest quest)
        {
            quest.quest_active = true;
            db.Quests.Add(quest);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/QuestsAdmin/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Quest quest = db.Quests.Find(id);
        //    if (quest == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.quest_category = new SelectList(db.Categories, "category_id", "category_name", quest.quest_category);
        //    ViewBag.quest_top1 = new SelectList(db.Coupons, "coupons_id", "coupons_title", quest.quest_top1);
        //    ViewBag.quest_top2 = new SelectList(db.Coupons, "coupons_id", "coupons_title", quest.quest_top2);
        //    ViewBag.quest_top3 = new SelectList(db.Coupons, "coupons_id", "coupons_title", quest.quest_top3);
        //    ViewBag.quest_gift = new SelectList(db.Coupons, "coupons_id", "coupons_title", quest.quest_gift);
        //    ViewBag.quest_national = new SelectList(db.Nationals, "nation_id", "nation_name", quest.quest_national);
        //    ViewBag.quest_singer = new SelectList(db.Singers, "singer_id", "singer_name", quest.quest_singer);
        //    return View(quest);
        //}

        // POST: Admin/QuestsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "quest_id,quest_limit,quest_datecreate,quest_dateend,quest_active,quest_category,quest_national,quest_singer,quest_title,quest_top1,quest_top2,quest_top3,quest_gift")] Quest quest)
        {
            db.Entry(quest).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/QuestsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Quest quest = db.Quests.Find(id);
            if (quest == null)
            {
                return HttpNotFound();
            }
            return View(quest);
        }

        // POST: Admin/QuestsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Quest quest = db.Quests.Find(id);
            db.Quests.Remove(quest);
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
