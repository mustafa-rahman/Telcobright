set @supplierid=263;
set @starttime='2014-06-30 00:30:00';

select t.*,c.* from
cdrloaded c
join tempprefix2 t
on c.matchedprefixsupplier=t.prefix
and supplierid=@supplierid
and starttime>@starttime
and calldirection=2
and chargingstatus=1
and c.terminatingcallednumber like '96%'
