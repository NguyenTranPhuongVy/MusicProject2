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
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MyMusisc()
        {
            return View();
        }
        public ActionResult DetailsMusic(int? id)
        {
            var music = db.Musics.Find(id);

            var fu = new FunctionController();
            if(fu.CookieID() != null)
            {
                var idus = fu.CookieID();

                if(music.music_vip == true)
                {
                    if(idus.user_vip == true)
                    {
                        Group checkmusic = db.Groups.FirstOrDefault(n => n.music_id == id && n.user_id == idus.user_id);
                        if (checkmusic != null)
                        {
                            checkmusic.group_datecreate = DateTime.Now;
                            db.SaveChanges();
                        }
                        else
                        {

                            Group group = new Group()
                            {
                                music_id = id,
                                user_id = idus.user_id,
                                group_datecreate = DateTime.Now,
                                //4 la nhac vua nghe
                                group_item = 4
                            };
                            db.Groups.Add(group);
                            db.SaveChanges();
                        }
                        return View(music);
                    }
                    else
                    {
                        Group checkmusic = db.Groups.FirstOrDefault(n => n.music_id == id && n.user_id == idus.user_id);
                        if (checkmusic != null)
                        {
                            checkmusic.group_datecreate = DateTime.Now;
                            db.SaveChanges();
                        }
                        else
                        {

                            Group group = new Group()
                            {
                                music_id = id,
                                user_id = idus.user_id,
                                group_datecreate = DateTime.Now,
                                //4 la nhac vua nghe
                                group_item = 4
                            };
                            db.Groups.Add(group);
                            db.SaveChanges();
                        }
                        return Redirect("/Pays/Index");
                    }
                }
                else
                {
                    return View(music);
                }
            }
            else
            {
                if (music.music_vip == true)
                {
                    return Redirect("/Users/Login");
                }
                else
                {
                    return View(music);
                }
            }
        }

        public ActionResult AllMusic()
        {
            return View();
        }

        public ActionResult HistoryDownload()
        {
            return View();
        }
        
        private class Quest
        {
            public int id { get; set; }
            public int quest_id { get; set; }
            public string name { get; set; }
        }
        [HttpPost]
        public JsonResult AcceptQuest(int? id)
        {
            var user = function.CookieID();
            if (id == null || user == null)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            var music = db.Musics.Find(id);
            if(music == null)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            List<Quest> quest = new List<Quest>();
            foreach(var item in db.Quests.Where(t => DateTime.Compare(t.quest_dateend.Value, DateTime.Now) >= 0 && t.quest_active == true))
            {
                if(item.quest_category != null)
                {
                    if(quest.Find(x => x.name == item.Category.category_name) == null)
                    {
                        quest.Add(new Quest() 
                        {
                            id = (int)item.quest_category,
                            quest_id = item.quest_id,
                            name = item.Category.category_name
                        });
                    }
                }
                if(item.quest_singer != null)
                {
                    if (quest.Find(x => x.name == item.Singer.singer_name) == null)
                    {
                        quest.Add(new Quest()
                        {
                            id = (int)item.quest_singer,
                            quest_id = item.quest_id,
                            name = item.Singer.singer_name
                        });
                    }
                }
                if (item.quest_national != null)
                {
                    if (quest.Find(x => x.name == item.National.nation_name) == null)
                    {
                        quest.Add(new Quest()
                        {
                            id = (int)item.quest_national,
                            quest_id = item.quest_id,
                            name = item.National.nation_name
                        });
                    }
                }
            }

            foreach(var item in quest)
            {
                if((music.nation_id == item.id && music.National.nation_name == item.name) || (music.Groups.Where(x => x.singer_id == item.id && x.Singer.singer_name == item.name).Count() > 0) || (music.Groups.Where(x => x.category_id == item.id && x.Category.category_name == item.name).Count() > 0))
                {
                    var qg = db.QuestGroups.FirstOrDefault(t => t.user_id == user.user_id && t.quest_id == item.quest_id);
                    if(qg != null)
                    {
                        if(qg.qg_progress < db.Quests.Find(item.quest_id).quest_limit)
                        {
                            if(qg.qg_progress == db.Quests.Find(item.quest_id).quest_limit - 1)
                            {
                                qg.qg_status = true;
                                var countqg = db.QuestGroups.Where(t => t.quest_id == item.quest_id && t.qg_progress == 20).Count();
                                if (countqg == 0)
                                {
                                    qg.qg_top = 1;
                                    db.Users.Find(user.user_id).user_point += db.Quests.Find(item.quest_id).quest_top1;
                                }
                                else if (countqg == 1)
                                {
                                    qg.qg_top = 2;
                                    db.Users.Find(user.user_id).user_point += db.Quests.Find(item.quest_id).quest_top2;
                                }
                                else if(countqg == 2)
                                {
                                    qg.qg_top = 3;
                                    db.Users.Find(user.user_id).user_point += db.Quests.Find(item.quest_id).quest_top3;
                                }
                                else
                                {
                                    qg.qg_top = 4;
                                    db.Users.Find(user.user_id).user_point += db.Quests.Find(item.quest_id).quest_gift;
                                }
                            }
                            qg.qg_progress++;
                            db.Entry(qg).State = System.Data.Entity.EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        db.QuestGroups.Add(new QuestGroup()
                        {
                            quest_id = item.quest_id,
                            qg_progress = 0,
                            user_id = user.user_id,
                            qg_datecreate = DateTime.Now,
                            qg_status = false
                        });
                        db.SaveChanges();
                    }
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }

            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Music.Model.EF.Music music, int[] singers, int[] category, int[] album, HttpPostedFileBase img, HttpPostedFileBase mp3, HttpPostedFileBase mp4)
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
            music.music_avgrate = 0;
            music.music_vote = 0;
            music.music_vip = true;
            music.user_id = user.user_id;
            musicsDAO.Add(music, category, singers, album);

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
                musicsDAO.Edit(music, category, singers, null);

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
            else if(name == "100aumy")
            {
                ViewBag.Note = name;
            }
            else if(name == "100hanquoc")
            {
                ViewBag.Note = name;
            }
            return View();
        }

        //Bình luận
        public JsonResult Comment(string content, int? id)
        {
            var coo = new FunctionController();
            var idus = coo.CookieID();

            Comment comment = new Comment
            {
                music_id = id,
                comment_content = content,
                comment_datecreate = DateTime.Now,
                user_id = idus.user_id
            };
            db.Comments.Add(comment);
            db.SaveChanges();


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
        public JsonResult Rate(int? rate, int? id)
        {
            Music.Model.EF.Music music = db.Musics.Find(id);
            double avg = music.music_avgrate == null ? 0 : (double)music.music_avgrate;
            int vote = music.music_vote == null ? 0 : (int)music.music_vote;
            music.music_avgrate = ((avg * vote) + rate) / (vote + 1);
            music.music_vote++;
            db.Entry(music).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return Json(music.music_avgrate.Value.ToString("0.0"), JsonRequestBehavior.AllowGet);
        }

        //Thich nhac
        public JsonResult FavouriteMusic(int? idmusic)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = new Group()
            {
                music_id = idmusic,
                user_id = idus.user_id,
                group_datecreate = DateTime.Now,
                group_item = 5
            };
            db.Groups.Add(group);
            db.SaveChanges();

            var fa = db.Groups.Where(n => n.group_item == 5 && n.user_id == idus.user_id && n.music_id == idmusic).OrderByDescending(n => n.group_datecreate).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(fa, JsonRequestBehavior.AllowGet);
        }
        //Danh sách yêu thích theo người dùng
        public JsonResult JsonFavourite(int? idmusic)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();
            var music = db.Groups.Where(n => n.group_item == 5 && n.user_id == idus.user_id && n.music_id == idmusic).OrderByDescending(n => n.group_datecreate).Select(n => new
            {
                id = n.group_id

            }).ToList();
            return Json(music, JsonRequestBehavior.AllowGet);
        }
        //Hủy lưu
        public JsonResult CancelFavourite(int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = db.Groups.Find(id);
            var idmusic = group.music_id;
            db.Groups.Remove(group);
            db.SaveChanges();

            var fa = db.Groups.Where(n => n.group_item == 5 && n.user_id == idus.user_id && n.music_id == idmusic).OrderByDescending(n => n.group_datecreate).Select(n => new
            {
                id = n.group_id

            }).ToList();
            return Json(fa, JsonRequestBehavior.AllowGet);
        }
        //Quản lý nhạc
        public ActionResult MyFavouriteMusic()
        {
            return View();
        }
        public JsonResult JsonIndexFavourite()
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();
            var fa = db.Groups.Where(n => n.group_item == 5 && n.user_id == idus.user_id).OrderByDescending(n => n.group_datecreate).Select(n => new
            {
                id = n.group_id,
                idmusic = n.music_id,
                title = n.Music.music_name,
                img = n.Music.music_img

            }).ToList();
            return Json(fa, JsonRequestBehavior.AllowGet);
        }
    }
}