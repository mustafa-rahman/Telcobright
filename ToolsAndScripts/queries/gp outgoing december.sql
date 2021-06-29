#GP outgoing december
select Count(*) as CallCount,matchedprefixy,sum(durationsec)/60 ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end)/60 as BilledDuration
from purple.cdrloaded
where incomingroute=4
and calldirection=2
and starttime>='2012-12-01'
and starttime<='2012-12-31'
and outgoingroute=8
group by matchedprefixy
