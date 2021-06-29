set @UsdRate=78.3;
select cr.carriername as ANS,CallCount as 'No Of Calls',
round(ActualDuration,2) as 'Actual Duration (Minute)',round(RoundedDuration,2) as 'Billed Duration Minutes (15 Sec Pulse)',
round(X,2) as 'X (BDT)', round(Y,6) as 'Y (USD)',(select @UsdRate) as 'USD Rate', round(Y*@UsdRate,2) as 'Y (BDT)', round(x-@UsdRate*y,2) as 'Z (BDT)',
round(.15*(x-@UsdRate*y),2) as 'ICX Revenue [15% of Z] (BDT)',
round((Y*@UsdRate)+.15*(x-@UsdRate*y),2) as 'Billed Amount [15% of Z+Y] (BDT)'
from
(
select date(starttime) as `Date`,ansidorig,Count(*) as CallCount,matchedprefixy,sum(durationsec)/60 ActualDuration,
sum((15*(truncate(c.durationsec/15,0)+CASE WHEN ( (c.durationsec/15-truncate(c.durationsec/15,0)) ) >0 THEN 1 ELSE 0 END) )/60) as RoundedDuration,
sum(SubscriberChargeXOut) as X, sum(CarrierCostYigwout) as Y,customerid,supplierid
from 
platinum.cdrLOADED c
where calldirection=2
and chargingstatus=1
and starttime>='2014-04-01'
and starttime<'2014-05-01'
group by ansidorig
) x
left join carrier cr
on x.ansidorig=cr.idcarrier
