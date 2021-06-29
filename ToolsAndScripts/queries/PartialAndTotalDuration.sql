SELECT totalduration as SingleCallDuration,partialduration,(totalduration+partialduration) As TotalDuration, c.* FROM telcobrightmediation.allcdr c
