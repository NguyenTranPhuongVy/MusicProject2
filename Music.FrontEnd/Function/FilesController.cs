using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;
using Music.Model.DAO;
using Music.Model.EF;

namespace Music.FrontEnd.Function
{
    public class FilesController : Controller
    {
        // GET: Images
        public string AddImages(HttpPostedFileBase IMG, string LinkImages, string code)
        {
            var fileimg = Path.GetFileName(IMG.FileName);
            var pa = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Images/" + LinkImages), code + fileimg);
            IMG.SaveAs(pa);
            return code + fileimg;
        }

        public string AddMuscis(HttpPostedFileBase Music, string Link, string code)
        {
            var filemp3 = Path.GetFileName(Music.FileName);
            var pa = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Link/" + Link), code + filemp3);
            Music.SaveAs(pa);
            return code + filemp3;
        }
    }
}