select 
client,
source_nickname,
max(platform_n) as platform,
max(channel_n) channel,
max(salesforce_source_n) as salesforce_source,
max(marketo_source_n) as marketo_source,
max(hubspot_source_n) as hubspot_source,
max(xero_source_n) as xero_source,
time_of_entry

from  ( 

SELECT  
client,
platform as platform_n,
source_nickname as source_nickname,
channel as channel_n,
salesforce_source as salesforce_source_n,
marketo_source as marketo_source_n,
hubspot_source as hubspot_source_n,
xero_source as xero_source_n,
time_of_entry,
first_value(time_of_entry) OVER (PARTITION BY client, platform, source_nickname ORDER BY time_of_entry DESC) lv
FROM `agency-data-pipeline-185318.agency_data_pipeline.mappings_crm` 

) 

WHERE lv = time_of_entry
and client in (select client from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` )
group by client, source_nickname, platform_n, salesforce_source_n, marketo_source_n, hubspot_source_n, xero_source_n, time_of_entry
order by client asc, platform asc