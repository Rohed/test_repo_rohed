SELECT  
date as date,
account as account,
case when platform is null then "All Other" else platform end as platform,
case when channel is null then "All Other" else channel end as channel,
channel_group_path,
goal_number,
max(assisted_conversions) as assisted_conversions
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`ga_mcf_accts` a
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`mappings_ga_proc` b
ON ( a.source = b.source
  AND a.medium = b.medium )
GROUP BY date, account, platform, channel, channel_group_path, goal_number
ORDER BY account asc, date asc, assisted_conversions desc