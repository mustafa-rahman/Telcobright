select
idCall                       
,SequenceNumber               
,FileSerialNo                 
,CallDirection                
,IncomingRoute                
,OriginatingCalledNumber 
,OriginatingCallingNumber           
,ChargingStatus               
,StartTime                    
,EndTime   
,CustomerID                   
,customerprepaid
calldirection
,chargingstatus
,durationsec  
,matchedprefixY  
,outgoingroute  
,ansidorig  
,CountryCode              
,SubscriberChargeXOut     
,CarrierCostYIgwOut       
,RevenueAnsOut            
,RevenueIGWOut            
,RevenueIcxOut            
,RevenueVatCommissionOut 
,field1            
,field2 
,MEDIATIONCOMPLETE
from cdrerror
where calldirection=2
and starttime >= '2014-06-01'
and starttime <'2014-07-01'
and incomingroute like 'ICX%';