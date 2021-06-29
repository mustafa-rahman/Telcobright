select carriername,x.idrateplan,rp.rateplanname,r.prefix,r.rateamount
from carrier c
left join 
(select idcarrier,max(idcustomerrateplan) idrateplan
from customerratemapping
group by idcarrier) x
on c.idcarrier=x.idcarrier
left join customerrate r
on x.idrateplan=r.idcustomerrateplan
join customerrateplan rp
on x.idrateplan=rp.idcustomerrateplan
order by carriername