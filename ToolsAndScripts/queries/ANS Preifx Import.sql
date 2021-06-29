select prefix,partnername 
from partnerprefix pr
left join partner pt	
on pr.idpartner=pt.idPartner
where pr.prefixtype=3;