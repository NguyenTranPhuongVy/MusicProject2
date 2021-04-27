using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.Model.DAO;
using Music.FrontEnd.Function;
using Music.Common;
using Music.FrontEnd.Models;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class AlbumsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        AlbumsDAO albumsDAO = new AlbumsDAO();
        // GET: Admin/AlbumsAdmin
        public ActionResult Index()
        {
            return View(db.Albums.Where(n => n.album_bin == false).OrderBy(n => n.album_name).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Albums.Where(n => n.album_bin == true).OrderBy(n => n.album_name).ToList());
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
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_favorite = n.album_favorite,
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_name = n.album_name,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    user_id = n.user_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

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
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_favorite = n.album_favorite,
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_name = n.album_name,
                    album_note = n.album_note,
                    album_view = n.album_view,
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
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_favorite = n.album_favorite,
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_name = n.album_name,
                    album_note = n.album_note,
                    album_view = n.album_view,
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
        public JsonResult DeleteAl(int? id)
        {
            var dao = new AlbumsDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<Album> albums = db.Albums.Where(n => n.album_bin == false).OrderBy(n => n.album_name).ToList();
                List<jAlbums> list = albums.Select(n => new jAlbums
                {
                    album_active = n.album_active,
                    album_bin = n.album_bin,
                    album_datecreate = n.album_datecreate.Value.ToString("dd/MM/yyyy"),
                    album_dateedit = n.album_dateedit.Value.ToString("dd/MM/yyyy"),
                    album_favorite = n.album_favorite,
                    album_id = n.album_id,
                    album_img = n.album_img,
                    album_name = n.album_name,
                    album_note = n.album_note,
                    album_view = n.album_view,
                    user_id = n.user_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Music.Model.EF.Album album, HttpPostedFileBase IMG, string del)
        {
            album.album_bin = false;
            album.album_dateedit = DateTime.Now;

            if (album.album_active != true && album.album_active != false)
            {
                album.album_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_ALBUM, code);
                album.album_img = code + IMG.FileName;
            }
            else
            {
                album.album_img = "notImg.png";
            }

            if (albumsDAO.Add(album))
            {
                return Redirect("/Admin/AlbumsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.Album album, HttpPostedFileBase IMG, string del)
        {
            Album al = db.Albums.Find(album.album_id);
            album.album_bin = false;
            album.album_datecreate = al.album_datecreate;
            album.album_dateedit = DateTime.Now;
            album.album_active = true;

            if (album.album_active != true && album.album_active != false)
            {
                album.album_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_ALBUM, code);
                album.album_img = code + IMG.FileName;
            }
            else
            {
                album.album_img = al.album_img;
            }

            if (albumsDAO.Edit(album))
            {
                return Redirect("/Admin/AlbumsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }
    }
}