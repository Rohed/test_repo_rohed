SELECT 
  a.date date,
  b.client client,  
  a.channel channel,
  a.platform platform,
  a.channel_group_path channel_group_path,
  a.goal_number goal_number,
  a.assisted_conversions assisted_conversions 
  
FROM (
  SELECT 
  date,
  account,
  channel,
  platform,
  'Google Analytics' as lookup_platform,
  channel_group_path,
  goal_number,
  assisted_conversions
  FROM   
  `agency-data-pipeline-185318`.`agency_data_pipeline`.`ga_mcf_proc`
) a 
  
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` b
ON ( 
  a.account = b.account and
  a.lookup_platform = b.platform )
order by client asc, date asc