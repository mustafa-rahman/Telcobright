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
    
    public partial class rateplan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public rateplan()
        {
            this.rateassigns = new HashSet<rateassign>();
            this.ratetaskreferences = new HashSet<ratetaskreference>();
            this.ratetaskassigns = new HashSet<ratetaskassign>();
        }
    
        public int id { get; set; }
        public int Type { get; set; }
        public string RatePlanName { get; set; }
        public string Description { get; set; }
        public System.DateTime date1 { get; set; }
        public Nullable<int> field1 { get; set; }
        public Nullable<int> field2 { get; set; }
        public Nullable<int> field3 { get; set; }
        public string field4 { get; set; }
        public string field5 { get; set; }
        public int TimeZone { get; set; }
        public int idCarrier { get; set; }
        public string Currency { get; set; }
        public Nullable<System.DateTime> codedeletedate { get; set; }
        public Nullable<int> ChangeCommitted { get; set; }
        public int Resolution { get; set; }
        public float mindurationsec { get; set; }
        public int SurchargeTime { get; set; }
        public decimal SurchargeAmount { get; set; }
        public Nullable<sbyte> Category { get; set; }
        public Nullable<sbyte> SubCategory { get; set; }
        public string BillingSpan { get; set; }
        public Nullable<int> RateAmountRoundupDecimal { get; set; }
    
        public virtual enumbillingspan enumbillingspan { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<rateassign> rateassigns { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ratetaskreference> ratetaskreferences { get; set; }
        public virtual timezone timezone1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ratetaskassign> ratetaskassigns { get; set; }
    }
}
