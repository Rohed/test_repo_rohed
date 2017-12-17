select *
from  ( 

SELECT  
'All Web Site Data' as account,
'Hytrust' as client,
lower(trim(regexp_replace(replace(replace(replace(replace(landingpagepath,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
cast(date as date) date,
lower(source) source,
lower(medium) medium,
null as warm_goal_completions,
null as hot_goal_completions,
users,
sessions,
_sdc_sequence _sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY landingpagepath, source, medium, date ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.ga_hytrust.report` 
) 

WHERE lv = _sdc_sequence
order by _sdc_sequence desc