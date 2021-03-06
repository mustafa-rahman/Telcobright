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
    
    public partial class ne
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ne()
        {
            this.bridgedroutes = new HashSet<bridgedroute>();
            this.jobs = new HashSet<job>();
            this.routes = new HashSet<route>();
        }
    
        public int idSwitch { get; set; }
        public int idCustomer { get; set; }
        public int idcdrformat { get; set; }
        public int idMediationRule { get; set; }
        public string SwitchName { get; set; }
        public string CDRPrefix { get; set; }
        public string FileExtension { get; set; }
        public string Description { get; set; }
        public string SourceFileLocations { get; set; }
        public string BackupFileLocations { get; set; }
        public Nullable<int> LoadingStopFlag { get; set; }
        public Nullable<int> LoadingSpanCount { get; set; }
        public Nullable<int> TransactionSizeForCDRLoading { get; set; }
        public Nullable<int> DecodingSpanCount { get; set; }
        public Nullable<int> SkipAutoCreateJob { get; set; }
        public Nullable<int> SkipCdrListed { get; set; }
        public Nullable<int> SkipCdrReceived { get; set; }
        public Nullable<int> SkipCdrDecoded { get; set; }
        public Nullable<int> SkipCdrBackedup { get; set; }
        public Nullable<int> KeepDecodedCDR { get; set; }
        public Nullable<int> KeepReceivedCdrServer { get; set; }
        public Nullable<int> CcrCauseCodeField { get; set; }
        public Nullable<int> SwitchTimeZoneId { get; set; }
        public string CallConnectIndicator { get; set; }
        public int FieldNoForTimeSummary { get; set; }
        public string EnableSummaryGeneration { get; set; }
        public int ExistingSummaryCacheSpanHr { get; set; }
        public int BatchToDecodeRatio { get; set; }
        public int PrependLocationNumberToFileName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<bridgedroute> bridgedroutes { get; set; }
        public virtual enumcdrformat enumcdrformat { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<job> jobs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<route> routes { get; set; }
        public virtual telcobrightpartner telcobrightpartner { get; set; }
    }
}
