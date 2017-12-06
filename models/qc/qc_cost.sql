SELECT
client,
platform,
date,
sum(cost) qc_value
FROM
{{ref('agg_all_daily')}} 
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
{{ref('agg_all_daily')}} 
WHERE 
platform in ('Organic')
GROUP BY
client, platform, date
