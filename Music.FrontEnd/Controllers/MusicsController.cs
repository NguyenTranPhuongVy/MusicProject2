using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Music.FrontEnd.Controllers
{
    public class MusicsController : Controller
    {
        // GET: Musics
        public ActionResult DetailsMusic()
        {
            return View();
        }
    }
}