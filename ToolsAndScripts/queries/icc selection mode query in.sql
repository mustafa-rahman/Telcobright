select incomingroute,min(originatingcic),avg(originatingcic),max(originatingcic) 
from cdrloaded
where starttime >'2014-07-03'
and starttime <'2014-07-04'
and customerid=26
and incomingroute in ('11','50','53','56')
group by incomingroute