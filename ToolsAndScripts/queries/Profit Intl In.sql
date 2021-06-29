select date(StartTime)as `Date`,(Select Null) ANS,(select Null) as IGW,sum(chargingstatus) as CallsIn, sum(round(durationsec))/60 as MinutesIn					
, sum(costansin) as costansin,sum(costicxin) as costicxin	, sum(costvatcommissionin) as costvatcomissionin,sum(igwrevenuein) as igwrevenuein
,sum(customercost) as customercost, sum(customercost-costansin-costicxin-costvatcommissionin) as profit,
(sum(chargingstatus)/count(*))*100 as ASR, ((sum(round(durationsec,0))/60)/sum(chargingstatus)) as ACD,avg(pdd) as PDD
  from CDRLoaded				
	where starttime>='2013-06-01'				
	and starttime<='2013-06-30'
  and calldirection=3				
	group by date(StartTime)				having sum(chargingstatus)>0
  
