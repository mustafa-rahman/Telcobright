SET @StartPeriod='2014-05-31 00:00:00';
SET @EndPeriod='2014-06-01 23:59:59';

select min(fileserialno),min(starttime) from
(
select fileserialno,starttime from 
(
select min(fileserialno) fileserialno,min(starttime) starttime
from cdrloaded
where starttime > @StartPeriod
and starttime < @EndPeriod
union all 
select min(fileserialno) fileserialno,min(starttime) starttime
from cdrerror
where starttime > @StartPeriod
and starttime < @EndPeriod
) x0
) x
