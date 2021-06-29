select `Date`,cr.partnername as ANS,cricx.partnername as IGW,concat(matchedprefixy,' (',ic.Description,')') as Destination, concat(cc.Code,' (',cc.Name,')' )as Country,
CallCount as 'No Of Calls',
round(ActualDuration,2) as 'Actual Duration (Minute)',round(RoundedDuration,2) as 'Billed Duration Minutes (15 Sec Pulse)',
round(X,2) as 'X (BDT)', round(Y,6) as 'Y (USD)',(select 78.3) as 'USD Rate', round(Y*78.3,2) as 'Y (BDT)', round(x-78.3*y,2) as 'Z (BDT)',
round(.15*(x-78.3*y),2) as 'ICX Revenue [15% of Z] (BDT)'
from
(
select date(starttime) `Date`,customerid,Count(*) as CallCount,matchedprefixy,sum(durationsec)/60 ActualDuration,
sum((15*(truncate(c.durationsec/15,0)+CASE WHEN ( (c.durationsec/15-truncate(c.durationsec/15,0)) ) >0 THEN 1 ELSE 0 END) )/60) as RoundedDuration,
sum(SubscriberChargeXOut) as X, sum(CarrierCostYigwout) as Y,supplierid
from purple.cdrloaded c
where calldirection=2
and starttime>='2015-11-01'
and starttime<'2015-12-01'
group by customerid,matchedprefixy,supplierid,date(starttime)
) x
left join partner cr
on x.customerid=cr.idpartner
left join xyzprefix ic
on x.matchedprefixy=ic.Prefix
left join CountryCode cc
on ic.CountryCode=cc.Code
left join partner cricx
on x.supplierid=cricx.idpartner
