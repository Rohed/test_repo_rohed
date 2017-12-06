SELECT  
  a.client client,
  a.dealname dealname,
  case when b.platform is null then 'All Other' else b.platform end platform,
  case when b.channel is null then 'All Other' else channel end channel,
  a.dealsource dealsource,
  a.createddate createddate,
  a.closedate closedate,
  a.dealstage dealstage,
  a.id id,
  a.revenue revenue
FROM `agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_proc_deals_greenlight` a
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`mappings_crm_proc` b
ON (
  a.dealsource = b.hubspot_source and
  a.client = b.client
  )