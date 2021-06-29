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
    
    public partial class job
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public job()
        {
            this.jobsegments = new HashSet<jobsegment>();
        }
    
        public long id { get; set; }
        public int idjobdefinition { get; set; }
        public string JobName { get; set; }
        public Nullable<int> OwnerServer { get; set; }
        public Nullable<int> idNE { get; set; }
        public int priority { get; set; }
        public Nullable<long> SerialNumber { get; set; }
        public int Status { get; set; }
        public Nullable<long> Progress { get; set; }
        public Nullable<System.DateTime> CreationTime { get; set; }
        public Nullable<System.DateTime> LastExecuted { get; set; }
        public Nullable<System.DateTime> CompletionTime { get; set; }
        public Nullable<int> NoOfSteps { get; set; }
        public string JobSummary { get; set; }
        public string Error { get; set; }
        public string JobParameter { get; set; }
        public string JobState { get; set; }
        public string JobAdditionalInfo { get; set; }
    
        public virtual enumjobdefinition enumjobdefinition { get; set; }
        public virtual enumjobstatu enumjobstatu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<jobsegment> jobsegments { get; set; }
        public virtual ne ne { get; set; }
        public virtual jobcompletion jobcompletion { get; set; }
    }
}