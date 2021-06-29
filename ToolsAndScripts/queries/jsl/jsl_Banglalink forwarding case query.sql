set @startTime='2018-07-01';
set @endTime='2018-07-05';
select starttime as `Start Time`,cr.partnername as 'Source Network',
(select 'Banglalink') as `Destination Network`, RedirectingNumber 'Caller Number (A NUM)',
OriginatingCalledNumber 'Received Number (B Num)',duration1 as `BilledDuration`,
originatingCallingNumber as `Redirect Number`,
(select 'Call Forwarding Case') as Remarks
from 
cdr c
left join partner cr on 
c.InPartnerId=cr.idpartner
where starttime>=@starttime
and endtime<@endTime
and OutgoingRoute in 
(
select routename from route 
where idpartner=25
and NationalOrInternational=1
)
and servicegroup=1
and 
(
redirectingnumber like '19%'
or redirectingnumber like '019%'
or redirectingnumber like '88019%'
or redirectingnumber like '19%'
or redirectingnumber like '019%'
or redirectingnumber like '88019%'
);