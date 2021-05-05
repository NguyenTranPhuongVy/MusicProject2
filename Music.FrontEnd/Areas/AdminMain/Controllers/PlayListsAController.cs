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
    public class PlayListsAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();

        // GET: AdminMain/PlayListsA
        public ActionResult Index()
        {
            var playLists = db.PlayLists.Include(p => p.Album).Include(p => p.Music);
            return View(playLists.OrderByDescending(n=>n.playlist_datecreate).ToList());
        }

        // GET: AdminMain/PlayListsA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlayList playList = db.PlayLists.Find(id);
            if (playList == null)
            {
                return HttpNotFound();
            }
            return View(playList);
        }

        // GET: AdminMain/PlayListsA/Create
        public ActionResult Create()
        {
            ViewBag.albums_id = new SelectList(db.Albums, "album_id", "album_name");
            ViewBag.music_id = new SelectList(db.Musics, "music_id", "music_name");
            return View();
        }

        // POST: AdminMain/PlayListsA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "playlist_id,albums_id,music_id,playlist_datecreate")] PlayList playList)
        {
            if (ModelState.IsValid)
            {
                db.PlayLists.Add(playList);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.albums_id = new SelectList(db.Albums, "album_id", "album_name", playList.albums_id);
            ViewBag.music_id = new SelectList(db.Musics, "music_id", "music_name", playList.music_id);
            return View(playList);
        }

        // GET: AdminMain/PlayListsA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlayList playList = db.PlayLists.Find(id);
            if (playList == null)
            {
                return HttpNotFound();
            }
            ViewBag.albums_id = new SelectList(db.Albums, "album_id", "album_name", playList.albums_id);
            ViewBag.music_id = new SelectList(db.Musics, "music_id", "music_name", playList.music_id);
            return View(playList);
        }

        // POST: AdminMain/PlayListsA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "playlist_id,albums_id,music_id,playlist_datecreate")] PlayList playList)
        {
            if (ModelState.IsValid)
            {
                db.Entry(playList).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.albums_id = new SelectList(db.Albums, "album_id", "album_name", playList.albums_id);
            ViewBag.music_id = new SelectList(db.Musics, "music_id", "music_name", playList.music_id);
            return View(playList);
        }

        // GET: AdminMain/PlayListsA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlayList playList = db.PlayLists.Find(id);
            if (playList == null)
            {
                return HttpNotFound();
            }
            return View(playList);
        }

        // POST: AdminMain/PlayListsA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PlayList playList = db.PlayLists.Find(id);
            db.PlayLists.Remove(playList);
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
