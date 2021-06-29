Select * from(
SELECT cr.carriername, x.customerid,x.`Date`,x.CallCount,x.Successcall,x.`SuccessCallDuration(min)`,x.`ASR(%)`,x.ACD,x.PDD 
From(
select customerid, DATE_FORMAT(date(starttime),'%d/%m/%Y') `Date`,Count(*) as CallCount,sum(chargingstatus) as Successcall,sum(durationsec)/60 `SuccessCallDuration(min)`,
 (sum(chargingstatus)/count(*))*100 as `ASR(%)`, ((sum(durationsec)/60)/sum(chargingstatus)) as ACD,
(Sum(connecttime-starttime)/sum(chargingstatus)) as PDD
from platinum.cdrloaded
group by customerid,date(starttime)
) x
left join carrier cr
on x.customerid=cr.idcarrier
)y
where y.SuccessCall>0;