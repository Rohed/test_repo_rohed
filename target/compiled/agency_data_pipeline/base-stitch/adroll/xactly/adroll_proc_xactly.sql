select
date, 
client,
account, 
channel,
platform,
url,
cost,
impressions,
clicks,
conversions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`adroll_ads_report_proc_xactly` a
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`adroll_ads_proc_xactly` b
ON a.eid = b.eid