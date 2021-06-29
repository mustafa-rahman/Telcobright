select Count(*) as CallCount,sum(durationsec)/60 as ActualDuration,
sum(roundedduration)/60 as BilledDuration,(sum(roundedduration)-sum(durationsec))*100/sum(durationsec) as DiffPercentage
from platinum.cdrloaded
where calldirection=2
and starttime>='2014-06-01'
and starttime<'2014-07-01'

