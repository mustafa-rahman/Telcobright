#set @p_MatchedPrefixY='-5';
#set @p_MatchedPrefixY='919';
set @p_MatchedPrefixY=':1';
select prefix 
from 
(select 
concat(case when @p_MatchedPrefixY like '-%' then null when @p_MatchedPrefixY like ':%' then null else '' end,@p_MatchedPrefixY) as prefix 

union all 

select prefix from xyzselected where prefix like 
(case when @p_MatchedPrefixY  like '-%' then '%' 
else null end)
and prefixset=convert(@p_MatchedPrefixY,signed)*(-1)
#and prefix like (case when @p_MatchedPrefixY  like ':%' then '!' else '%' end)

union all
select prefix from xyzprefix 
where countrycode like (case when @p_MatchedPrefixY  like ':%' then substring(@p_MatchedPrefixY,instr(@p_MatchedPrefixY,':')+1,200) else '!' end)
) selpref
where prefix is not null
