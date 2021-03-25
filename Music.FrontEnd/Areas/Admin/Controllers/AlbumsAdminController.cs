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

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class AlbumsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/AlbumsAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Albums.Where(n => n.album_bin == true).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new AlbumsDAO();
            if (dao.Active(id))
            {
                List<Album> albums = db.Albums.Where(n => n.album_bin == false).OrderBy(n => n.album_name).ToList();
                List<jAlbums> list = albums.Select(n => new jAlbums
                {
                    album_active = n.album_active,
                    album_name = n.album_name,
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_favorite = n.album_favorite,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    album_option = n.album_option,
                    user_id = n.user_id
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
            var dao = new AlbumsDAO();
            if (dao.Option(id))
            {
                List<Album> albums = db.Albums.Where(n => n.album_bin == false).OrderBy(n => n.album_name).ToList();
                List<jAlbums> list = albums.Select(n => new jAlbums
                {
                    album_active = n.album_active,
                    album_name = n.album_name,
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_favorite = n.album_favorite,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    album_option = n.album_option,
                    user_id = n.user_id
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
        public ActionResult Add(Album album, HttpPostedFileBase IMG, string del)
        {
            //Cập nhật có thay đổi
            album.album_option = true;
            album.album_bin = false;

            //Kiem tra thay đổi value

            if (album.album_active != true && album.album_active != false)
            {
                album.album_active = false;
            }

            //Hinh ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_ALBUM, code);
                album.album_img = code + IMG.FileName;
            }
            else
            {

                album.album_img = "notImg.png";
            }

            var dao = new AlbumsDAO();
            var j = new JsonAdminController();

            if (dao.Add(album))
            {
                return Redirect("/Admin/AlbumsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Album album, HttpPostedFileBase IMG)
        {
            Album al = db.Albums.Find(album.album_id);

            album.album_active = al.album_active;
            album.album_datecreate = al.album_datecreate;
            album.album_dateedit = DateTime.Now;
            album.album_bin = al.album_bin;
            album.album_option = al.album_option;
            album.user_id = al.user_id;

            var i = new ImagesController();
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_ALBUM, code);
                album.album_img = code + IMG.FileName;
            }
            else
            {
                album.album_img = al.album_img;
            }


            var dao = new AlbumsDAO();
            if (dao.Edit(album))
            {
                return Redirect("/Admin/AlbumsAdmin");
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
            var dao = new AlbumsDAO();
            if (dao.Del(id))
            {
                List<Album> albums = db.Albums.Where(n => n.album_bin == false).OrderBy(n => n.album_name).ToList();
                List<jAlbums> list = albums.Select(n => new jAlbums
                {
                    album_active = n.album_active,
                    album_name = n.album_name,
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_favorite = n.album_favorite,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    album_option = n.album_option,
                    user_id = n.user_id
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
            var dao = new AlbumsDAO();
            if (dao.Restore(id))
            {
                List<Album> albums = db.Albums.Where(n => n.album_bin == true).OrderBy(n => n.album_name).ToList();
                List<jAlbums> list = albums.Select(n => new jAlbums
                {
                    album_active = n.album_active,
                    album_name = n.album_name,
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_favorite = n.album_favorite,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    album_option = n.album_option,
                    user_id = n.user_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteAlbum(int? id)
        {
            var dao = new AlbumsDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<Album> albums = db.Albums.Where(n => n.album_bin == true).OrderBy(n => n.album_name).ToList();
                List<jAlbums> list = albums.Select(n => new jAlbums
                {
                    album_active = n.album_active,
                    album_name = n.album_name,
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_favorite = n.album_favorite,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    album_option = n.album_option,
                    user_id = n.user_id
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