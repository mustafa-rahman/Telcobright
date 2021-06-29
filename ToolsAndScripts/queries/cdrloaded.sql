select * from telcobrightmediation.allcdr
where idswitch=3
and loadingtime is not null
order by fileserialnumber desc
limit 0,100;