set @startTime='2018-07-01';
set @endTime='2018-07-05';

select starttime as `Start Time`,cr.partnername as 'Source Network',
(select 'Robi') as `Destination Network`,OriginatingCallingNumber 'Caller Number (A NUM)',
originatingCalledNumber 'Called Number (B Num)',
duration1 as `Billed Duration`, RedirectingNumber as `Redirect Number`,
(select 'Roaming Case') as Remarks
from 
cdr c
left join partner cr on 
c.inpartnerid=cr.idpartner
where starttime>=@starttime
and endtime<@endTime
and OutgoingRoute in 
(
select routename from route 
where idpartner=24
and NationalOrInternational=1
)
and servicegroup=1
and 
(originatingcallingnumber not like '1%'
and originatingcallingnumber not like '01%'
and originatingcallingnumber not like '8801%'
)
and 
(originatingcallednumber like '018%'
);

