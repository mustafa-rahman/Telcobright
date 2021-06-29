select incomingroute,outgoingroute,sum(durationsec)/60 as TotalDuration ,sum(durationsec)/sum(chargingstatus)/60 as acd from cdrloaded
where starttime>'2014-10-08 17:00:00'
and starttime<='2014-10-08 19:00:00'
and calldirection=3
and chargingstatus=1
group by incomingroute,outgoingroute
having totalduration > 500
order by acd asc