using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class JsonAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        public JsonResult CategoryAdmin(string del)
        {
            if(del != "del")
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == false).OrderByDescending(n => n.category_datecreate).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_id = n.category_id,
                    category_img = n.category_img,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == true).OrderByDescending(n => n.category_datecreate).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_id = n.category_id,
                    category_img = n.category_img,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
        }
        public JsonResult Singers(string del)
        {
            if(del != "del")
            {
                List<Singer> singers = db.Singers.Where(n => n.singer_bin == false).OrderBy(n => n.singer_name).ToList();
                List<jSingers> list = singers.Select(n => new jSingers 
                {
                    singer_active = n.singer_active,
                    singer_bin = n.singer_bin,
                    singer_id = n.singer_id,
                    singer_img = n.singer_img,
                    singer_name = n.singer_name,
                    singer_note = n.singer_note,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
            else
            {
                List<Singer> singers = db.Singers.Where(n => n.singer_bin == true).OrderBy(n => n.singer_name).ToList();
                List<jSingers> list = singers.Select(n => new jSingers
                {
                    singer_active = n.singer_active,
                    singer_bin = n.singer_bin,
                    singer_id = n.singer_id,
                    singer_img = n.singer_img,
                    singer_name = n.singer_name,
                    singer_note = n.singer_note,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
        }

        public JsonResult Authors(string del)
        {
            if(del != "del")
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == false).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_id = n.author_id,
                    author_img = n.author_img,
                    author_name = n.author_name,
                    author_note = n.author_note
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            } 
            else
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == true).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_id = n.author_id,
                    author_img = n.author_img,
                    author_name = n.author_name,
                    author_note = n.author_note
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
        }

        public JsonResult Users(string del)
        {
            if(del != "del")
            {
                List<User> users = db.Users.Where(n => n.user_bin == false).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
                }).ToList();
                return Json (list, JsonRequestBehavior.AllowGet);
            }    
            else
            {
                List<User> users = db.Users.Where(n => n.user_bin == true).OrderBy(n => n.user_name).ToList();
                List<jUsers> list = users.Select(n => new jUsers
                {
                    user_active = n.user_active,
                    user_bin = n.user_bin,
                    user_code = n.user_code,
                    user_datecreate = n.user_datecreate.ToString(),
                    user_datelogin = n.user_datelogin.ToString(),
                    user_deadline = n.user_deadline.ToString(),
                    user_email = n.user_email,
                    user_id = n.user_id,
                    user_img = n.user_img,
                    user_name = n.user_name,
                    user_option = n.user_option,
                    user_pass = n.user_pass,
                    user_point = n.user_point,
                    user_token = n.user_token,
                    user_address = n.user_address,
                    user_birth = n.user_birth.ToString(),
                    user_datevip = n.user_datevip.ToString(),
                    user_note = n.user_note,
                    user_phone = n.user_phone,
                    user_vip = n.user_vip,
                    role_id = n.role_id,
                    role_name = n.Role.role_name,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
        }

        public JsonResult Albums(string del)
        {
            if(del != "del")
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
                    user_id = n.user_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
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
                    user_id = n.user_id
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult Nations(string del)
        {
            if(del != "del")
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == false).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_option = n.nation_option
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
            else
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == true).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_option = n.nation_option
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
        }

        public JsonResult Musics(string del)
        {
            if(del != "del")
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
                    music_name = n.music_name,
                    music_option = n.music_option,
                    music_time = n.music_time,
                    music_video = n.music_video,
                    music_view = n.music_view,
                    author_id = n.author_id,
                    genres_id = n.genres_id,
                    nation_id=n.nation_id,
                    singer_id = n.singer_id,
                    user_id = n.user_id,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
            else
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
        }

        public JsonResult Packages(string del)
        {
            if(del != "del")
            {
                List<Package> packages = db.Packages.Where(n => n.package_bin == false).OrderBy(n => n.package_name).ToList();
                List<jPackages> list = packages.Select(n => new jPackages
                {
                    package_active = n.package_active,
                    package_name = n.package_name,
                    package_content = n.package_content,
                    package_datecreate = n.package_datecreate.Value.ToString("dd/MM/yyyy"),
                    package_id = n.package_id,
                    package_money = n.package_money,
                    package_option = n.package_option,
                    package_bin = n.package_bin,
                    pakage_price = n.pakage_price
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
            else
            {
                List<Package> packages = db.Packages.Where(n => n.package_bin == true).OrderBy(n => n.package_name).ToList();
                List<jPackages> list = packages.Select(n => new jPackages
                {
                    package_active = n.package_active,
                    package_name = n.package_name,
                    package_content = n.package_content,
                    package_datecreate = n.package_datecreate.Value.ToString("dd/MM/yyyy"),
                    package_id = n.package_id,
                    package_money = n.package_money,
                    package_option = n.package_option,
                    package_bin = n.package_bin,
                    pakage_price = n.pakage_price
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }    
        }

        // get all quest
        public JsonResult AllQuest()
        {
            var quest = from q in db.Quests
                        select new
                        {
                            id = q.quest_id,
                            limit = q.quest_limit,
                            datecreate = q.quest_datecreate,
                            dateend = q.quest_dateend,
                            active = q.quest_active,
                            category = q.quest_category,
                            national = q.quest_national,
                            singer = q.quest_singer,
                            gift = q.quest_gift,
                            top1 = q.quest_top1,
                            top2 = q.quest_top2,
                            top3 = q.quest_top3,
                        };
            return Json(quest, JsonRequestBehavior.AllowGet);
        }
    }
}