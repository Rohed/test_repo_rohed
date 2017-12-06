SELECT  
  a.client client,
  case when b.platform is null then 'All Other' else b.platform end platform,
  case when b.channel is null then 'All Other' else channel end channel,
  a.leadsource leadsource,
  a.date date,
  a.leadperson leadperson
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`marketo_proc_esub` a
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`mappings_crm_proc` b
ON (
  a.leadsource = b.marketo_source and
  a.client = b.client
  )