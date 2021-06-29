SELECT StartTime, AnswerTime, EndTime,
OriginatingCalledNumber as CalledNumber,OriginatingCallingNumber as CallingNumber,
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as 'Duration (Sec)'
FROM platinum.cdrerror 
where starttime >=2013-11-13
and supplierid=208
and chargingstatus=1
and calldirection=2;
