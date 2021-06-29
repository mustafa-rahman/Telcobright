select partnername,prefix
from partnerprefix pr
left join partner p
on pr.idpartner=p.idpartner
where partnername !='BTCL';