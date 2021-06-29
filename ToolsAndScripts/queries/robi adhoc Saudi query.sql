select p.partnername,TotalCalls,ActualDuration,RoundedDuration as BilledDuration from
(
select outgoingroute,count(*) as TotalCalls,sum(durationsec)/60 ActualDuration,
sum((15*(truncate(c.durationsec/15,0)+CASE WHEN ( (c.durationsec/15-truncate(c.durationsec/15,0)) ) >0 THEN 1 ELSE 0 END) )/60) as RoundedDuration
from cdrdisposed c
where starttime>='2015-09-25 02:00:00'
and starttime<'2015-09-27 00:00:00'
and OriginatingCalledNumber like '00966%'
group by outgoingroute
) x
left join route r
on x.outgoingroute=r.routename
left join partner p
on r.idpartner=p.idpartner
