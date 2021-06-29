select starttime as `Start Time`,cr.partnername as 'Source Network',
(select 'Robi') as `Destination Network`,OriginatingCallingNumber 'Caller Number (A NUM)',
originatingCalledNumber 'Called Number (B Num)',
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as `Rounded Duration`,
RedirectingNumber as `Redirect Number`,
(select 'Roaming Case') as Remarks
from 
cdrdisposed c
left join route r
on c.incomingroute=r.routename	
left join partner cr on 
r.idpartner=cr.idpartner
where starttime>='2015-10-01'
and endtime<'2015-11-01'
and outgoingroute in (11,50,53,56)
and
(originatingcallingnumber not like '1%'
and originatingcallingnumber not like '01%'
and originatingcallingnumber not like '8801%'
)
and 
(originatingcallednumber like '018%'
)
limit 0,100;
