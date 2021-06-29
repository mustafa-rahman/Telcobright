select c.name,case mg.locktype when 0 then 'Unlocked' else 'Locked' end as Status,rg.name as RatePlanName,r.Rate_Minute,c.money as Balance
from 
vos3000db.e_customer c
left join vos3000db.e_feerategroup rg
on c.feerategroup_id=rg.id
left join 
(
select r.feerategroup_id,avg(r.fee)*60 as Rate_Minute
from vos3000db.e_feerate r
group by r.feerategroup_id
) r
on r.feerategroup_id=rg.id
left join 
(
select customer_id,min(locktype) as LockType
from vos3000db.e_gatewaymapping mg
group by customer_id
) mg
on c.id=mg.customer_id
order by status desc,name