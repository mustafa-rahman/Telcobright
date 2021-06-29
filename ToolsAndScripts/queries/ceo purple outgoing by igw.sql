set @varStartDate='2014-07-01';
set @varEndDate='2014-07-07';
set @p_UsdRateY=78.3;
select `Date`,concat(cn.name,' (',x.CountryCode,')') as Country,crintl.CarrierName as 'IGW',		
Callsout as 'No of Calls',MinutesOut as 'Duration (Minutes)'
from		
	(select date(StartTime)as `Date`,CountryCode,sum(chargingstatus) as Callsout, round(sum(round(durationsec))/60,6) as MinutesOut,supplierid	
     from cdrloaded		
 c left join usdexchangerateagainstbdt u on c.field1=u.field1 and c.field2=u.field2		
	where starttime>=@varStartDate	
	and starttime<=@varEndDate
	and calldirection=2	
	group by `Date`,CountryCode	,supplierid
   ) x		
left join CountryCode cn		
on x.CountryCode=cn.Code		
left join carrier crintl		
on x.supplierid=crintl.idcarrier		
order by `Duration (Minutes)` desc, `Country`, `IGW` asc;
