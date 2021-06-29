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
    
    public partial class cdrpartialrawinstance
    {
        public int SwitchId { get; set; }
        public long IdCall { get; set; }
        public long SequenceNumber { get; set; }
        public string FileName { get; set; }
        public int ServiceGroup { get; set; }
        public string IncomingRoute { get; set; }
        public string OriginatingIP { get; set; }
        public Nullable<int> OPC { get; set; }
        public Nullable<int> OriginatingCIC { get; set; }
        public string OriginatingCalledNumber { get; set; }
        public string TerminatingCalledNumber { get; set; }
        public string OriginatingCallingNumber { get; set; }
        public string TerminatingCallingNumber { get; set; }
        public Nullable<int> PrePaid { get; set; }
        public decimal DurationSec { get; set; }
        public System.DateTime EndTime { get; set; }
        public Nullable<System.DateTime> ConnectTime { get; set; }
        public Nullable<System.DateTime> AnswerTime { get; set; }
        public Nullable<int> ChargingStatus { get; set; }
        public Nullable<float> PDD { get; set; }
        public string CountryCode { get; set; }
        public string AreaCodeOrLata { get; set; }
        public Nullable<int> ReleaseDirection { get; set; }
        public Nullable<int> ReleaseCauseSystem { get; set; }
        public Nullable<int> ReleaseCauseEgress { get; set; }
        public string OutgoingRoute { get; set; }
        public string TerminatingIP { get; set; }
        public Nullable<int> DPC { get; set; }
        public Nullable<int> TerminatingCIC { get; set; }
        public System.DateTime StartTime { get; set; }
        public Nullable<int> InPartnerId { get; set; }
        public Nullable<decimal> CustomerRate { get; set; }
        public Nullable<int> OutPartnerId { get; set; }
        public Nullable<decimal> SupplierRate { get; set; }
        public string MatchedPrefixY { get; set; }
        public Nullable<decimal> UsdRateY { get; set; }
        public string MatchedPrefixCustomer { get; set; }
        public string MatchedPrefixSupplier { get; set; }
        public Nullable<decimal> InPartnerCost { get; set; }
        public Nullable<decimal> OutPartnerCost { get; set; }
        public Nullable<decimal> CostAnsIn { get; set; }
        public Nullable<decimal> CostIcxIn { get; set; }
        public Nullable<decimal> Tax1 { get; set; }
        public Nullable<decimal> IgwRevenueIn { get; set; }
        public Nullable<decimal> RevenueAnsOut { get; set; }
        public Nullable<decimal> RevenueIgwOut { get; set; }
        public Nullable<decimal> RevenueIcxOut { get; set; }
        public Nullable<decimal> Tax2 { get; set; }
        public Nullable<decimal> XAmount { get; set; }
        public Nullable<decimal> YAmount { get; set; }
        public string AnsPrefixOrig { get; set; }
        public Nullable<int> AnsIdOrig { get; set; }
        public string AnsPrefixTerm { get; set; }
        public Nullable<int> AnsIdTerm { get; set; }
        public Nullable<int> ValidFlag { get; set; }
        public Nullable<int> PartialFlag { get; set; }
        public Nullable<int> ReleaseCauseIngress { get; set; }
        public Nullable<int> InRoamingOpId { get; set; }
        public Nullable<int> OutRoamingOpId { get; set; }
        public Nullable<int> CalledPartyNOA { get; set; }
        public Nullable<int> CallingPartyNOA { get; set; }
        public string AdditionalSystemCodes { get; set; }
        public string AdditionalPartyNumber { get; set; }
        public string ResellerIds { get; set; }
        public Nullable<decimal> ZAmount { get; set; }
        public string PreviousRoutes { get; set; }
        public Nullable<int> E1Id { get; set; }
        public string MediaIp1 { get; set; }
        public string MediaIp2 { get; set; }
        public string MediaIp3 { get; set; }
        public string MediaIp4 { get; set; }
        public Nullable<float> CallReleaseDuration { get; set; }
        public Nullable<int> E1IdOut { get; set; }
        public string InTrunkAdditionalInfo { get; set; }
        public string OutTrunkAdditionalInfo { get; set; }
        public string InMgwId { get; set; }
        public string OutMgwId { get; set; }
        public Nullable<int> MediationComplete { get; set; }
        public string Codec { get; set; }
        public Nullable<int> ConnectedNumberType { get; set; }
        public string RedirectingNumber { get; set; }
        public Nullable<int> CallForwardOrRoamingType { get; set; }
        public Nullable<System.DateTime> OtherDate { get; set; }
        public Nullable<decimal> SummaryMetaTotal { get; set; }
        public Nullable<decimal> TransactionMetaTotal { get; set; }
        public Nullable<decimal> ChargeableMetaTotal { get; set; }
        public string ErrorCode { get; set; }
        public Nullable<int> NERSuccess { get; set; }
        public Nullable<decimal> RoundedDuration { get; set; }
        public Nullable<decimal> PartialDuration { get; set; }
        public Nullable<System.DateTime> PartialAnswerTime { get; set; }
        public Nullable<System.DateTime> PartialEndTime { get; set; }
        public Nullable<long> FinalRecord { get; set; }
        public Nullable<decimal> Duration1 { get; set; }
        public Nullable<decimal> Duration2 { get; set; }
        public Nullable<decimal> Duration3 { get; set; }
        public Nullable<decimal> Duration4 { get; set; }
        public Nullable<int> PreviousPeriodCdr { get; set; }
        public string UniqueBillId { get; set; }
        public string AdditionalMetaData { get; set; }
        public Nullable<int> Category { get; set; }
        public Nullable<int> SubCategory { get; set; }
        public Nullable<long> ChangedByJobId { get; set; }
        public System.DateTime SignalingStartTime { get; set; }
    }
}