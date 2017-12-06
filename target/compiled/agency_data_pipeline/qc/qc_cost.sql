SELECT
client,
platform,
date,
sum(cost) qc_value
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily` 
WHERE 
platform in ('Adwords', 'Bing Ads', 'FB Ads', 'LinkedIn Ads', 'Twitter Ads', 'Capterra', 'Software Advice', 'Adroll')
GROUP BY
client, platform, date

UNION ALL

SELECT
client,
platform,
date,
sum(clicks) qc_value
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily` 
WHERE 
platform in ('Organic')
GROUP BY
client, platform, date