SELECT  
  a.client client,
  case when b.platform is null then 'All Other' else b.platform end platform,
  case when b.channel is null then 'All Other' else channel end channel,
  a.leadsource leadsource,
  a.date date,
  a.id id
FROM {{ref('hubspot_proc_leads_greenlight')}} a
LEFT JOIN {{ref('mappings_crm_proc')}} b
ON (
  a.leadsource = b.hubspot_source and
  a.client = b.client
  )