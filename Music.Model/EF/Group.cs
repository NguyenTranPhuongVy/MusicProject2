//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Music.Model.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Group
    {
        public int group_id { get; set; }
        public Nullable<int> music_id { get; set; }
        public Nullable<int> singer_id { get; set; }
        public Nullable<int> category_id { get; set; }
        public Nullable<System.DateTime> group_datecreate { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Singer Singer { get; set; }
        public virtual Music Music { get; set; }
    }
}