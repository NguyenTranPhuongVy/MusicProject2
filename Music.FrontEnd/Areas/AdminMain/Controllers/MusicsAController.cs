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
using Music.Model.DAO;

namespace Music.FrontEnd.Areas.AdminMain.Controllers
{
    public class MusicsAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        private FilesController filesController = new FilesController();
        FunctionController function = new FunctionController();
        private MusicsDAO musicsDAO = new MusicsDAO();

        // GET: AdminMain/MusicsA
        public ActionResult Index()
        {
            var musics = db.Musics.Where(n=>n.User.role_id == 2 && n.music_bin == false).OrderByDescending(n=>n.music_datecreate).Include(m => m.Album).Include(m => m.Author).Include(m => m.Genre).Include(m => m.National);
            return View(musics.ToList());
        }
        public ActionResult IndexVip()
        {
            var musics = db.Musics.Where(n => n.User.role_id == 1 && n.User.user_vip == true && n.music_bin == false).OrderByDescending(n => n.music_datecreate).Include(m => m.Album).Include(m => m.Author).Include(m => m.Genre).Include(m => m.National);
            return View(musics.ToList());
        }

        // GET: AdminMain/MusicsA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Music music = db.Musics.Find(id);
            if (music == null)
            {
                return HttpNotFound();
            }
            return View(music);
        }

        // GET: AdminMain/MusicsA/Create
        public ActionResult Create()
        {
            ViewBag.album_id = new SelectList(db.Albums, "album_id", "album_name");
            ViewBag.author_id = new SelectList(db.Authors, "author_id", "author_name");
            ViewBag.genres_id = new SelectList(db.Genres, "genres_id", "genres_name");
            ViewBag.nation_id = new SelectList(db.Nationals, "nation_id", "nation_name");
            return View();
        }

        // POST: AdminMain/MusicsA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "music_id,music_name,music_img,music_lyric,music_time,music_view,music_dowload,user_id,music_linkdow,music_datecreate,music_dateedit,music_active,music_bin,music_option,nation_id,music_video,genres_id,author_id,album_id")] Music.Model.EF.Music music, HttpPostedFileBase img, HttpPostedFileBase link_mp3, HttpPostedFileBase link_video, int[] category, int[] singers, int[] album)
        {
            music.music_bin = false;
            music.music_datecreate = DateTime.Now;
            music.user_id = function.CookieID().user_id;
            if (ModelState.IsValid)
            {
                music.music_img = filesController.AddImages(img, "Music", Guid.NewGuid().ToString());
                if (link_mp3 != null)
                {
                    music.music_linkdow = filesController.AddMuscis(link_mp3, "MP3", Guid.NewGuid().ToString());
                }
                else if (link_video != null)
                {
                    music.music_video = filesController.AddMuscis(link_video, "MP4", Guid.NewGuid().ToString());
                }
                musicsDAO.Add(music, category, singers, album);
                return RedirectToAction("Index");
            }

            ViewBag.album_id = new SelectList(db.Albums, "album_id", "album_name", music.album_id);
            ViewBag.author_id = new SelectList(db.Authors, "author_id", "author_name", music.author_id);
            ViewBag.genres_id = new SelectList(db.Genres, "genres_id", "genres_name", music.genres_id);
            ViewBag.nation_id = new SelectList(db.Nationals, "nation_id", "nation_name", music.nation_id);
            return View(music);
        }

        // GET: AdminMain/MusicsA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Music music = db.Musics.Find(id);
            if (music == null)
            {
                return HttpNotFound();
            }
            ViewBag.album_id = new SelectList(db.Albums, "album_id", "album_name", music.album_id);
            ViewBag.author_id = new SelectList(db.Authors, "author_id", "author_name", music.author_id);
            ViewBag.genres_id = new SelectList(db.Genres, "genres_id", "genres_name", music.genres_id);
            ViewBag.nation_id = new SelectList(db.Nationals, "nation_id", "nation_name", music.nation_id);
            return View(music);
        }

        // POST: AdminMain/MusicsA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "music_id,music_name,music_img,music_lyric,music_time,music_view,music_dowload,user_id,music_linkdow,music_datecreate,music_dateedit,music_active,music_bin,music_option,nation_id,music_video,genres_id,author_id,album_id")] Music.Model.EF.Music music, HttpPostedFileBase img, HttpPostedFileBase link_mp3, HttpPostedFileBase link_video, int[] category, int[] singers, int[] album)
        {
            if (ModelState.IsValid)
            {
                if(img != null)
                {
                    music.music_img = filesController.AddImages(img, "Music", Guid.NewGuid().ToString());
                }
                if (link_mp3 != null)
                {
                    music.music_linkdow = filesController.AddMuscis(link_mp3, "MP3", Guid.NewGuid().ToString());
                }
                else if (link_video != null)
                {
                    music.music_video = filesController.AddMuscis(link_video, "MP4", Guid.NewGuid().ToString());
                }
                music.music_dateedit = DateTime.Now;
                musicsDAO.Edit(music, category, singers, album);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.album_id = new SelectList(db.Albums, "album_id", "album_name", music.album_id);
            ViewBag.author_id = new SelectList(db.Authors, "author_id", "author_name", music.author_id);
            ViewBag.genres_id = new SelectList(db.Genres, "genres_id", "genres_name", music.genres_id);
            ViewBag.nation_id = new SelectList(db.Nationals, "nation_id", "nation_name", music.nation_id);
            return View(music);
        }

        // GET: AdminMain/MusicsA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Music music = db.Musics.Find(id);
            if (music == null)
            {
                return HttpNotFound();
            }
            db.Musics.Find(id).music_bin = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult DeleteVip(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Music music = db.Musics.Find(id);
            if (music == null)
            {
                return HttpNotFound();
            }
            db.Musics.Find(id).music_bin = true;
            db.SaveChanges();
            return RedirectToAction("IndexVip");
        }
        public ActionResult ChangeActive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Music music = db.Musics.Find(id);
            if (music == null)
            {
                return HttpNotFound();
            }
            db.Musics.Find(id).music_active = !db.Musics.Find(id).music_active;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ChangeOption(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Music music = db.Musics.Find(id);
            if (music == null)
            {
                return HttpNotFound();
            }
            db.Musics.Find(id).music_option = !db.Musics.Find(id).music_option;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        // POST: AdminMain/MusicsA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Music.Model.EF.Music music = db.Musics.Find(id);
            db.Musics.Remove(music);
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
