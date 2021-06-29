select servicegroup,sum(durationsec) ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),2))>= .08
then ceiling(durationsec)
else floor(durationsec) end) as BilledDuration
from cdr
group by servicegroup;
