select c.CarrierName as `ANS` ,CallCount,BilledDuration from
(
select ansidterm, Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end)/60 as BilledDuration
from 
(
select * from cdrloaded
where starttime>='2013-07-11'
and starttime<'2013-07-12'
and calldirection=3
and chargingstatus=1
union all
select * from cdrerror
where starttime>='2013-07-11'
and starttime<'2013-07-12'
and calldirection=3
and chargingstatus=1
) u
group by AnsIdTerm
) x
left join
carrier c
on x.ansidterm=c.idcarrier;
