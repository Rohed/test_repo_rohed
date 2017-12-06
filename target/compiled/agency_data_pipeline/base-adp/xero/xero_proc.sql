SELECT  
account as client,
'None' as channel,
'None' as platform,
date,
sum(gross_revenue) as xero_revenue
FROM `agency-data-pipeline-185318.agency_data_pipeline.xero_deal`
where account in (select account from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` where platform = 'Xero')
group by client, channel, platform, date
order by client asc, date asc