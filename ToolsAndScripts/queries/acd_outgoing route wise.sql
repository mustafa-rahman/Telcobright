select outgoingroute,sum(durationsec)/sum(chargingstatus)/60 as acd from cdrloaded
where starttime>'2014-10-08 17:00:00'
and starttime<='2014-10-08 19:00:00'
and calldirection=3
and chargingstatus=1
group by outgoingroute
order by acd asc