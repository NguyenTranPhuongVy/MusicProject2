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
    public class UsersAdminController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        FilesController imagesfunction = new FilesController();
        UsersDAO usersDAO = new UsersDAO();
        // GET: Admin/UsersAdmin
        public ActionResult Index()
        {
            return View(db.Users.Where(n => n.user_bin == false).ToList());
        }

        public ActionResult Delete()
        {
            return View(db.Users.Where(n => n.user_bin == false).ToList());
        }
        public ActionResult Active(int? id)
        {
            Music.Model.EF.User user = db.Users.Find(id);
            usersDAO.Active(id);
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult Option(int? id)
        {
            Music.Model.EF.User user = db.Users.Find(id);
            usersDAO.Option(id);
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult Bin(int? id)
        {
            Music.Model.EF.User user = db.Users.Find(id);
            usersDAO.Del(id);
            return RedirectToAction("Index");
        }
        public ActionResult Restore(int? id)
        {
            Music.Model.EF.User user = db.Users.Find(id);
            usersDAO.Restore(id);
            return RedirectToAction("Index");
        }
    }
}