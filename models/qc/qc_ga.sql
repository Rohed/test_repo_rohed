SELECT
client,
'Google Analytics' platform,
date,
sum(sessions) qc_value
FROM
{{ref('agg_all_daily')}} 
GROUP BY
client, platform, date

UNION ALL

SELECT
client,
'GA MCF',
date,
sum(assisted_conversions) qc_value
FROM
{{ref('agg_all_daily')}} 
GROUP BY
client, platform, date

