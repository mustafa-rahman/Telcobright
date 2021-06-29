delete from platinum.cdrloaded
where starttime>'2014-07-09'
and fileserialno>393170;

delete from platinum.cdrtemploaded
where starttime>'2014-07-09'
and fileserialno>393170;

delete from platinum.cdrerror
where starttime>'2014-07-09'
and fileserialno>393170;