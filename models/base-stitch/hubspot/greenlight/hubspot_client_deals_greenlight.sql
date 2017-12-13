SELECT  
  a.client client,
  a.dealname dealname,
  case when b.platform is null then 'All Other' else b.platform end platform,
  case when b.channel is null then 'All Other' else channel end channel,
  a.leadsource leadsource,
  a.createddate createddate,
  a.closedate closedate,
  a.dealstage dealstage,
  a.id id,
  a.revenue revenue
FROM {{ref('hubspot_proc_deals_greenlight')}} a
LEFT JOIN {{ref('mappings_crm_proc')}} b
ON (
  a.leadsource = b.hubspot_source and
  a.client = b.client
  )