SET @StartPeriod='2014-06-01';
SET @EndPeriod='2014-07-01';
select * from cdrerror
where starttime >= @startperiod
and starttime <@endperiod
and chargingstatus=1
