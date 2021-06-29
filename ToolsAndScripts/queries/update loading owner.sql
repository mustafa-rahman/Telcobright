update telcobrightmediation.cdrloadingowner
set loadingtime=null,loadingserver=null
where idcdrdecoded in(
select idcdrdecoded from telcobrightmediation.cdrdecoded
where idswitch=1
and fileserialnumber>393170);