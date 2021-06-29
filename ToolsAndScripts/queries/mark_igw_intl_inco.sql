select originatingcallednumber,terminatingcallednumber,
originatingcallingnumber,incomingroute,customerid,
calldirection,
chargingstatus,
durationsec,
matchedprefixcustomer,
outgoingroute,
supplierid,
customercost,
customercurrency,
ansidterm,
CostANSIn,
CostICXIn,
CostVATCommissionIn,
IGWRevenueIn
from 
platinum.cdrerror
where calldirection=3
and chargingstatus=1;