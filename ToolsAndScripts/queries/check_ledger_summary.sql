select idAccount, sum(amount) Amount from acc_ledger_summary
where idaccount in
(
select id from account
#where instr(accountName,'sg4') or instr(accountName,'sg5') #igw
where instr(accountName,'sg3') or instr(accountName,'sg1') or instr(accountName,'sg4')#icx
and iscustomeraccount=1
) group by idaccount with rollup;


select sum(amount) from acc_transaction
where glAccountId in
(
select id from account
#where instr(accountName,'sg4') or instr(accountName,'sg5') #igw
where instr(accountName,'sg3') or instr(accountName,'sg1') or instr(accountName,'sg4') #icx
and iscustomeraccount=1
);