using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Music.FrontEnd.Models
{
    public class jPays
    {
        public int pay_id { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<int> pakage_id { get; set; }
        public string pay_datecreate { get; set; }
        public string pay_dateexpiration { get; set; }
        public Nullable<decimal> pay_summoney { get; set; }
        public string pay_active { get; set; }
        public Nullable<bool> pay_status { get; set; }
        public string package_name { get; set; }
        public string pakage_price { get; set; }
    }
}