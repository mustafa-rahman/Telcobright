select partialflag,idcall,sequencenumber,partialnextidcall,partialduration,durationsec,roundedduration,starttime,answertime,partialanswertime,endtime,partialendtime,partialnextidcall,
c.* from cdrloaded c
where 
sequencenumber in 
(select sequencenumber from cdrloaded where partialflag>0 
group by sequencenumber having count(*)>2)
order by sequencenumber;