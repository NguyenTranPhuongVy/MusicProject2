﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.FrontEnd.Models;
using Music.Model.EF;

namespace Music.FrontEnd.Controllers
{
    public class JsonController : Controller
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        FunctionController function = new FunctionController();
        // GET: Json
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult JProfile()
        {
            //if (function.CookieID() == null)
            //{
            //    return Redirect("/User/Login");
            //}
            var user = function.CookieID();
            var juser = new jUsers()
            {
                user_active = user.user_active,
                user_bin = user.user_bin,
                user_code = user.user_code,
                user_datecreate = user.user_datecreate.Value.ToLongDateString(),
                user_datelogin = user.user_datelogin.Value.ToLongDateString(),
                user_deadline = user.user_deadline.Value.ToLongDateString(),
                user_email = user.user_email,
                user_id = user.user_id,
                user_img = user.user_img,
                user_name = user.user_name,
                user_option = user.user_option,
                user_pass = user.user_pass,
                user_point = user.user_point,
                user_token = user.user_token
            };
            return Json(juser, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Users()
        {
            var id = function.CookieID();
            var list = from item in db.Users
                       where item.user_id == id.user_id
                       select new
                       {
                           name = item.user_name,
                           phone = item.user_phone

                       };
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}