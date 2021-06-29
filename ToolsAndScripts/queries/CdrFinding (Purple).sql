SELECT inPartner.PartnerName as 'Source Network',
outPartner.PartnerName as 'Dest Network',
StartTime, AnswerTime, EndTime,
OriginatingCalledNumber as CalledNumber,OriginatingCallingNumber as CallingNumber,
durationsec as DurationSeconds,
case when (truncate(durationsec-truncate(durationsec,0),1))>0
then ceiling(durationsec)
else floor(durationsec) end as actualDuration,roundedDuration as BilledDuration

FROM purple.cdrloaded cd
left join purple.route inroute
on cd.incomingroute=inroute.routename
left join partner inPartner
on inroute.idPartner=inPartner.idPartner

left join purple.route outroute
on cd.outgoingroute=outroute.routename
left join purple.partner outPartner
on outroute.idPartner=outPartner.idPartner

where calldirection=2
and (cd.incomingroute in ('12')
and cd.outgoingroute in ('9','63','72'))

and starttime>='2018-02-01'
and starttime<'2018-03-01'
#limit 0,100;