select sum(BalanceAfter) from account
where id in
(
SELECT id FROM account
where idpartner in
(
select idpartner from partner
where partnertype=3
)
and iscustomeraccount=1
);