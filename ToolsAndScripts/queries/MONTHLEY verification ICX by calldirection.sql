select Count(*) as CallCount,sum(durationsec)/60 as ActualDuration,
sum(roundedduration)/60 as BilledDuration
from cdrloaded
where calldirection=1
and starttime>='2015-02-01'
and starttime<'2015-03-01'

