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
    
    public partial class rateplanassign
    {
        public long id { get; set; }
        public int Type { get; set; }
        public string Description { get; set; }
        public System.DateTime date1 { get; set; }
        public Nullable<int> field1 { get; set; }
        public Nullable<int> field2 { get; set; }
        public Nullable<int> field3 { get; set; }
        public string field4 { get; set; }
        public string field5 { get; set; }
        public int TimeZone { get; set; }
        public int idCarrier { get; set; }
        public int Currency { get; set; }
        public Nullable<System.DateTime> codedeletedate { get; set; }
        public Nullable<int> ChangeCommitted { get; set; }
        public string RatePlanName { get; set; }
        public int Resolution { get; set; }
        public int MinDurationSec { get; set; }
        public int SurchargeTime { get; set; }
        public decimal SurchargeAmount { get; set; }
        public Nullable<sbyte> Category { get; set; }
        public Nullable<sbyte> SubCategory { get; set; }
    }
}