
select distinct calltime from
(SELECT date(max(starttime)) callTime FROM mockcdr  
group by UniqueBillId having count(UniqueBillId)>1) X;

select m.UniqueBillId,m.PartialFlag,m.starttime,m.PartialAnswerTime,m.AnswerTime,
m.PartialDuration,m.endtime,m.DurationSec, m.* 
from mockcdr m
where UniqueBillId='591911085';


select sum(durationsec)
from mockcdr m
where UniqueBillId='591911085';
