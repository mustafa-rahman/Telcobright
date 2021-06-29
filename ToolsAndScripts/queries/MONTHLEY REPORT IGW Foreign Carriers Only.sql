select c.CarrierName as `Foreign Carrier`,c.CarrierName,`Date`,CallCount,ActualDuration,BilledDuration from
(
select customerid,ansidterm,Count(*) as CallCount,sum(durationsec)/60 ActualDuration,sum(roundedduration)/60 RoundedDuration
from cdrloaded
where calldirection=3
and starttime>='2013-04-01'
and starttime<'2013-05-01'
group by customerid
) x
left join
carrier c
on x.customerid=c.idcarrier;
