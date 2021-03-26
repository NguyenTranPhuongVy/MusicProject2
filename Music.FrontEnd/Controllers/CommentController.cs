using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.Model.DAO;
using Music.Model.EF;

namespace Music.FrontEnd.Controllers
{
    public class CommentController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Comment
        public ActionResult Index()
        {
            return View();
        }

    }
}