update cdrloaded
set costansin=roundedduration*.03*20/100/60,costicxin=roundedduration*.03*15/100/60,costvatcommissionin=roundedduration*.03*51.75/100/60,
igwrevenuein=(customercost-.03*20/100-.03*15/100-.03*51.75/100)*roundedduration/60
where calldirection=3
and chargingstatus=1;