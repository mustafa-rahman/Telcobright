use purple;
select `Date`,c.partnername as `Source Network`,s.partnerName as `Destination Network` ,c.partnerName,CallCount,ActualDuration,BilledDuration from
(
select customerid,supplierid, DATE_FORMAT(date(starttime),'%d/%m/%Y') `Date`,Count(*) as CallCount,sum(durationsec)/60 ActualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>=0
then ceiling(durationsec)
else floor(durationsec) end)/60 as RoundedDuration,sum(Duration1)/60 as BilledDuration
from purple.cdrloaded
where calldirection=3
and starttime>='2015-11-01'
and starttime<'2015-12-01'
group by customerid,supplierid,date(starttime)
) x
left join
partner c
on x.customerid=c.idpartner
left join partner s
on x.supplierid=s.idpartner; 
