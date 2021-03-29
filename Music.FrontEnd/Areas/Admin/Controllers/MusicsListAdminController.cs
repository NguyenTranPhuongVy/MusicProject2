using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.DAO;
using Music.Model.EF;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;
using Music.Common;
using Music.FrontEnd.Areas.Admin.Controllers;

namespace Music.Frontend.Areas.Admin.Controllers
{
    public class MusicsListAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/MusicsListAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Musics.Where(n => n.music_bin == true).ToList());
        }

        public ActionResult Censorship()
        {
            return View(db.Musics.Where(n => n.music_active == false && n.music_option == true && n.music_bin == false).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new MusicsDAO();
            if (dao.Active(id))
            {
                List<Music.Model.EF.Music> musics = db.Musics.Where(n => n.music_bin == false).OrderBy(n => n.music_name).ToList();
                List<jMusics> list = musics.Select(n => new jMusics
                {
                    music_active = n.music_active,
                    music_dowload = n.music_dowload,
                    music_bin = n.music_bin,
                    music_datecreate = n.music_datecreate.Value.ToString("dd/MM/yyyy"),
                    music_dateedit = n.music_dateedit.Value.ToString("dd/MM/yyyy"),
                    music_id = n.music_id,
                    music_img = n.music_img,
                    music_linkdow = n.music_linkdow,
                    music_lyric = n.music_lyric,
                    music_mp3 = n.music_mp3,
                    music_name = n.music_name,
                    music_option = n.music_option,
                    music_time = n.music_time,
                    music_video = n.music_video,
                    music_view = n.music_view,
                    author_id = n.author_id,
                    genres_id = n.genres_id,
                    nation_id = n.nation_id,
                    singer_id = n.singer_id,
                    user_id = n.user_id,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        public JsonResult Option(int? id)
        {
            var dao = new MusicsDAO();
            if (dao.Option(id))
            {
                List<Music.Model.EF.Music> musics = db.Musics.Where(n => n.music_bin == false).OrderBy(n => n.music_name).ToList();
                List<jMusics> list = musics.Select(n => new jMusics
                {
                    music_active = n.music_active,
                    music_dowload = n.music_dowload,
                    music_bin = n.music_bin,
                    music_datecreate = n.music_datecreate.Value.ToString("dd/MM/yyyy"),
                    music_dateedit = n.music_dateedit.Value.ToString("dd/MM/yyyy"),
                    music_id = n.music_id,
                    music_img = n.music_img,
                    music_linkdow = n.music_linkdow,
                    music_lyric = n.music_lyric,
                    music_mp3 = n.music_mp3,
                    music_name = n.music_name,
                    music_option = n.music_option,
                    music_time = n.music_time,
                    music_video = n.music_video,
                    music_view = n.music_view,
                    author_id = n.author_id,
                    genres_id = n.genres_id,
                    nation_id = n.nation_id,
                    singer_id = n.singer_id,
                    user_id = n.user_id,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm thêm
        [HttpPost]
        public ActionResult Add(Music.Model.EF.Music musics, HttpPostedFileBase IMG, HttpPostedFileBase MP3, string del, int[] category, int[] singer)
        {
            //Cập nhật có thay đổi
            musics.music_option = true;
            musics.music_bin = false;

            //Kiem tra thay đổi value

            if (musics.music_active != true && musics.music_active != false)
            {
                musics.music_active = false;
            }

            //Hinh ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_MUSIC, code);
                musics.music_img = code + IMG.FileName;
            }
            else
            {

                musics.music_img = "notImg.png";
            }

            //Nhạc
            if (MP3 != null)
            {
                var code = Guid.NewGuid().ToString();
                var mp3 = new FilesController();
                mp3.AddMuscis(MP3, Common.Link.MP3_MUSIC, code);
                musics.music_linkdow= code + MP3.FileName;
            }
            else
            {
                musics.music_linkdow = "NULL";
            }

            var dao = new MusicsDAO();
            var j = new JsonAdminController();

            if (dao.Add(musics, category, singer))
            {
                return Redirect("/Admin/MusicsListAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.Music musics, HttpPostedFileBase IMG, HttpPostedFileBase MP3, int[] category, int[] singer)
        {
            Music.Model.EF.Music mus = db.Musics.Find(musics.music_id);

            musics.music_active = mus.music_active;
            musics.music_datecreate = mus.music_datecreate;
            musics.music_dateedit = DateTime.Now;
            musics.music_bin = mus.music_bin;
            musics.music_option = mus.music_option;
            musics.music_view = mus.music_view;
            musics.user_id = mus.user_id;
            musics.music_dowload = mus.music_dowload;

            var i = new FilesController();
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_MUSIC, code);
                musics.music_img = code + IMG.FileName;
            }
            else
            {
                musics.music_img = mus.music_img;
            }

            //Nhạc
            if (MP3 != null)
            {
                var code = Guid.NewGuid().ToString();
                var mp3 = new FilesController();
                mp3.AddMuscis(MP3, Common.Link.MP3_MUSIC, code);
                musics.music_linkdow = code + MP3.FileName;
            }
            else
            {
                musics.music_linkdow = mus.music_linkdow;
            }



            var dao = new MusicsDAO();
            if (dao.Edit(musics, category, singer))
            {
                return Redirect("/Admin/MusicsListAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Thùng rác
        [HttpGet]
        public JsonResult Del(int? id)
        {
            var dao = new MusicsDAO();
            if (dao.Del(id))
            {
                List<Music.Model.EF.Music> musics = db.Musics.Where(n => n.music_bin == false).OrderBy(n => n.music_name).ToList();
                List<jMusics> list = musics.Select(n => new jMusics
                {
                    music_active = n.music_active,
                    music_dowload = n.music_dowload,
                    music_bin = n.music_bin,
                    music_datecreate = n.music_datecreate.Value.ToString("dd/MM/yyyy"),
                    music_dateedit = n.music_dateedit.Value.ToString("dd/MM/yyyy"),
                    music_id = n.music_id,
                    music_img = n.music_img,
                    music_linkdow = n.music_linkdow,
                    music_lyric = n.music_lyric,
                    music_mp3 = n.music_mp3,
                    music_name = n.music_name,
                    music_option = n.music_option,
                    music_time = n.music_time,
                    music_video = n.music_video,
                    music_view = n.music_view,
                    author_id = n.author_id,
                    genres_id = n.genres_id,
                    nation_id = n.nation_id,
                    singer_id = n.singer_id,
                    user_id = n.user_id,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Khôi Phục
        [HttpGet]
        public JsonResult Restore(int? id)
        {
            var dao = new MusicsDAO();
            if (dao.Restore(id))
            {
                List<Music.Model.EF.Music> musics = db.Musics.Where(n => n.music_bin == true).OrderBy(n => n.music_name).ToList();
                List<jMusics> list = musics.Select(n => new jMusics
                {
                    music_active = n.music_active,
                    music_dowload = n.music_dowload,
                    music_bin = n.music_bin,
                    music_datecreate = n.music_datecreate.Value.ToString("dd/MM/yyyy"),
                    music_dateedit = n.music_dateedit.Value.ToString("dd/MM/yyyy"),
                    music_id = n.music_id,
                    music_img = n.music_img,
                    music_linkdow = n.music_linkdow,
                    music_lyric = n.music_lyric,
                    music_mp3 = n.music_mp3,
                    music_name = n.music_name,
                    music_option = n.music_option,
                    music_time = n.music_time,
                    music_video = n.music_video,
                    music_view = n.music_view,
                    author_id = n.author_id,
                    genres_id = n.genres_id,
                    nation_id = n.nation_id,
                    singer_id = n.singer_id,
                    user_id = n.user_id,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteMusic(int? id)
        {
            var dao = new MusicsDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<Music.Model.EF.Music> musics = db.Musics.Where(n => n.music_bin == true).OrderBy(n => n.music_name).ToList();
                List<jMusics> list = musics.Select(n => new jMusics
                {
                    music_active = n.music_active,
                    music_dowload = n.music_dowload,
                    music_bin = n.music_bin,
                    music_datecreate = n.music_datecreate.Value.ToString("dd/MM/yyyy"),
                    music_dateedit = n.music_dateedit.Value.ToString("dd/MM/yyyy"),
                    music_id = n.music_id,
                    music_img = n.music_img,
                    music_linkdow = n.music_linkdow,
                    music_lyric = n.music_lyric,
                    music_mp3 = n.music_mp3,
                    music_name = n.music_name,
                    music_option = n.music_option,
                    music_time = n.music_time,
                    music_video = n.music_video,
                    music_view = n.music_view,
                    author_id = n.author_id,
                    genres_id = n.genres_id,
                    nation_id = n.nation_id,
                    singer_id = n.singer_id,
                    user_id = n.user_id,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }
    }
}