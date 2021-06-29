delete from telcobrightmediation.cdrloadingowner
where idcdrdecoded in
(select idcdrdecoded from telcobrightmediation.cdrdecoded
where fileserialnumber>=475149
and idswitch=2);

delete from telcobrightmediation.cdrdecoded
where fileserialnumber>=475149
and idswitch=2;

delete from telcobrightmediation.cdrreceived
where fileserialnumber>=475149
and idswitch=2;

delete from telcobrightmediation.cdrlisted
where fileserialnumber>=475149
and switchid=2;



delete from cdrerror where starttime>='2013-09-20' and fileserialno>=475149;
delete from cdrtemploaded where starttime>='2013-09-20' and fileserialno>=475149;


delete from cdrloaded where starttime>='2013-09-20' and fileserialno>=475149;

