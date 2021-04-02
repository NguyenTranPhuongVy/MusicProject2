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
    public class NationsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Admin/NationsAdmin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View(db.Nationals.Where(n => n.nation_bin == true).ToList());
        }

        [HttpGet]
        public JsonResult Active(int? id)
        {
            var dao = new NationsDAO();
            if (dao.Active(id))
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == false).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_option = n.nation_option

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
            var dao = new NationsDAO();
            if (dao.Option(id))
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == false).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_option = n.nation_option

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
        public ActionResult Add(National national, HttpPostedFileBase IMG, string del)
        {
            //Cập nhật có thay đổi
            national.nation_option = true;
            national.nation_bin = false;

            //Kiem tra thay đổi value

            if (national.nation_active != true && national.nation_active != false)
            {
                national.nation_active = false;
            }

            ////Hinh ảnh
            //if (IMG != null)
            //{
            //    var code = Guid.NewGuid().ToString();
            //    var img = new ImagesController();
            //    img.AddImages(IMG, Common.Link.IMG_AUTHOR, code);
            //    national.nation_img = code + IMG.FileName;
            //}
            //else
            //{

            //    national.nation_img = "notImg.png";
            //}

            var dao = new NationsDAO();
            var j = new JsonAdminController();

            if (dao.Add(national))
            {
                return Redirect("/Admin/NationsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        //Hàm sửa
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(National national, HttpPostedFileBase IMG)
        {
            National natio = db.Nationals.Find(national.nation_id);

            national.nation_active = natio.nation_active;
            national.nation_datecreate = natio.nation_datecreate;
            national.nation_dateupdate = DateTime.Now;
            national.nation_bin = natio.nation_bin;
            national.nation_option = natio.nation_option;

            //var i = new ImagesController();
            //if (IMG != null)
            //{
            //    var code = Guid.NewGuid().ToString();
            //    var img = new ImagesController();
            //    img.AddImages(IMG, Common.Link.IMG_AUTHOR, code);
            //    national.nation_img = code + IMG.FileName;
            //}
            //else
            //{
            //    national.nation_img = au.nation_img;
            //}


            var dao = new NationsDAO();
            if (dao.Edit(national))
            {
                return Redirect("/Admin/NationsAdmin");
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
            var dao = new NationsDAO();
            if (dao.Del(id))
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == false).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_option = n.nation_option

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
            var dao = new NationsDAO();
            if (dao.Restore(id))
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == true).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_option = n.nation_option

                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        //Hàm xoá
        public JsonResult DeleteNation(int? id)
        {
            var dao = new NationsDAO();
            var j = new JsonAdminController();
            if (dao.Delete(id))
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == true).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_option = n.nation_option

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