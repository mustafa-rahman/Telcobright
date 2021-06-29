select Fileserialno,SequenceNumber,starttime as `Start Time`,cr.carriername as 'Source Network',
(select 'Robi') as `Destination Network`,OriginatingCallingNumber 'Caller Number (A NUM)',
originatingCalledNumber 'Called Number (B Num)',
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as `Rounded Duration`,
RedirectingNumber as `Redirect Number`,
(select 'Call Forwarding Case') as Remarks
from 
cdrloaded c
left join carrier cr on 
c.customerid=cr.idcarrier
where starttime>='2013-02-01'
and endtime<'2013-03-01'
and supplierid=26
and calldirection=1
and 
(originatingcallingnumber like '18%'
or originatingcallingnumber like '018%'
or originatingcallingnumber like '88018%'
)


