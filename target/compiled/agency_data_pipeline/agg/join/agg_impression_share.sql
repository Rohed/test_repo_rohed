SELECT 
  a.date date,
  b.client client,  
  a.account account,
  a.channel channel,
  a.platform platform,
  coalesce(a.impressions,0) realized_impressions,
  coalesce(a.available_impressions,0) available_impressions,
  coalesce(a.impression_share,0) impression_share 
  
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`agg_impression_share_union` a 
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` b
ON ( 
  a.account = b.account and
  a.platform = b.platform )
order by client asc, date asc