select loadedduration as billedduration,round(.15*(x-78.4*y),2) as 'ICX/IGW Revenue [15% of Z] (BDT)', Y,
LoadedDuration
from 
(select sum(roundedduration)/60 as LoadedDuration, (select 0) as ErrorDuration,
sum(SubscriberChargeXOut) as X, sum(CarrierCostYigwout) as Y
from purple.cdrloaded
where calldirection=2
and ansidorig=1
and (starttime >='2013-10-9'
and starttime <'2013-10-11')
) x