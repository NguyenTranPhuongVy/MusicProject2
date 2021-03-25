using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Music.FrontEnd.Models
{
    public class jCategories
    {
        public int category_id { get; set; }
        public string category_name { get; set; }
        public Nullable<bool> category_active { get; set; }
        public Nullable<bool> category_bin { get; set; }
        public string category_note { get; set; }
        public Nullable<int> category_view { get; set; }
        public string category_datecreate { get; set; }
        public string category_dateupdate { get; set; }
        public Nullable<int> user_id { get; set; }
        public string category_img { get; set; }
        public Nullable<bool> category_option { get; set; }
    }
}