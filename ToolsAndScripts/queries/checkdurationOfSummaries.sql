select sum(durationsec) actualduration, sum(roundedduration) roundedduration,sum(duration1) duration1,sum(duration2) duration2,sum(duration3) duration3
from cdr;


select sum(actualduration) actualduration, sum(roundedduration) roundedduration,sum(duration1) duration1,sum(duration2) duration2,sum(duration3) duration3 from
(
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_day_01 union all
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_day_02 union all
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_day_03 union all
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_day_04
) dayWiseSummaries;

select sum(actualduration) actualduration, sum(roundedduration) roundedduration,sum(duration1) duration1,sum(duration2) duration2,sum(duration3) duration3 from
(
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_hr_01 union all
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_hr_02 union all
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_hr_03 union all
select sum(actualduration) actualduration, sum(roundedduration) roundedduration, sum(duration1) duration1, sum(duration2) duration2, sum(duration3) duration3 from sum_voice_hr_04 
) hourWiseSummaries;

