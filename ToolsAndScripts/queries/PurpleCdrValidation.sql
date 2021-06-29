select * from purple.cdrloaded
where starttime >='2018-07-25' and starttime <'2018-07-26'
limit 0,1;

select * from purple.cdrloaded
where starttime >='2018-09-03' and starttime <'2018-09-04'
limit 0,1;

#select jobname, serialnumber from
select count(*) from
(select jobname, cast(replace(replace(jobname,'p',''),'.dat','') as signed) as serialNumber
from telcobrightmediation.job
where idjobdefinition=1
) x
where serialnumber between 7514536 and 7701433;
