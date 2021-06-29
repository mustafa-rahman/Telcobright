select `Date`,cr.carriername as ANS,cricx.carriername as ICX,concat(matchedprefixy,' (',ic.Description,')') as Destination, concat(cc.Code,' (',cc.Name,')' )as Country,
CallCount as 'No Of Calls',
round(ActualDuration,2) as 'Actual Duration (Minute)',round(RoundedDuration,2) as 'Billed Duration Minutes (15 Sec Pulse)',
round(X,2) as 'X (BDT)', round(Y,6) as 'Y (USD)',(select 78.35) as 'USD Rate', round(Y*78.35,2) as 'Y (BDT)', round(x-78.35*y,2) as 'Z (BDT)',
round(.15*(x-78.35*y),2) as 'ICX Revenue [15% of Z] (BDT)',
round((Y*78.35)+.15*(x-78.35*y),2) as 'Billed Amount [15% of Z+Y] (BDT)'
from
(
select date(starttime) as `Date`,ansidorig,Count(*) as CallCount,matchedprefixy,sum(durationsec)/60 ActualDuration,
sum((15*(truncate(c.durationsec/15,0)+CASE WHEN ( (c.durationsec/15-truncate(c.durationsec/15,0)) ) >0 THEN 1 ELSE 0 END) )/60) as RoundedDuration,
sum(SubscriberChargeXOut) as X, sum(CarrierCostYigwout) as Y,customerid
from 
platinum.cdrLOADED c
where calldirection=2
and chargingstatus=1
and starttime>='2014-03-01'
and starttime<'2014-04-01'
group by ansidorig,matchedprefixy,customerid,date(starttime)
) x
left join carrier cr
on x.ansidorig=cr.idcarrier
left join CustomerRateICX ic
on x.matchedprefixy=ic.Prefix
left join CountryCode cc
on ic.CountryCode=cc.Code
left join carrier cricx
on x.customerid=cricx.idcarrier
