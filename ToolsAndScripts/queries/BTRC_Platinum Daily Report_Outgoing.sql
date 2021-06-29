select cr.carriername as `ANS`,cricx.Carriername as `ICX`,x.callcount as `No of Calls`,x.ActualDuration from
(
select ansidterm,Count(*) as CallCount,sum(durationsec)/60 ActualDuration,supplierid
from
(
select *
from platinum.cdrloaded
where calldirection=3
and chargingstatus=1
and starttime>='2013-02-20'
and starttime<'2013-02-21'
union all
select *
from platinum.cdrerror
where calldirection=3
and chargingstatus=1
and starttime>='2013-02-20'
and starttime<'2013-02-21'
union all
select *
from platinum.cdrtemploaded
where calldirection=3
and chargingstatus=1
and starttime>='2013-02-20'
and starttime<'2013-02-21'
) x0
group by ansidterm,supplierid
) x
left join carrier cr
on x.ansidterm=cr.idcarrier
left join carrier cricx
on x.supplierid=cricx.idcarrier
