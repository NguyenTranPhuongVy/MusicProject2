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
    public class CategoriesAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/CategoriesAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Categories.Where(n => n.category_bin == true).ToList());
        }

        [HttpGet]
        public JsonResult Active(int ? id)
        {
            var dao = new CategoriesDAO();
            if(dao.Active(id))
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == false).OrderBy(n => n.category_name).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_id = n.category_id,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                    user_id = n.user_id,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_img = n.category_img,
                    category_option = n.category_option

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
            var dao = new CategoriesDAO();
            if (dao.Option(id))
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == false).OrderBy(n => n.category_name).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_id = n.category_id,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                    user_id = n.user_id,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_img = n.category_img,
                    category_option = n.category_option

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
        public ActionResult Add(Category category, HttpPostedFileBase IMG, string del)
        {
            //Cập nhật có thay đổi
            category.category_option = true;
            category.category_bin = false;

            //Kiem tra thay đổi value

            if (category.category_active != true && category.category_active != false)
            {
                category.category_active = false;
            }

            //Hinh ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_CATEGORY, code);
                category.category_img = code + IMG.FileName;
            }
            else
            {

                category.category_img = "notImg.png";
            }

            var dao = new CategoriesDAO();
            var j = new JsonAdminController();

            if (dao.ADD(category))
            {
                return Redirect("/Admin/CategoriesAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Category category, HttpPostedFileBase IMG)
        {
            Category cate = db.Categories.Find(category.category_id);

            category.category_active = cate.category_active;
            category.category_datecreate = cate.category_datecreate;
            category.category_dateupdate = DateTime.Now;
            category.category_bin = cate.category_bin;
            category.category_option = cate.category_option;
            category.category_view = cate.category_view;
            category.user_id = cate.user_id;

            var i = new ImagesController();
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new ImagesController();
                img.AddImages(IMG, Common.Link.IMG_CATEGORY, code);
                category.category_img = code + IMG.FileName;
            }
            else
            {
                category.category_img = cate.category_img;
            }


            var dao = new CategoriesDAO();
            if (dao.Edit(category))
            {
                return Redirect("/Admin/CategoriesAdmin");
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
            var dao = new CategoriesDAO();
            if (dao.Del(id))
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == false).OrderBy(n => n.category_name).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_id = n.category_id,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                    user_id = n.user_id,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_img = n.category_img,
                    category_option = n.category_option

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
            var dao = new CategoriesDAO();
            if (dao.Restore(id))
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == true).OrderBy(n => n.category_name).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_id = n.category_id,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                    user_id = n.user_id,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_img = n.category_img,
                    category_option = n.category_option

                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteCate(int? id)
        {
            var dao = new CategoriesDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<Category> categories = db.Categories.Where(n => n.category_bin == true).OrderBy(n => n.category_name).ToList();
                List<jCategories> list = categories.Select(n => new jCategories
                {
                    category_active = n.category_active,
                    category_bin = n.category_bin,
                    category_id = n.category_id,
                    category_name = n.category_name,
                    category_note = n.category_note,
                    category_view = n.category_view,
                    user_id = n.user_id,
                    category_datecreate = n.category_datecreate.Value.ToString("dd/MM/yyyy"),
                    category_dateupdate = n.category_dateupdate.Value.ToString("dd/MM/yyyy"),
                    category_img = n.category_img,
                    category_option = n.category_option

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