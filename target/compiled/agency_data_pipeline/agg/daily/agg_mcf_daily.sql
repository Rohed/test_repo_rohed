SELECT 
date,
client,
channel,
platform,
goal_number,
coalesce(sum(assisted_conversions),0) assisted_conversions
FROM   
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_mcf`
GROUP BY
date, client, channel, platform, goal_number
ORDER BY
client asc, date asc, channel asc, platform asc