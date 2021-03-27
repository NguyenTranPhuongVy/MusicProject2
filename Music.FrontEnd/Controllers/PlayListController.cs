using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.Model.DAO;
using Music.Model.EF;

namespace Music.FrontEnd.Controllers
{
    public class PlayListController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        AlbumsDAO albumsDAO = new AlbumsDAO();
        FunctionController function = new FunctionController();
        PlayListDAO playListDAO = new PlayListDAO();
        // GET: PlayList
        public ActionResult Index()
        {
            return View();
        }

        // add favorite
        public ActionResult AddPlaylist(int? id, int? album_id)
        {
            if (function.CookieID() == null)
            {
                return new HttpNotFoundResult();
            }
            if (ModelState.IsValid)
            {
                var cookie = function.CookieID();
                if (album_id == null)
                {
                    var album = from al in db.Albums
                                where al.user_id == cookie.user_id && al.album_name == "Yêu thích"
                                select al.album_id;
                    if(album == null)
                    {
                        albumsDAO.Add(new Album()
                        {
                            album_name = "Yêu thích",
                            album_img = "",
                            user_id = cookie.user_id
                        });
                    }
                    album_id = (from al in db.Albums
                                where al.user_id == cookie.user_id && al.album_name == "Yêu thích"
                                select al.album_id).First();
                }
                PlayList playList = new PlayList();
                playList.albums_id = album_id;
                playList.music_id = id;
                playListDAO.Add(playList);
                return Redirect("/");
            }
            return View();
        }
    }
}