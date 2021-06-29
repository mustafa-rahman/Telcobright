select ansprefixterm,count(*) as Total,sum(chargingstatus) as Success, 100*sum(chargingstatus)/count(*) as ASR,(sum(durationsec)/60)/sum(chargingstatus) as ACD  from cdrloaded
where calldirection=3
and ansidterm=125
and starttime > '2014-10-06 19:00:00'
and starttime < '2014-10-06 23:00:00'
group by ansprefixterm