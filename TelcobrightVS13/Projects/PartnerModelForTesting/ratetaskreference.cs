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
    
    public partial class ratetaskreference
    {
        public int id { get; set; }
        public Nullable<int> idRatePlan { get; set; }
        public string Description { get; set; }
    
        public virtual rateplan rateplan { get; set; }
    }
}
