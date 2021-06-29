CREATE TABLE `transactionmeta` (
  `id` int(11) NOT NULL,
  `totalInsertedAmount` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  `totalDeletedAmount` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


delimiter //
CREATE TRIGGER transaction_after_insert
AFTER INSERT
   ON acc_transaction FOR EACH ROW

BEGIN

   update transactionmeta
   set totalInsertedAmount=totalInsertedAmount+NEW.amount;
END//


CREATE TRIGGER transaction_delete
before DELETE
   ON acc_transaction FOR EACH ROW

BEGIN
	update transactionmeta
	set totalInsertedAmount=totalInsertedAmount-old.amount
    where id=1;
END//
delimiter ;

CREATE TABLE `ledger_summary_meta` (
  `id` int(11) NOT NULL,
  `totalInsertedAmount` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  `totalDeletedAmount` decimal(24,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


delimiter //
CREATE TRIGGER acc_ledger_summary_after_insert
AFTER INSERT
   ON acc_ledger_summary FOR EACH ROW

BEGIN

   update ledger_summary_meta
   set totalInsertedAmount=totalInsertedAmount+NEW.amount;

END//

CREATE TRIGGER acc_ledger_summary_after_update
AFTER update
   ON acc_ledger_summary FOR EACH ROW

BEGIN

   update ledger_summary_meta
   set totalInsertedAmount=totalInsertedAmount+NEW.amount-OLD.amount;

END//



delimiter ;