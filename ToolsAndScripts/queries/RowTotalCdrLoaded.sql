SET @StartPeriod='2014-06-01';
SET @EndPeriod='2014-06-30';
set @FileStart=1032418;
set @FileEnd=1098247;

select count(*) as LoadedCount,sum(durationsec)/60 as DurationLoaded,sum(roundedduration)/60 as RoundedDurationLoaded, (select 0) as ErrorCount,(select 0) as DurationError, (select 0) as RoundedDurationError
from cdrloaded
where starttime >date_add(@startPeriod,interval (-5) day)
and starttime <date_add(@EndPeriod,interval (5) day)
and fileserialno>=@FileStart
and fileserialno<=@FileEnd
union all
select (select 0) as LoadedCount, (select 0) as DurationLoaded,(select 0) as RoundedDurationLoaded,count(*) as ErrorCount,sum(durationsec)/60 as DurationError,sum(roundedduration)/60 as RoundedDurationError
from cdrerror
where starttime >date_add(@startPeriod,interval (-5) day)
and starttime <date_add(@EndPeriod,interval (5) day)
and fileserialno>=@FileStart
and fileserialno<=@FileEnd