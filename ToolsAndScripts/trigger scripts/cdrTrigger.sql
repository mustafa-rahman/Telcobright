CREATE TABLE `cdrmeta` (
  `id` int(11) NOT NULL,
  `totalInsertedDuration` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  `totalDeletedDuration` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



delimiter //
CREATE TRIGGER cdr_after_insert
AFTER INSERT
   ON cdr FOR EACH ROW

BEGIN

   update cdrmeta
   set totalInsertedDuration=totalInsertedDuration+NEW.durationsec;
END//


CREATE TRIGGER cdr_delete
before DELETE
   ON cdr FOR EACH ROW

BEGIN
	update cdrmeta
	set totalInsertedDuration=totalInsertedDuration-old.durationsec
    where id=1;
END//
delimiter ;
