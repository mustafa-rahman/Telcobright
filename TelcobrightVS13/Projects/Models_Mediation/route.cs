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
    
    public partial class route
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public route()
        {
            this.rateplanassignmenttuples = new HashSet<rateplanassignmenttuple>();
        }
    
        public int idroute { get; set; }
        public string RouteName { get; set; }
        public int SwitchId { get; set; }
        public int CommonRoute { get; set; }
        public int idPartner { get; set; }
        public int NationalOrInternational { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
        public Nullable<System.DateTime> date1 { get; set; }
        public Nullable<int> field1 { get; set; }
        public Nullable<int> field2 { get; set; }
        public Nullable<int> field3 { get; set; }
        public Nullable<int> field4 { get; set; }
        public string field5 { get; set; }
    
        public virtual ne ne { get; set; }
        public virtual partner partner { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<rateplanassignmenttuple> rateplanassignmenttuples { get; set; }
    }
}