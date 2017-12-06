SELECT  
account,
'Organic' as channel,
'SEMrush' as platform,
date,
max(organic_keywords) as organic_keywords,
max(organic_traffic) as organic_traffic,
max(organic_value) as organic_value
FROM `agency-data-pipeline-185318.agency_data_pipeline.semrush_domain` 
where account in (select account from {{ref('accounts_proc')}} where platform = 'SEMrush')
group by account, channel, platform, date
order by account asc, date asc