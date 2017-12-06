SELECT 
date,
client,
channel,
platform,
goal_number,
coalesce(sum(assisted_conversions),0) assisted_conversions
FROM   
{{ref('agg_mcf')}}
GROUP BY
date, client, channel, platform, goal_number
ORDER BY
client asc, date asc, channel asc, platform asc