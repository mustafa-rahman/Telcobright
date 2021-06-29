select c.fileserialno,c.sequencenumber,starttime,answertime,endtime,durationsec,c.* from cdrloaded c
join
(select fileserialno,sequencenumber from cdrloaded
#where starttime >'2013-09-17'
#and starttime <'2013-10-30'
where fileserialno=9582
group by fileserialno,sequencenumber
having count(*)>1
) x
on c.fileserialno=x.fileserialno
and c.sequencenumber=x.sequencenumber
order by sequencenumber,endtime