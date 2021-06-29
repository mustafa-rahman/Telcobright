select outgoingroute,floor(terminatingcic/32) as E1,count(*) successfulcall,sum(durationsec)/60 as TotalDuration ,sum(durationsec)/sum(chargingstatus)/60 as acd from cdrloaded
where starttime>'2014-10-08 17:00:00'
and starttime<='2014-10-08 19:00:00'
and calldirection=3
and chargingstatus=1
and outgoingroute like 'Purple_4'
group by outgoingroute,floor(terminatingcic/32)
having successfulcall>10
order by acd asc