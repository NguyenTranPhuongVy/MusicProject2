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
    public class ImagesController : Controller
    {
        // GET: Images
        public string AddImages(HttpPostedFileBase IMG, string LinkImages, string code)
        {
            var fileimg = Path.GetFileName(IMG.FileName);
            var pa = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Images/" + LinkImages), code + fileimg);
            IMG.SaveAs(pa);
            return fileimg;
        }

        public string AddMP3(HttpPostedFileBase MP3, string LinkMP3, string code)
        {
            var filemp3 = Path.GetFileName(MP3.FileName);
            var pa = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/LinkMP3/" + LinkMP3), code + filemp3);
            MP3.SaveAs(pa);
            return filemp3;
        }
    }
}