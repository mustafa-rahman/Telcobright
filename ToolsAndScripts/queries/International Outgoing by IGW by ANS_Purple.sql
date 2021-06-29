select cr.carriername as ANS,cricx.carriername as IGW,
CallCount as 'No Of Calls',
round(ActualDuration,2) as 'Actual Duration (Minute)',round(RoundedDuration,2) as 'Billed Duration Minutes (15 Sec Pulse)',
round(X,2) as 'X (BDT)', round(Y,6) as 'Y (USD)',(select 78.4) as 'USD Rate', round(Y*78.4,2) as 'Y (BDT)', round(x-78.4*y,2) as 'Z (BDT)',
round(.15*(x-78.4*y),2) as 'ICX Revenue [15% of Z] (BDT)'
from
(
select customerid,Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum((15*(truncate(c.durationsec/15,0)+CASE WHEN ( (c.durationsec/15-truncate(c.durationsec/15,0)) ) >0 THEN 1 ELSE 0 END) )/60) as RoundedDuration,
sum(SubscriberChargeXOut) as X, sum(CarrierCostYigwout) as Y,supplierid
from purple.cdrloaded c
where calldirection=2
and starttime>='2014-02-01'
and starttime<'2014-03-01'
group by customerid,supplierid
) x
left join carrier cr
on x.customerid=cr.idcarrier
left join carrier cricx
on x.supplierid=cricx.idcarrier
