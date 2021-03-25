using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Music.FrontEnd.Controllers
{
    public class VideosController : Controller
    {
        // GET: Videos
        public ActionResult VideoMV()
        {
            return View();
        }
    }
}