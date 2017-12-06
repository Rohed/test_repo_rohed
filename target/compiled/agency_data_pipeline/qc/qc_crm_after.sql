SELECT 
client,
'Hubspot' data_source,
date,
sum(leads) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily`
WHERE client in ('Greenlight Guru', 'Clear Company')
GROUP BY client, data_source, date
  
UNION ALL

SELECT
client,
'Salesforce' data_source,
date,
sum(deals) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily`
WHERE client in ('Directive Consulting', 'Clear Company', 'eSub')
GROUP BY client, data_source, date

UNION ALL

SELECT
client,
'Marketo' data_source,
date,
sum(leads) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily`
WHERE client in ('eSub')
GROUP BY client, data_source, date

UNION ALL

SELECT
client,
'Xero' data_source,
date,
sum(xero_revenue) qc_value
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily`
WHERE client in ('Directive Consulting')
GROUP BY client, data_source, date