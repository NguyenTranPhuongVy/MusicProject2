using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;
using Music.Model.EF;

namespace Music.FrontEnd.Controllers
{
    public class JsonController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        // GET: Json
        public ActionResult Index()
        {
            return View();
        }
        
        // Music
        // lấy tất cả nhạc
        public ActionResult GetAllMusic()
        {
            var user_id = function.CookieID();
            var music = from m in db.Musics
                        where m.music_bin == false && m.music_active == true && m.music_option == true
                        select new
                        {
                            id = m.music_id,
                            name = m.music_name,
                            img = m.music_img,
                            lyric = m.music_lyric,
                            time = m.music_time,
                            view = m.music_view,
                            download = m.music_dowload,
                            author = m.Author.author_name,
                            vip = m.music_vip,
                            singer = m.Groups.Select(n=>n.Singer.singer_name),
                            album = m.PlayLists.Select(n=>n.Album.album_name),

                        };
            return Json(music, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAllAlbums()
        {
            var user_id = function.CookieID();
            var album = from m in db.Albums
                        where m.album_bin == false && m.album_active == true
                        select new
                        {
                            id = m.album_id,
                            name = m.album_name,
                            img = m.album_img,
                        };
            return Json(album, JsonRequestBehavior.AllowGet);
        }

        public JsonResult PaysUser()
        {
            var user_id = function.CookieID();
            var list = from p in db.Pays
                       where p.user_id == user_id.user_id
                       select new jPays()
                       {
                           pakage_id = p.pakage_id,
                           pay_active = p.pay_active.ToString(),
                           pay_datecreate = p.pay_datecreate.ToString(),
                           pay_dateexpiration = p.pay_dateexpiration.ToString(),
                           pay_id = p.pay_id,
                           pay_status = p.pay_status,
                           pay_summoney = p.pay_summoney,
                           user_id = p.user_id,
                           package_name = p.Package.package_name,
                           pakage_price = p.Package.pakage_price.ToString()
                       };
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        
        public JsonResult JProfile()
        {
            //if (function.CookieID() == null)
            //{
            //    return Redirect("/User/Login");
            //}
            var user = function.CookieID();
            var juser = new jUsers()
            {
                user_active = user.user_active,
                user_bin = user.user_bin,
                user_code = user.user_code,
                user_datecreate = user.user_datecreate.Value.ToLongDateString(),
                user_datelogin = user.user_datelogin.Value.ToLongDateString(),
                user_deadline = user.user_deadline.Value.ToLongDateString(),
                user_email = user.user_email,
                user_id = user.user_id,
                user_img = user.user_img,
                user_name = user.user_name,
                user_option = user.user_option,
                user_pass = user.user_pass,
                user_point = user.user_point,
                user_token = user.user_token
            };
            return Json(juser, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Users()
        {
            var id = function.CookieID();
            var list = from item in db.Users
                       where item.user_id == id.user_id
                       select new
                       {
                           name = item.user_name,
                           phone = item.user_phone

                       };
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult AllMusicID()
        {
            var user_id = function.CookieID();
            var music = from m in db.Musics
                        where m.music_bin == false && m.user_id == user_id.user_id
                        select new
                        {
                            id = m.music_id,
                            name = m.music_name,
                            img = m.music_img,
                            lyric = m.music_lyric,
                            time = m.music_time,
                            view = m.music_view,
                            download = m.music_dowload,
                            author = m.Author.author_name,

                        };
            return Json(music, JsonRequestBehavior.AllowGet);
        }
        //Binh luan id code
        public JsonResult CommentID(int? id)
        {
            var list = from item in db.Comments
                       where item.music_id == id
                       orderby item.comment_dateupdate descending
                       select new
                       {
                           id = item.comment_id,
                           idcode = item.music_id,
                           idus = item.user_id,
                           date = item.comment_datecreate,
                           update = item.comment_dateupdate,
                           content = item.comment_content,
                           nameid = item.User.user_name,
                           imgid = item.User.user_img

                       };
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        // danh sach doi qua
        public JsonResult GetAllGift()
        {
            var list = from item in db.Packages
                       where item.package_bin == false && item.package_active == true && item.package_option == true && (item.package_type == 2 || item.package_type == 3)
                       orderby item.package_datecreate descending
                       select new
                       {
                           id = item.package_id,
                           name = item.package_name,
                           point = item.pakage_price,
                           date = item.pakege_deadline,
                           content = item.package_content

                       };
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}