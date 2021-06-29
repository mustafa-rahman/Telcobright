select durationsec,
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as RoundedDuration
,c.*
from purple.cdrloaded c
where incomingroute=4
and calldirection=2
and starttime>='2012-12-01'
and starttime<='2012-12-31'