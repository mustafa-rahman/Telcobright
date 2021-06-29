select Count(*) as CallCount, sum(roundedduration)/60 as BilledDuration
from 
(
select * from cdrloaded
where starttime>='2013-07-11'
and starttime<'2013-07-12'
and calldirection=2
and chargingstatus=1
union all
select * from cdrerror
where starttime>='2013-07-11'
and starttime<'2013-07-12'
and calldirection=2
and chargingstatus=1
) c
