select 
CallCount as 'No Of Calls',
round(ActualDuration,2) as 'Actual Duration (Minute)',round(RoundedDuration,2) as 'Billed Duration Minutes (15 Sec Pulse)',
round(X,2) as 'X (BDT)', round(Y,6) as 'Y (USD)',(select 78.4) as 'USD Rate', round(Y*78.4,2) as 'Y (BDT)', round(x-78.4*y,2) as 'Z (BDT)',
round(.15*(x-78.4*y),2) as 'ICX Revenue [15% of Z] (BDT)',
round((Y*78.4)+.15*(x-78.4*y),2) as 'Billed Amount [15% of Z+Y] (BDT)'
from
(
select Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum((15*(truncate(c.durationsec/15,0)+CASE WHEN ( (c.durationsec/15-truncate(c.durationsec/15,0)) ) >0 THEN 1 ELSE 0 END) )/60) as RoundedDuration,
sum(SubscriberChargeXOut) as X, sum(CarrierCostYigwout) as Y
from 
platinum.cdrLOADED c
where calldirection=2
and chargingstatus=1
and starttime>='2013-10-01'
and starttime<'2013-11-01'
) x

