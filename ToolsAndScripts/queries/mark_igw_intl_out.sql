select originatingcallingnumber,ansidorig                       ,
terminatingcallednumber,
calldirection                   ,
chargingstatus                  ,
durationsec                     ,
matchedprefixY                  ,
matchedprefixsupplier           ,
outgoingroute                   ,
supplierid                      ,
suppliercost                    ,
suppliercurrency                ,
CountryCode                      ,
SubscriberChargeXOut            ,
CarrierCostYIgwOut              ,
RevenueAnsOut                   ,
RevenueIGWOut                   ,
RevenueIcxOut                   ,
RevenueVatCommissionOut         ,
idCall                          ,
SequenceNumber                  ,
FileSerialNo                    ,
CallDirection                   ,
IncomingRoute                   ,
OriginatingCalledNumber         ,
ChargingStatus                  ,
StartTime                       ,
EndTime                         ,
CustomerID                      ,
customerprepaid,
field1,
field2                 
from cdrerror
where calldirection=2;