SELECT  
date as date,
account as account,
case when platform is null then "All Other" else platform end as platform,
case when channel is null then "All Other" else channel end as channel,
lower(regexp_replace(regexp_replace(replace(replace(replace(replace(CONCAT(hostname,path),'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),r'(`/`$)','')) as url,
max(users) as users,
max(sessions) as sessions,
max(case 
  when account = "Directive Consulting" then (goal_5_completions + goal_17_completions)
  when account = "Master - eSUB.com" then goal_4_completions
  else goal_1_completions end) warm_goal_completions,
max(case 
  when account = "Directive Consulting" then (goal_10_completions + goal_13_completions)
  when account = "Master - eSUB.com" then goal_6_completions
  else goal_1_completions end) hot_goal_completions,
FROM `agency-data-pipeline-185318.agency_data_pipeline.ga_lp_source_medium_accts` a
FULL OUTER JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`mappings_ga_proc` b
ON ( a.source = b.source
  AND a.medium = b.medium )
GROUP BY date, account, platform, channel, url
ORDER BY account asc, date asc