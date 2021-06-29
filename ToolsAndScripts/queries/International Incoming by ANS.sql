select ansidterm,count(*) as Cnt,sum(roundedduration)/60 as Duration
from 
(
select * from cdrloaded
union all
select * from cdrerror
) x
where starttime>='2013-02-01' and starttime<'2013-03-01' 
and calldirection=3
and chargingstatus=1
and (originatingcallednumber like '88011%'
or originatingcallednumber like '0088011%'
)
group by ansidterm
