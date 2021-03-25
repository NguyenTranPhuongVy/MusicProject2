using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Music.Frontend.Controllers
{
    public class ViewController : Controller
    {
        // GET: View
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ErrorLay()
        {
            return PartialView();
        }

        public PartialViewResult Validation()
        {
            return PartialView();
        }
    }
}