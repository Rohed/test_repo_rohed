SELECT 
client,
data_source,
date,
sum(leads) qc_value
FROM {{ref('agg_crm_daily_union')}}
WHERE data_source in ('Hubspot', 'Marketo')
GROUP BY client, data_source, date
  
UNION ALL

SELECT
client,
data_source,
date,
sum(deals) qc_value
FROM {{ref('agg_crm_daily_union')}}
WHERE data_source in ('Salesforce')
GROUP BY client, data_source, date

UNION ALL

SELECT
client,
data_source,
date,
sum(xero_revenue) qc_value
FROM {{ref('agg_crm_daily_union')}}
WHERE data_source in ('Xero')
GROUP BY client, data_source, date

UNION ALL

SELECT
client,
'Adroll' data_source,
date,
sum(cost) qc_value
FROM {{ref('adroll_ads_proc')}}
GROUP BY client, data_source, date
