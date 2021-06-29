select outgoingroute,min(terminatingcic),avg(terminatingcic),max(terminatingcic) 
from cdrloaded
where starttime >'2014-08-04'
and starttime <'2014-08-05'
and supplierid=26
and outgoingroute in ('11','50','53','56')
group by outgoingroute