SELECT
client,
'Google Analytics' platform,
date,
sum(sessions) qc_value
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily` 
GROUP BY
client, platform, date

UNION ALL

SELECT
client,
'GA MCF',
date,
sum(assisted_conversions) qc_value
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_all_daily` 
GROUP BY
client, platform, date