using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.Model.DAO;
using Music.FrontEnd.Function;

namespace Music.FrontEnd.Controllers
{
    public class MusicsController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        MusicsDAO musicsDAO = new MusicsDAO();

        // GET: Musics
        public ActionResult MyMusisc()
        {
            return View();
        }
        public ActionResult DetailsMusic(int? id)
        {
            var music = db.Musics.Find(id);
            return View(music);
        }

        public ActionResult AllMusic()
        {
            return View();
        }

        public ActionResult HistoryDownload()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Music.Model.EF.Music music, int[] singers, int[] category, HttpPostedFileBase img, HttpPostedFileBase mp3, HttpPostedFileBase mp4)
        {
            if(function.CookieID() == null) 
            {
                return Redirect("/User/Login");    
            }
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
            musicsDAO.Add(music, category, singers);

            return RedirectToAction("MyMusisc");
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

                return RedirectToAction("MyMusisc");
            }
            return View(music);
        }
        public ActionResult RankMusic(string name)
        {
            if(name == "all")
            {
                ViewBag.Note = name;
            }
            else if(name == "100")
            {
                ViewBag.Note = name;
            }
            else if(name == "viet")
            {
                ViewBag.Note = name;

            }
            else if (name == "tre")
            {
                ViewBag.Note = name;
            }
            else if (name == "kpop")
            {
                ViewBag.Note = name;
            }
            else if (name == "aumy")
            {
                ViewBag.Note = name;
            }
            return View();
        }
    }
}