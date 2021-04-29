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
    public class NationalsAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        NationsDAO nationsDAO = new NationsDAO();
        // GET: Admin/NationalsAdmin
        public ActionResult Index()
        {
            return View(db.Nationals.Where(n => n.nation_bin == false).OrderBy(n => n.nation_name).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Nationals.Where(n => n.nation_bin == true).OrderBy(n => n.nation_name).ToList());
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
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_option = n.nation_option
                }).ToList();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(null);
            }
        }

        [HttpGet]
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
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_option = n.nation_option
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
            var dao = new NationsDAO();
            if (dao.Del(id))
            {
                List<National> nationals = db.Nationals.Where(n => n.nation_bin == false).OrderBy(n => n.nation_name).ToList();
                List<jNations> list = nationals.Select(n => new jNations
                {
                    nation_active = n.nation_active,
                    nation_bin = n.nation_bin,
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
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
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
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
                    nation_datecreate = n.nation_datecreate.Value.ToString("dd/MM/yyyy"),
                    nation_dateupdate = n.nation_dateupdate.Value.ToString("dd/MM/yyyy"),
                    nation_id = n.nation_id,
                    nation_name = n.nation_name,
                    nation_option = n.nation_option
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
        public ActionResult Add(Music.Model.EF.National national)
        {
            national.nation_bin = false;
            national.nation_dateupdate = DateTime.Now;

            if (national.nation_active != true && national.nation_active != false)
            {
                national.nation_active = false;
            }

            if (nationsDAO.Add(national))
            {
                return Redirect("/Admin/NationalsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Music.Model.EF.National national)
        {
            National nation = db.Nationals.Find(national.nation_id);
            national.nation_bin = false;
            national.nation_datecreate = nation.nation_datecreate;
            national.nation_dateupdate = DateTime.Now;
            national.nation_active = true;

            if (national.nation_active != true && national.nation_active != false)
            {
                national.nation_active = false;
            }

            if (nationsDAO.Edit(national))
            {
                return Redirect("/Admin/NationalsAdmin");
            }
            else
            {
                return Redirect(Common.Link.NOT_404);
            }
        }
    }
}