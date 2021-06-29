select 
durationsec ActualDuration,truncate(durationsec-truncate(durationsec,0),2) fractionPart,
case when (truncate(durationsec-truncate(durationsec,0),2))>= .08
then ceiling(durationsec)
else floor(durationsec) end as BilledDuration
from cdr
limit 0,100;