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
    public class SingersAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        SingersDAO singersDAO = new SingersDAO();
        // GET: Admin/SingersAdmin
        public ActionResult Index()
        {
            return View(db.Singers.Where(n => n.singer_bin == false).OrderBy(n => n.singer_name).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Singers.Where(n => n.singer_bin == true).OrderBy(n => n.singer_name).ToList());
        }

        [HttpGet]
        public JsonResult Active(int ? id)
        {
            var dao = new SingersDAO();
            if(dao.Active(id))
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
                return Json(null);
            }
        }

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
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

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
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm Xoá
        public JsonResult Deletesing(int? id)
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
                    singer_datecreate = n.singer_datecreate.Value.ToString("dd/MM/yyyy"),
                    singer_dateupdate = n.singer_dateupdate.Value.ToString("dd/MM/yyyy"),
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
        public ActionResult Add(Music.Model.EF.Singer singer, HttpPostedFileBase IMG, string del)
        {
            singer.singer_bin = false;
            singer.singer_dateupdate = DateTime.Now;

            if (singer.singer_active != true && singer.singer_active != false)
            {
                singer.singer_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_SINGER, code);
                singer.singer_img = code + IMG.FileName;
            }
            else
            {
                singer.singer_img = "notImg.png";
            }

            if (singersDAO.Add(singer))
            {
                return Redirect("/Admin/SingersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.Singer singer, HttpPostedFileBase IMG, string del)
        {
            Singer sing = db.Singers.Find(singer.singer_id);
            singer.singer_bin = false;
            singer.singer_active = true;
            singer.singer_datecreate = sing.singer_datecreate;
            singer.singer_dateupdate = DateTime.Now;

            if (singer.singer_active != true && singer.singer_active != false)
            {
                singer.singer_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_SINGER, code);
                singer.singer_img = code + IMG.FileName;
            }
            else
            {
                singer.singer_img = sing.singer_img;
            }

            if (singersDAO.Edit(singer))
            {
                return Redirect("/Admin/SingersAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }
    }
}