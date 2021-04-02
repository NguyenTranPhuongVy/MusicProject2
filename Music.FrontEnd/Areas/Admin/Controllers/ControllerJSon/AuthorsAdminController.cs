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
    public class AuthorsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/authorsAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Authors.Where(n => n.author_bin == true).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new AuthorsDAO();
            if (dao.Active(id))
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == false).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_id = n.author_id,
                    author_name = n.author_name,
                    author_note = n.author_note,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_img = n.author_img,

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
            var dao = new AuthorsDAO();
            if (dao.Option(id))
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == false).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_id = n.author_id,
                    author_name = n.author_name,
                    author_note = n.author_note,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_img = n.author_img,

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
        public ActionResult Add(Author author, HttpPostedFileBase IMG, string del)
        {
            //Cập nhật có thay đổi
            author.author_bin = false;

            //Kiem tra thay đổi value

            if (author.author_active != true && author.author_active != false)
            {
                author.author_active = false;
            }

            //Hinh ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_AUTHOR, code);
                author.author_img = code + IMG.FileName;
            }
            else
            {

                author.author_img = "notImg.png";
            }

            var dao = new AuthorsDAO();
            var j = new JsonAdminController();

            if (dao.Add(author))
            {
                return Redirect("/Admin/AuthorsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Author author, HttpPostedFileBase IMG)
        {
            Author au = db.Authors.Find(author.author_id);

            author.author_active = au.author_active;
            author.author_datecreate = au.author_datecreate;
            author.author_dateupdate = DateTime.Now;
            author.author_bin = au.author_bin;

            var i = new FilesController();
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_AUTHOR, code);
                author.author_img = code + IMG.FileName;
            }
            else
            {
                author.author_img = au.author_img;
            }


            var dao = new AuthorsDAO();
            if (dao.Edit(author))
            {
                return Redirect("/Admin/authorsAdmin");
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
            var dao = new AuthorsDAO();
            if (dao.Del(id))
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == false).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_id = n.author_id,
                    author_name = n.author_name,
                    author_note = n.author_note,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_img = n.author_img,

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
            var dao = new AuthorsDAO();
            if (dao.Restore(id))
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == true).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_id = n.author_id,
                    author_name = n.author_name,
                    author_note = n.author_note,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_img = n.author_img,

                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteAuthor(int? id)
        {
            var dao = new AuthorsDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<Author> authors = db.Authors.Where(n => n.author_bin == true).OrderBy(n => n.author_name).ToList();
                List<jAuthors> list = authors.Select(n => new jAuthors
                {
                    author_active = n.author_active,
                    author_bin = n.author_bin,
                    author_id = n.author_id,
                    author_name = n.author_name,
                    author_note = n.author_note,
                    author_datecreate = n.author_datecreate.Value.ToString("dd/MM/yyyy"),
                    author_dateupdate = n.author_dateupdate.Value.ToString("dd/MM/yyyy"),
                    author_img = n.author_img,

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