select * from cdrloaded
where starttime>='2014-04-20 17:30:00'
and endtime<'2014-04-20 22:59:59'
and outgoingroute ='21'
and calldirection=2