select incomingroute,min(originatingcic),avg(originatingcic),max(originatingcic) 
from cdrloaded
where starttime >'2014-08-06'
and starttime <'2014-08-07'
and customerid=26
and incomingroute in ('11','50','53','56')
group by incomingroute