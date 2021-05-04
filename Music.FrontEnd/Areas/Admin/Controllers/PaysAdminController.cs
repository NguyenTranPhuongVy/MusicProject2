using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.EF;
using Music.Model.DAO;
using Music.FrontEnd.Function;
using Music.Common;

namespace Music.FrontEnd.Areas.Admin.Controllers
{
    public class PaysAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        // GET: Admin/PaysAdmin
        public ActionResult Index()
        {
            return View(db.Pays.OrderByDescending(n => n.pay_datecreate).ToList());
        }
    }
}