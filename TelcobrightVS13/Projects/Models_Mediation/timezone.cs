//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MediationModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class timezone
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public timezone()
        {
            this.rateplans = new HashSet<rateplan>();
        }
    
        public int zone_id { get; set; }
        public string abbreviation { get; set; }
        public int time_start { get; set; }
        public int gmt_offset { get; set; }
        public string dst { get; set; }
        public string offsetdesc { get; set; }
        public int id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<rateplan> rateplans { get; set; }
        public virtual zone zone { get; set; }
    }
}
