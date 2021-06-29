select DATE_FORMAT(date(starttime),'%d/%m/%Y') `Date`,Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end)/60 as BilledDuration
from
(
select *
from platinum.cdrloaded
where calldirection=3
and starttime>='2013-02-20'
and starttime<'2013-02-21'
union all
select *
from platinum.cdrerror
where calldirection=3
and starttime>='2013-02-20'
and starttime<'2013-02-21'
union all
select *
from platinum.cdrtemploaded
where calldirection=3
and starttime>='2013-02-20'
and starttime<'2013-02-21'
) x

group by date(starttime)
