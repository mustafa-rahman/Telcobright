select cd.*,l.*
from telcobrightmediation.cdrloadingowner l
right join 
telcobrightmediation.cdrdecoded cd
on l.idcdrdecoded=cd.idcdrdecoded
where idswitch=2
and loadingserver is not null
order by cd.fileserialnumber desc
limit 0,1000;