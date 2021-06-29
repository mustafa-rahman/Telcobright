SET @StartPeriod='2014-06-30 00:00:00';
SET @EndPeriod='2014-06-30 23:59:59';

select max(fileserialno),max(starttime) 
from
(
select fileserialno,starttime from 
(
select max(fileserialno) as fileserialno,max(starttime) as starttime from cdrloaded
where starttime > @StartPeriod
and starttime < @EndPeriod
union all 
select max(fileserialno) as fileserialno,max(starttime) as starttime from cdrerror
where starttime > @StartPeriod
and starttime < @EndPeriod
) x0
) x
