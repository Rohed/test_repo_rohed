select *
from  ( 

SELECT  
'www.phishlabs.com (goals set on 10/14)' as account,
'PhishLabs' as client,
lower(trim(regexp_replace(replace(replace(replace(replace(CONCAT(hostname,landingpagepath),'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
cast(date as date) date,
lower(source) source,
lower(medium) medium,
(cast(goalcompletionsall as INT64) - cast(goal1completions as INT64) - cast(goal2completions as INT64)) warm_goal_completions,
(cast(goal1completions as INT64) + cast(goal2completions as INT64)) hot_goal_completions,
users,
sessions,
_sdc_sequence _sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY landingpagepath, source, medium, date ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.ga_phishlabs.report` 
) 

WHERE lv = _sdc_sequence
order by _sdc_sequence desc