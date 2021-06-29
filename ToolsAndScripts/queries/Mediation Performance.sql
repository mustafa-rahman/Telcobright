select TotalHours, TotalCDRs,totalcdrs/totalhours as CDRsPerHour,24*totalcdrs/totalhours as CDRsPerDay
from
(
select time_to_sec(  timediff(max(CompletionTime),min(CompletionTime)))/3600 as TotalHours,
sum(noofsteps) as TotalCDRs
from job
where completiontime>='2018-09-17 00:00:00'
and completiontime<'2018-09-18 00:00:00'
) m