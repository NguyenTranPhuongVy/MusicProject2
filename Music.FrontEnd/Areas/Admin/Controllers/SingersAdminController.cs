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
    public class SingersAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/CategoriesAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Singers.Where(n => n.singer_bin == true).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new SingersDAO();
            if (dao.Active(id))
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
                    user_id = n.user_id,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                    singer_option = n.singer_option,
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
            var dao = new SingersDAO();
            if (dao.Option(id))
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
                    user_id = n.user_id,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                    singer_option = n.singer_option,
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
        public ActionResult Add(Singer singer, HttpPostedFileBase IMG, string del)
        {
            //Cập nhật có thay đổi
            singer.singer_option = true;
            singer.singer_bin = false;

            //Kiem tra thay đổi value

            if (singer.singer_active != true && singer.singer_active != false)
            {
                singer.singer_active = false;
            }

            //Hinh ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_SINGER, code);
                singer.singer_img = code + IMG.FileName;
            }
            else
            {
                singer.singer_img = "notImg.png";
            }

            var dao = new SingersDAO();
            var j = new JsonAdminController();

            if (dao.Add(singer))
            {
                return Redirect("/Admin/SingersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Singer singer, HttpPostedFileBase IMG)
        {
            Singer sing = db.Singers.Find(singer.singer_id);

            singer.singer_active = sing.singer_active;
            singer.singer_bin = sing.singer_bin;
            singer.singer_datecreate = sing.singer_datecreate;
            singer.singer_dateupdate = DateTime.Now;
            singer.singer_name = sing.singer_name;
            singer.singer_note = sing.singer_note;
            singer.singer_option = sing.singer_option;
            singer.user_id = sing.user_id;

            var i = new ImagesController();
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_SINGER, code);
                singer.singer_img = code + IMG.FileName;
            }
            else
            {
                singer.singer_img = sing.singer_img;
            }


            var dao = new SingersDAO();
            if (dao.Edit(singer))
            {
                return Redirect("/Admin/SingersAdmin");
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
            var dao = new SingersDAO();
            if (dao.Del(id))
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
                    user_id = n.user_id,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                    singer_option = n.singer_option,
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
            var dao = new SingersDAO();
            if (dao.Restore(id))
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
                    user_id = n.user_id,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                    singer_option = n.singer_option,
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteSing(int? id)
        {
            var dao = new SingersDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
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
                    user_id = n.user_id,
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                    singer_option = n.singer_option,
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