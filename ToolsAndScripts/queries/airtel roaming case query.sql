select starttime as `Start Time`,cr.carriername as 'Source Network',
(select 'Robi') as `Destination Network`,OriginatingCallingNumber 'Caller Number (A NUM)',
originatingCalledNumber 'Called Number (B Num)',
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as `Rounded Duration`,
RedirectingNumber as `Redirect Number`,
(select 'Roaming Case') as Remarks
from 
cdrloaded c
left join carrier cr on 
c.customerid=cr.idcarrier
where starttime>='2014-07-01'
and endtime<'2014-08-01'
and outgoingroute in ('10','52','55')
and calldirection=1
and supplierid=39
and 
(originatingcallingnumber not like '1%'
and originatingcallingnumber not like '01%'
and originatingcallingnumber not like '8801%'
)
and 
(originatingcallednumber like '016%'
)

