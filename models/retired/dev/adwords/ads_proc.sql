select
date,
campaignid, 
sum(warm_conversions) as warm_conversions,
sum(hot_conversions) as hot_conversions
from 
  ( 
SELECT  
cast(day as date) date,
adid,
campaignid,
case when lower(conversionname) in ('adwords form submit', 'ebook download') then conversions else 0 end as warm_conversions, 
case when ( lower(conversionname) like '%get in touch%' or lower(conversionname) like '%white paper%') then conversions else 0 end as hot_conversions,
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY adid, day ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.adwords_directive.AD_PERFORMANCE_REPORT` 
  )
where lv = _sdc_sequence
group by date, campaignid
order by campaignid asc, date asc



