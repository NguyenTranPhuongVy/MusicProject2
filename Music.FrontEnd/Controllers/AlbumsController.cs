using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.Model.EF;
using Music.Model.DAO;

namespace Music.FrontEnd.Controllers
{
    public class AlbumsController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        AlbumsDAO albumsDAO = new AlbumsDAO();
        FilesController filesfunction = new FilesController();
        // GET: Albums
        public ActionResult MyAlbums()
        {
            return View();
        }
        
        public PartialViewResult AddAlbum(Album album, HttpPostedFileBase img)
        {
            var cookie = function.CookieID();
            if (ModelState.IsValid)
            {
                album.album_img = filesfunction.AddImages(img, "Album", Guid.NewGuid().ToString());
                albumsDAO.Add(album);
                return PartialView();
            }
            return PartialView();
        }

        public PartialViewResult EditAlbum(Album album, HttpPostedFileBase img)
        {
            var cookie = function.CookieID();
            if (ModelState.IsValid)
            {
                if(img != null)
                {
                    album.album_img = filesfunction.AddImages(img, "Album", Guid.NewGuid().ToString());
                }
                albumsDAO.Add(album);
                return PartialView();
            }
            return PartialView();
        }
    }
}