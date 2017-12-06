SELECT 
client,
data_source,
date,
sum(leads) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm_daily_union`
WHERE data_source in ('Hubspot', 'Marketo')
GROUP BY client, data_source, date
  
UNION ALL

SELECT
client,
data_source,
date,
sum(deals) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm_daily_union`
WHERE data_source in ('Salesforce')
GROUP BY client, data_source, date

UNION ALL

SELECT
client,
data_source,
date,
sum(xero_revenue) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_crm_daily_union`
WHERE data_source in ('Xero')
GROUP BY client, data_source, date

UNION ALL

SELECT
client,
'Adroll' data_source,
date,
sum(cost) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`adroll_ads_proc`
GROUP BY client, data_source, date