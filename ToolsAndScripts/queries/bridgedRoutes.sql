SELECT r.id,r.tgname,p1.PartnerName as inpartner,p2.PartnerName as outpartner 
FROM icnl.bridgedroute r
left join partner p1
on r.inpartner=p1.idpartner
left join partner p2
on r.outpartner=p2.idpartner;
