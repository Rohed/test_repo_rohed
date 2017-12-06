SELECT  
date, 
account,  
'Paid' as channel,
'Bing Ads' as platform,
max(impressions) as impressions,
max(available_impressions) as available_impressions
FROM `agency-data-pipeline-185318.agency_data_pipeline.bing_ads_impression_share` 
where account in (select account from {{ref('accounts_proc')}} where platform = 'Bing Ads')
group by channel, platform, account, date
order by account asc, date asc