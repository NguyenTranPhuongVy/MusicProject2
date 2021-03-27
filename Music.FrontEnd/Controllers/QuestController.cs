using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Music.FrontEnd.Controllers
{
    public class QuestController : Controller
    {
        // GET: Quest
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult JoinQuest(int? id)
        {

            return View();
        }
    }
}