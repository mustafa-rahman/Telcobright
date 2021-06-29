select c.CarrierName as `Source Network`,s.CarrierName as `Destination Network` ,c.CarrierName,`Date`,CallCount,ActualDuration,BilledDuration from
(
select customerid,ansidterm, DATE_FORMAT(date(starttime),'%d/%m/%Y') `Date`,Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end)/60 as BilledDuration
from purple.cdrloaded
where calldirection=1
and starttime>='2013-01-01'
and starttime<'2013-02-01'
and ansidterm=12
group by customerid,AnsIdTerm,date(starttime)
) x
left join
carrier c
on x.customerid=c.idcarrier
left join carrier s
on x.ansidterm=s.idcarrier; 
