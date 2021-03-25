using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Music.FrontEnd.Models
{
    public class jNations
    {
        public int nation_id { get; set; }
        public string nation_name { get; set; }
        public Nullable<bool> nation_active { get; set; }
        public Nullable<bool> nation_bin { get; set; }
        public string nation_datecreate { get; set; }
        public string nation_dateupdate { get; set; }
        public Nullable<bool> nation_option { get; set; }
    }
}