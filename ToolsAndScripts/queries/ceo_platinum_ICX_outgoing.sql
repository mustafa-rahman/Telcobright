set @varStartDate='2014-07-01';
set @varEndDate='2014-07-07';
set @p_UsdRateY=78.3;
select `Date`,concat(cn.name,' (',x.CountryCode,')') as Country,cricx.carriername as `ICX`,crintl.CarrierName as 'International Carrier',		
Callsout as 'No of Calls',MinutesOut as 'Duration (Minutes)',		
suppliercost as carriercost,profitbdt as 'Profit (BDT)', profitminute as 'Profit Per Minute'
from		
	(select date(StartTime)as `Date`,CountryCode,sum(chargingstatus) as Callsout, round(sum(round(durationsec))/60,6) as MinutesOut,	
    round(sum(SubscriberchargeXOut),6) as Xbdt,round(sum(CarrierCostYIgwOut),6) as Yusd,		
  sum(SubscriberchargeXOut)-(sum(CarrierCostYIgwOut*ifnull(u.rateamount,@p_UsdRateY))) as Zbdt		
	, Supplierid , ( sum(revenueigwout*SubscriberchargeXOut)-(sum(revenueigwout*CarrierCostYIgwOut*ifnull(u.rateamount,@p_UsdRateY)))  )/100 as revenueigwout,sum(suppliercost) as suppliercost,(( ( sum(revenueigwout*SubscriberchargeXOut)-(sum(revenueigwout*CarrierCostYIgwOut*ifnull(u.rateamount,@p_UsdRateY)))  )/100) *((100-51.75)/100) + sum(CarrierCostYIgwOut*ifnull(u.rateamount,@p_UsdRateY)) -sum(suppliercost*ifnull(u.rateamount,@p_UsdRateY))) as profitbdt,(( ( sum(revenueigwout*SubscriberchargeXOut)-(sum(revenueigwout*CarrierCostYIgwOut*ifnull(u.rateamount,@p_UsdRateY)))  )/100) *((100-51.75)/100) + sum(CarrierCostYIgwOut*ifnull(u.rateamount,@p_UsdRateY)) -sum(suppliercost*ifnull(u.rateamount,@p_UsdRateY)))/(sum(round(durationsec,0))/60) as profitminute	
, round(sum(roundedduration)/60,6) as roundedduration ,(sum(chargingstatus)/count(*))*100 as ASR, ((sum(round(durationsec,0))/60)/sum(chargingstatus)) as ACD,avg(pdd) as PDD , 100*count(connecttime)/count(*) as CCR,  count(*) as CallsCount,count(connecttime) as ConnectedCount 		
,sum(c.field5) as ConnectByCC,100*sum(c.field5)/count(*) as CCRByCC,customerid from cdrloaded		
 c left join usdexchangerateagainstbdt u on c.field1=u.field1 and c.field2=u.field2		
	where starttime>=@varStartDate	
	and starttime<=@varEndDate
	and calldirection=2	
	group by `Date`,CountryCode	,supplierid,customerid	

   ) x		
left join CountryCode cn		
on x.CountryCode=cn.Code		
left join carrier crintl		
on x.supplierid=crintl.idcarrier		
left join carrier cricx
on x.customerid=cricx.idcarrier		
order by `Duration (Minutes)` desc, `Country`, `International Carrier` asc;
