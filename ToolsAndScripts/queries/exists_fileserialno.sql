select exists
(select * from cdrloaded where starttime>'2014-07-15' and switchid=2 and fileserialno=1148307)