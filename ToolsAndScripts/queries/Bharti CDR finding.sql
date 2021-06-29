SELECT StartTime, AnswerTime, EndTime,
OriginatingCallingNumber as CallingNumber,OriginatingCalledNumber as CalledNumber,durationsec as ActualDuration,
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as 'Duration (Sec)'
FROM platinum.cdrerror 
where starttime >='2014-04-23 12:50:00'
#and starttime <'2014-04-23 18:20:40'
and outgoingroute like 'Bharti_S%'
and terminatingcallednumber like '0091%'
and chargingstatus=1
union all
SELECT StartTime, AnswerTime, EndTime,
OriginatingCallingNumber as CallingNumber,OriginatingCalledNumber as CalledNumber,durationsec as ActualDuration,
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as 'Duration (Sec)'
FROM platinum.cdrloaded
where starttime >='2014-04-23 12:50:00'
#and starttime <'2014-04-23 18:20:40'
and chargingstatus=1
and outgoingroute like 'Bharti_S%'
and terminatingcallednumber like '0091%'
