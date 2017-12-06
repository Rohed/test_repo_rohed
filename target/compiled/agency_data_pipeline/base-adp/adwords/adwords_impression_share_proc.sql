select
date,
account,
channel,
platform,
impressions,
cast((case when search_impression_share > 0 then (impressions/search_impression_share) else 0 end) as int64) as available_impressions
from
(
SELECT  
date, 
account,  
'Paid' as channel,
'Adwords' as platform,
max(impressions) as impressions,
max(search_impression_share) as search_impression_share
FROM `agency-data-pipeline-185318.agency_data_pipeline.adwords_impression_share`
where account in (select account from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` where platform = 'Adwords')
group by channel, platform, account, date
)
order by account asc, date asc