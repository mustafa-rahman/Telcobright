select count(*) as LoadedCount, (select 0) as ErrorCount from purple.cdrloaded
where fileserialno>=27799
and fileserialno<=62820
and 
(starttime >='2013-03-01'
or starttime <'2013-02-01')
union all
select (select 0) as LoadedCount, count(*) as ErrorCount from purple.cdrerror
where fileserialno>=27799
and fileserialno<=62820
and (starttime >='2013-03-01'
or starttime <'2013-02-01')
