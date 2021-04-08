using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.Model.DAO;
using Music.FrontEnd.Function;
using Music.Common;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class MusicsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        MusicsDAO musicsDAO = new MusicsDAO();

        // GET: Admin/MusicsAdmin
        public ActionResult Index()
        {
            return View(db.Musics.Where(n => n.music_bin == false).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Musics.Where(n => n.music_bin == true).ToList());
        }

        public ActionResult Active(int? id)
        {
            Music.Model.EF.Music music = db.Musics.Find(id);
            musicsDAO.Active(id);
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult Option(int? id)
        {
            Music.Model.EF.Music music = db.Musics.Find(id);
            musicsDAO.Option(id);
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult RemoveToBin(int? id)
        {
            Music.Model.EF.Music music = db.Musics.Find(id);
            musicsDAO.Del(id);
            return RedirectToAction("Index");
        }

        public ActionResult Restore(int? id)
        {
            Music.Model.EF.Music music = db.Musics.Find(id);
            musicsDAO.Restore(id);
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Music.Model.EF.Music music, int[] singers, int[] category, int[] authour, HttpPostedFileBase IMG, HttpPostedFileBase MP3, HttpPostedFileBase MP4)
        {
            if (function.CookieID() == null)
            {
                return Redirect("/User/Login");
            }
            var user = function.CookieID();
            music.music_img = imagesfunction.AddImages(IMG, "Music", Guid.NewGuid().ToString());
            if (MP3 != null)
            {
                music.music_linkdow = imagesfunction.AddMuscis(MP3, "MP3", Guid.NewGuid().ToString());
            }
            else if (MP4 != null)
            {
                music.music_video = imagesfunction.AddMuscis(MP4, "MP4", Guid.NewGuid().ToString());
            }
            music.user_id = user.user_id;
            musicsDAO.Add(music, category, singers);

            return RedirectToAction("Index");
        }
        public ActionResult Edit()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.Music music, int[] singers, int[] category, HttpPostedFileBase img, HttpPostedFileBase mp3, HttpPostedFileBase mp4)
        {
            if (function.CookieID() == null)
            {
                return Redirect("/User/Login");
            }
            if (ModelState.IsValid)
            {
                var user = function.CookieID();
                music.music_img = imagesfunction.AddImages(img, "Music", Guid.NewGuid().ToString());
                if (mp3 != null)
                {
                    music.music_linkdow = imagesfunction.AddMuscis(mp3, "MP3", Guid.NewGuid().ToString());
                }
                else if (mp4 != null)
                {
                    music.music_video = imagesfunction.AddMuscis(mp4, "MP4", Guid.NewGuid().ToString());
                }
                music.user_id = user.user_id;
                musicsDAO.Edit(music, category, singers);

                return RedirectToAction("Index");
            }
            return View(music);
        }

        public ActionResult Details(int ? id)
        {
            var music = db.Musics.Find(id);
            return View(music);
        }
    }
}