SELECT 
date,
client,  
channel,
platform,
source_domain,
source_url,
url,
citation_flow,
trust_flow,
null as channel_group_path,
null as goal_number,
null as assisted_conversions,   
null as users,
null as sessions,
null as warm_goal_completions,
null as hot_goal_completions,  
null as cost,
null as impressions,
null as clicks,
null as conversions,
null as first_seen,
null as last_seen  

FROM   
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_links` 

UNION ALL

SELECT 
date,
client,  
channel,
platform,
null as source_domain,
null as source_url,
url,
null as citation_flow,
null as trust_flow,
null as channel_group_path,
null as goal_number,
null as assisted_conversions,   
users,
sessions,
warm_goal_completions,
hot_goal_completions,  
cost,
impressions,
clicks,
conversions,
first_seen,
last_seen
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_channels`

UNION ALL

SELECT
date,
client,  
channel,
platform,
null as source_domain,
null as source_url,
null as url,
null as citation_flow,
null as trust_flow,
channel_group_path,
goal_number,
assisted_conversions, 
null as users,
null as sessions,
null as warm_goal_completions,
null as hot_goal_completions,  
null as cost,
null as impressions,
null as clicks,
null as conversions,
null as first_seen,
null as last_seen  
FROM 
`agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_mcf`