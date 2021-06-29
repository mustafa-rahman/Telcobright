select c.partnername as `Originating Operator`, OriginatingCallingNumber as `Calling MSISDN`, 
case calldirection when 1 then 'Domestic' else (case when 3 then 'Intl. In' else 'Intl. Out'end) end as `Call Type`,
TotalCalls as `Call Count`,Minutes as `Call Duration in Min`, ACD as `ACD Value`, supp.partnername as `Terminating Operator`, 
OriginatingCalledNumber as `Called MSISDN` from
(
select calldirection,customerid,OriginatingCallingNumber,count(*) TotalCalls,sum(roundedduration)/60 as Minutes,(sum(roundedduration)/60)/count(*) as ACD,
supplierid,OriginatingCalledNumber
from cdrloaded
where starttime > '2016-03-27 00:00:00'
and starttime <= '2016-03-27 00:59:59'
group by calldirection,customerid,originatingcallingnumber,supplierid,OriginatingCalledNumber
having Minutes>=10
) x
left join partner c
on x.customerid=c.idpartner
left join partner supp
on x.supplierid=supp.idpartner
order by `Call Type`, `Call Duration in Min` desc

