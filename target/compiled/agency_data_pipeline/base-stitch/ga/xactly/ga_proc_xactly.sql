select *
from  ( 

SELECT  
'xactlycorp.com - master view' as account,
'XactlyCorp' as client,
lower(trim(regexp_replace(replace(replace(replace(replace(CONCAT(hostname,landingpagepath),'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
cast(date as date) date,
lower(source) source,
lower(medium) medium,
(cast(goal1completions as INT64) + cast(goal6completions as INT64)) warm_goal_completions,
null as hot_goal_completions,
users,
sessions,
_sdc_sequence _sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY landingpagepath, source, medium, date ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.ga_xactly.report` 
) 

WHERE lv = _sdc_sequence
order by _sdc_sequence desc