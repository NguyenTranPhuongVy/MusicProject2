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
    public class QuestsAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: AdminMain/QuestsA
        public ActionResult Index()
        {
            var quests = db.Quests.Include(q => q.Category).Include(q => q.National).Include(q => q.Singer);
            return View(quests.ToList());
        }

        // GET: AdminMain/QuestsA/Details/5
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

        // GET: AdminMain/QuestsA/Create
        public ActionResult Create()
        {
            ViewBag.quest_category = new SelectList(db.Categories, "category_id", "category_name");
            ViewBag.quest_national = new SelectList(db.Nationals, "nation_id", "nation_name");
            ViewBag.quest_singer = new SelectList(db.Singers, "singer_id", "singer_name");
            return View();
        }

        // POST: AdminMain/QuestsA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "quest_id,quest_limit,quest_datecreate,quest_dateend,quest_active,quest_category,quest_national,quest_singer,quest_title,quest_top1,quest_top2,quest_top3,quest_gift")] Quest quest)
        {
            if (ModelState.IsValid)
            {
                quest.quest_active = true;
                db.Quests.Add(quest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.quest_category = new SelectList(db.Categories, "category_id", "category_name", quest.quest_category);
            ViewBag.quest_national = new SelectList(db.Nationals, "nation_id", "nation_name", quest.quest_national);
            ViewBag.quest_singer = new SelectList(db.Singers, "singer_id", "singer_name", quest.quest_singer);
            return View(quest);
        }

        // GET: AdminMain/QuestsA/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.quest_category = new SelectList(db.Categories, "category_id", "category_name", quest.quest_category);
            ViewBag.quest_national = new SelectList(db.Nationals, "nation_id", "nation_name", quest.quest_national);
            ViewBag.quest_singer = new SelectList(db.Singers, "singer_id", "singer_name", quest.quest_singer);
            return View(quest);
        }

        // POST: AdminMain/QuestsA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "quest_id,quest_limit,quest_datecreate,quest_dateend,quest_active,quest_category,quest_national,quest_singer,quest_title,quest_top1,quest_top2,quest_top3,quest_gift")] Quest quest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(quest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.quest_category = new SelectList(db.Categories, "category_id", "category_name", quest.quest_category);
            ViewBag.quest_national = new SelectList(db.Nationals, "nation_id", "nation_name", quest.quest_national);
            ViewBag.quest_singer = new SelectList(db.Singers, "singer_id", "singer_name", quest.quest_singer);
            return View(quest);
        }

        // GET: AdminMain/QuestsA/Delete/5
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

        // POST: AdminMain/QuestsA/Delete/5
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
