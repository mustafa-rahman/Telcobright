set @usdrate=78.3;
select originatingcallednumber,matchedprefixsupplier,durationsec,suppliercost,
sr.prefix as SuppPrefix,sr.rateamount,
subscriberchargexout as x,carriercostyigwout as y,(select @usdrate) as `USD Rate`,
round(subscriberchargexout,2) as 'X (BDT)', round(carriercostyigwout,6) as 'Y (USD)',(select @UsdRate) as 'USD Rate', round(carriercostyigwout*@UsdRate,2) as 'Y (BDT)', round(subscriberchargexout-@UsdRate*carriercostyigwout,2) as 'Z (BDT)',                          
round(.15*(subscriberchargexout-@UsdRate*carriercostyigwout),2) as 'IGW Revenue [15% of Z] (BDT)',                                                                                                             
(round(.15*(subscriberchargexout-@UsdRate*carriercostyigwout),2)*(100-51.75)+round(carriercostyigwout,6)-suppliercost)/@usdrate as profit,
c.* from cdrloaded c
left join supplierrate sr
on c.matchedprefixsupplier=sr.prefix
and sr.idsupplierrateplan=259
where c.starttime>'2014-06-01'
and c.starttime<'2014-06-30'
and supplierid=35
and originatingcallednumber like '0044%'
and chargingstatus=1