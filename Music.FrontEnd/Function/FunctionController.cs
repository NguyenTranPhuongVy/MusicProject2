using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;
using Music.Model.DAO;
using Music.Model.EF;

namespace Music.FrontEnd.Function
{
    public class FunctionController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        // GET: Function
        public User CookieID()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["user_id"];
            User users = db.Users.Find(Int32.Parse(cookie.Value.ToString()));
            return users;

        }
        //Hàm lấy cookie ko
        public HttpCookie Cookie()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["user_id"];
            return cookie;

        }
    }
}