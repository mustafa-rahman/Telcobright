select c.name,rg.name as RatePlanName,r.prefix,r.fee*60 as Rate_Minute,c.money as Balance
from 
vos3000db.e_customer c
left join vos3000db.e_feerategroup rg
on c.feerategroup_id=rg.id
left join vos3000db.e_feerate r
on r.feerategroup_id=rg.id
