select sum(cnt) from
(
select count(*) cnt from purple.cdrloaded
where switchid=2
and fileserialno<=7289
union all
select count(*) cnt from purple.cdrerror
where switchid=2
and fileserialno<=7289
) x;




