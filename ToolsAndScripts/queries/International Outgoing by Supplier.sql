select ansidterm,count(*) as Cnt,sum(round(durationsec))/60 as Duration, sum(suppliercost) as Cost
from 
(
select * from cdrloaded
union all
select * from cdrerror
) x
where starttime>='2013-02-01' and starttime<'2013-03-01' 
and calldirection=2
and chargingstatus=1
and outgoingroute like 'Bharti%'
group by supplierid
