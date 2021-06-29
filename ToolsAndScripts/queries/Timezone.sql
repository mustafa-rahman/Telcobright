select t.id,concat(c.country_name,' ',t.offsetdesc,' [',z.zone_name,']') as Name
from timezone t
join zone z
using(zone_id)
join country c
using(country_code)
order by c.country_name