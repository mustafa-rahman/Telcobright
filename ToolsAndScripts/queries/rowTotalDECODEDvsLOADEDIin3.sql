(438625,438626,438627,438628,438629,438630,438631,438632,438633,438634,438635,438636,441595,441667)

select fileserialno,de.noofrecordssrv1 as DecodedTotal,cntloaded as LoadedTotal from
(
select fileserialno,sum(cntloaded) as cntloaded from
(
select fileserialno,count(*) as CntLoaded 
from cdrloaded
WHERE starttime > '2014-11-20'
and starttime < '2015-01-10'
and fileserialno in (438625,438626,438627,438628,438629,438630,438631,438632,438633,438634,438635,438636,441595,441667)
group by fileserialno
union all
select fileserialno,count(*) as CntLoaded 
from cdrtemploaded
WHERE starttime > '2014-11-20'
and starttime < '2015-01-10'
and fileserialno in (438625,438626,438627,438628,438629,438630,438631,438632,438633,438634,438635,438636,441595,441667)
group by fileserialno
union all
select fileserialno,count(*) as CntLoaded 
from cdrerror
WHERE starttime > '2014-11-20'
and starttime < '2015-01-10'
and fileserialno in (438625,438626,438627,438628,438629,438630,438631,438632,438633,438634,438635,438636,441595,441667)
group by fileserialno
) a
group by fileserialno
) x
left join telcobrightmediation.cdrdecoded as de
on x.fileserialno=de.fileserialnumber and de.idswitch=1