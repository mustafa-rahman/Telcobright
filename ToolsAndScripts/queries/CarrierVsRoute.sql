select c.idpartner,c.partnername,c.partnertype,r.* 
from route r
left join partner c
on r.idpartner=c.idpartner;