SELECT 
account, 
channel, 
platform, 
date, 
SUM(domain_count) OVER(PARTITION BY account ORDER BY date asc) as ref_domains
FROM (

SELECT  
account,
channel,
platform,
date,
count(source_domain) as domain_count
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`majestic_domain_proc`
group by account, channel, platform, date

)
order by account asc, date asc