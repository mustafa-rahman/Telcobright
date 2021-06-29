
select sum(amount) from acc_transaction
where glAccountId in
(
select id from account
where instr(accountName,'sg4') or instr(accountName,'sg5') #igw
#where instr(accountName,'sg3') or instr(accountName,'sg1') #icx
and iscustomeraccount=1
);