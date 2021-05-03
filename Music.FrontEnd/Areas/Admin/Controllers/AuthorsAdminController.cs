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
    public class AuthorsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        AuthorsDAO authorsDAO = new AuthorsDAO();
        // GET: Admin/Authors
        public ActionResult Index()
        {
            return View(db.Authors.Where(n => n.author_bin == false).OrderBy(n => n.author_name).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Authors.Where(n => n.author_bin == true).OrderBy(n => n.author_name).ToList());
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
                return Json(null);
            }
        }

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
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult Deleteau(int? id)
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
                return Json(null);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Music.Model.EF.Author author, HttpPostedFileBase IMG, string del)
        {
            author.author_bin = false;

            if (author.author_active != true && author.author_active != false)
            {
                author.author_active = false;
            }

            //Chèn ảnh
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

            if (authorsDAO.Add(author))
            {
                return Redirect("/Admin/AuthorsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.Author author, HttpPostedFileBase IMG, string del)
        {
            Author au = db.Authors.Find(author.author_id);
            author.author_bin = false;
            author.author_datecreate = au.author_datecreate;
            author.author_dateupdate = DateTime.Now;
            author.author_active = true;

            if (author.author_active != true && author.author_active != false)
            {
                author.author_active = false;
            }

            //Chèn ảnh
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

            if (authorsDAO.Edit(author))
            {
                return Redirect("/Admin/AuthorsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }
    }
}