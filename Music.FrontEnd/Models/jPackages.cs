using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Music.FrontEnd.Models
{
    public class jPackages
    {
        public int package_id { get; set; }
        public string package_name { get; set; }
        public Nullable<decimal> package_money { get; set; }
        public string package_content { get; set; }
        public string package_datecreate { get; set; }
        public Nullable<bool> package_active { get; set; }
        public Nullable<bool> package_bin { get; set; }
        public Nullable<int> pakage_price { get; set; }
        public string pakege_deadline { get; set; }
        public Nullable<bool> package_option { get; set; }
    }
}