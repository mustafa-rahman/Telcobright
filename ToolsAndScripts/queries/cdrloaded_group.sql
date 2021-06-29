select idswitch,count(*) as NoofFiles from telcobrightmediation.cdrdecoded
where loadingserver is not null
group by idswitch
