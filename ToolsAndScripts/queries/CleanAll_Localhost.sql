delete from acc_chargeable;
delete from acc_ledger_summary;
delete from acc_ledger_summary_billed;
delete from acc_temp_transaction;
delete from acc_transaction;

delete from job where idjobdefinition=12;
delete from invoice_item;
delete from invoice;
delete from acc_temp_transaction;
delete from acc_ledger_summary_billed;
delete from account;

delete from autoincrementcounter;
delete from Cdr;
delete from CdrError;
truncate table cdrdiscarded;
truncate table cdrinconsistent;
delete from cdrpartialrawinstance;
delete from cdrpartiallastaggregatedrawinstance;
delete from cdrpartialreference;
truncate table mockcdr;
#job Part
#jobs can be cleaned or set to not finished
SET FOREIGN_KEY_CHECKS = 0; 
#TRUNCATE table job; #job delete version
update job set status=7,completiontime=null;#status=received version
SET FOREIGN_KEY_CHECKS = 1;
# end job part
delete from jobcompletion;
delete from jobsegment;
delete from Allerror;
delete from lcr;
#delete from autoinc_manual_int;
#delete from autoinc_manual_long;

delete from sum_voice_day_01;
delete from sum_voice_day_02;
delete from sum_voice_day_03;
delete from sum_voice_day_04;
delete from sum_voice_day_05;
delete from sum_voice_day_06;

delete from sum_voice_hr_01;
delete from sum_voice_hr_02;
delete from sum_voice_hr_03;
delete from sum_voice_hr_04;
delete from sum_voice_hr_05;
delete from sum_voice_hr_06;



delete from cdrmeta;
INSERT INTO cdrmeta(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_day_01;
INSERT INTO cdrsummarymeta_day_01(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_day_02;
INSERT INTO cdrsummarymeta_day_02(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_day_03;
INSERT INTO cdrsummarymeta_day_03(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_day_04;
INSERT INTO cdrsummarymeta_day_04(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_day_05;
INSERT INTO cdrsummarymeta_day_05(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_day_06;
INSERT INTO cdrsummarymeta_day_06(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_hr_01;
INSERT INTO cdrsummarymeta_hr_01(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_hr_02;
INSERT INTO cdrsummarymeta_hr_02(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_hr_03;
INSERT INTO cdrsummarymeta_hr_03(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_hr_04;
INSERT INTO cdrsummarymeta_hr_04(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_hr_05;
INSERT INTO cdrsummarymeta_hr_05(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);
delete from cdrsummarymeta_hr_06;
INSERT INTO cdrsummarymeta_hr_06(id,totalInsertedDuration,totalDeletedDuration) VALUES (1,0,0);

delete from transactionmeta;
INSERT INTO transactionmeta(id,totalInsertedAmount,totalDeletedAmount) VALUES (1,0,0);
delete from ledger_summary_meta;
INSERT INTO ledger_summary_meta(id,totalInsertedAmount,totalDeletedAmount) VALUES (1,0,0);
