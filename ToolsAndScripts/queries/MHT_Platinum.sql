select hour(starttime) as Hour, count(*) as Total,sum(chargingstatus) as Success, round(sum(durationsec)/60,0) as Duration_Mins,100*sum(chargingstatus)/count(*) as ASR,(sum(durationsec)/60)/sum(chargingstatus) as ACD,
round((sum(endtime)-sum(starttime))/count(*),0) as MHT_Sec
from cdrloaded
where starttime >= '2014-10-06 00:00:00'
and starttime < '2014-10-07 00:00:00'
group by hour(starttime)