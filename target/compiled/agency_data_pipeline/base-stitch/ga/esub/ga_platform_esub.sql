SELECT  
date as date,
account,
a.client,
case when platform is null then "All Other" else platform end as platform,
case when channel is null then "All Other" else channel end as channel,
url,
users,
sessions,
warm_goal_completions,
hot_goal_completions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`ga_proc_esub` a
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`mappings_ga_proc` b
ON ( a.source = b.source
  AND a.medium = b.medium 
  and a.client = b.client )