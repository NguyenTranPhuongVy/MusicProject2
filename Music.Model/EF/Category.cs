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
    
    public partial class Category
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Category()
        {
            this.Groups = new HashSet<Group>();
        }
    
        public int category_id { get; set; }
        public string category_name { get; set; }
        public Nullable<bool> category_active { get; set; }
        public Nullable<bool> category_bin { get; set; }
        public string category_note { get; set; }
        public Nullable<int> category_view { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<System.DateTime> category_datecreate { get; set; }
        public Nullable<System.DateTime> category_dateupdate { get; set; }
        public string category_img { get; set; }
        public Nullable<bool> category_option { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Group> Groups { get; set; }
    }
}
