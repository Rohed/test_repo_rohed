SELECT  
client,
channel,
platform,
date,
sum(revenue) xero_revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`xero_proc_directive`
group by client, channel, platform, date
order by client asc, date asc