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
    
    public partial class ratetaskassign
    {
        public int id { get; set; }
        public Nullable<int> Prefix { get; set; }
        public string description { get; set; }
        public string rateamount { get; set; }
        public string WeekDayStart { get; set; }
        public string WeekDayEnd { get; set; }
        public string starttime { get; set; }
        public string endtime { get; set; }
        public string Resolution { get; set; }
        public string MinDurationSec { get; set; }
        public string SurchargeTime { get; set; }
        public string SurchargeAmount { get; set; }
        public long idrateplan { get; set; }
        public Nullable<int> CountryCode { get; set; }
        public string date1 { get; set; }
        public string field1 { get; set; }
        public string field2 { get; set; }
        public string field3 { get; set; }
        public string field4 { get; set; }
        public string field5 { get; set; }
        public string startdate { get; set; }
        public string enddate { get; set; }
        public Nullable<int> Inactive { get; set; }
        public string RouteDisabled { get; set; }
        public string Type { get; set; }
        public string Currency { get; set; }
        public string OtherAmount1 { get; set; }
        public string OtherAmount2 { get; set; }
        public string OtherAmount3 { get; set; }
        public string OtherAmount4 { get; set; }
        public string OtherAmount5 { get; set; }
        public string OtherAmount6 { get; set; }
        public string OtherAmount7 { get; set; }
        public string OtherAmount8 { get; set; }
        public string OtherAmount9 { get; set; }
        public string OtherAmount10 { get; set; }
        public string TimeZoneOffsetSec { get; set; }
        public string RatePosition { get; set; }
        public string IgwPercentageIn { get; set; }
        public string ConflictingRateIds { get; set; }
        public string ChangedByTaskId { get; set; }
        public string ChangedOn { get; set; }
        public string Status { get; set; }
        public string idPreviousRate { get; set; }
        public string EndPreviousRate { get; set; }
        public string Category { get; set; }
        public string SubCategory { get; set; }
        public int changecommitted { get; set; }
        public string OverlappingRates { get; set; }
        public string ConflictingRates { get; set; }
        public string AffectedRates { get; set; }
        public System.DateTime PartitionDate { get; set; }
        public string Comment1 { get; set; }
        public string Comment2 { get; set; }
    
        public virtual partner partner { get; set; }
        public virtual rateplan rateplan { get; set; }
        public virtual rateplanassignmenttuple rateplanassignmenttuple { get; set; }
    }
}
