set @SupplierId=241;
set @RatePlan=252;

select sr.prefix,max(sr.description) Description,
sum(DurationSec/60) as actualDuration,
sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end)/60 as BilledDuration,
sum(suppliercost) as CostInDB,
max(sr.rateamount) Rate,
(sum(case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end))/60*sr.rateamount as CalculatedCost 
from cdrloaded c
left join supplierrate sr
on c.matchedprefixsupplier=sr.prefix
and sr.idsupplierrateplan=@rateplan
where supplierID=@supplierid
and c.StartTime >='2014-06-23 06:00:00'
 and c.StartTime <'2014-06-30 06:00:00'
and ChargingStatus=1
group by sr.prefix with rollup

