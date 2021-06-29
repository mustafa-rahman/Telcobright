select c.CarrierName as `ANS` ,CallCount,BilledDuration from
(
select customerid, Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end)/60 as BilledDuration
from 
(
select * from cdrloaded
where starttime>='2013-08-28'
and starttime<'2013-08-29'
and calldirection=1
and chargingstatus=1
union all
select * from cdrerror
where starttime>='2013-08-28'
and starttime<'2013-08-29'
and calldirection=1
and chargingstatus=1
) u
group by customerid
) x
left join
carrier c
on x.customerid=c.idcarrier;
