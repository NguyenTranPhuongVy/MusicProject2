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
    public class AlbumsAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        private FilesController filesController = new FilesController();

        // GET: AdminMain/AlbumsA
        public ActionResult Index()
        {
            var albums = db.Albums.Where(t => t.album_bin == false).OrderByDescending(n=>n.album_datecreate).Include(a => a.User);
            return View(albums.ToList());
        }

        // GET: AdminMain/AlbumsA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.Albums.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            return View(album);
        }

        // GET: AdminMain/AlbumsA/Create
        public ActionResult Create()
        {
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name");
            return View();
        }

        // POST: AdminMain/AlbumsA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "album_id,album_name,album_datecreate,album_dateedit,album_view,album_favorite,album_active,album_bin,album_note,album_img,user_id")] Album album, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                album.album_bin = false;
                album.album_datecreate = DateTime.Now;
                album.album_img = filesController.AddImages(img, "Album", Guid.NewGuid().ToString());
                db.Albums.Add(album);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name", album.user_id);
            return View(album);
        }

        // GET: AdminMain/AlbumsA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.Albums.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name", album.user_id);
            return View(album);
        }

        // POST: AdminMain/AlbumsA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "album_id,album_name,album_datecreate,album_dateedit,album_view,album_favorite,album_active,album_bin,album_note,album_img,user_id")] Album album, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                album.album_dateedit = DateTime.Now;
                if(img != null)
                {
                    album.album_img = filesController.AddImages(img, "Album", Guid.NewGuid().ToString());
                }
                db.Entry(album).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_name", album.user_id);
            return View(album);
        }

        // GET: AdminMain/AlbumsA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.Albums.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            db.Albums.Find(id).album_bin = true;
            db.SaveChanges();
            return Redirect("Index");
        }

        public ActionResult ChangeActive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Album slider = db.Albums.Find(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            db.Albums.Find(id).album_active = !db.Albums.Find(id).album_active;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        // POST: AdminMain/AlbumsA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Album album = db.Albums.Find(id);
            db.Albums.Remove(album);
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
