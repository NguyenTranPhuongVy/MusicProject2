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
    public class CategoryAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        // GET: Admin/CategoryAdmin
        public ActionResult Index()
        {
            return View(db.Categories.Where(n => n.category_bin == false).OrderByDescending(n => n.category_datecreate).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Categories.Where(n => n.category_bin == true).OrderByDescending(n => n.category_datecreate).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new CategoriesDAO();
            if (dao.Active(id))
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
                return Json(null);
            }
        }

        [HttpGet]
        public JsonResult Del(int? id)
        {
            var dao = new CategoriesDAO();
            if (dao.ChangeBin(id))
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
                return Json(null);
            }
        }

        //Khôi Phục
        [HttpGet]
        public JsonResult Restore(int? id)
        {
            var dao = new CategoriesDAO();
            if (dao.ChangeBin(id))
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
            else
            {
                return Json(null);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Music.Model.EF.Category category, HttpPostedFileBase IMG, string del)
        {
            category.category_bin = false;

            if(category.category_active != true && category.category_active != false)
            {
                category.category_active = false;
            }    

            //Chèn ảnh
            if(IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_CATEGORY, code);
                category.category_img = code + IMG.FileName;
            }    
            else
            {
                category.category_img = "notImg.png";
            }    

            if(categoriesDAO.ADD(category))
            {
                return Redirect("/Admin/CategoryAdmin");
            }    
            else
            {
                return Redirect(Common.Link.NOT_404);
            }    
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.Category category, HttpPostedFileBase IMG, string del)
        {
            Category cate = db.Categories.Find(category.category_id);
            category.category_bin = false;
            category.category_datecreate = cate.category_datecreate;
            category.category_view = cate.category_view;
            category.user_id = cate.user_id;

            if (category.category_active != true && category.category_active != false)
            {
                category.category_active = false;
            }

            //Chèn ảnh
            if (IMG != null)
            {
                var code = Guid.NewGuid().ToString();
                var img = new FilesController();
                img.AddImages(IMG, Common.Link.IMG_CATEGORY, code);
                category.category_img = code + IMG.FileName;
            }
            else
            {
                category.category_img = cate.category_img;
            }

            if (categoriesDAO.Edit(category))
            {
                return Redirect("/Admin/CategoryAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }
    }
}