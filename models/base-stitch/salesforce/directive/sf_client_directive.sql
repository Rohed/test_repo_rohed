SELECT  
  a.client client,
  case when b.platform is null then 'All Other' else b.platform end platform,
  case when b.channel is null then 'All Other' else channel end channel,
  a.leadsource leadsource,
  a.id id,
  a.name,
  a.createddate createddate,  
  a.closedate closedate,
  a.stagename stagename,
  coalesce(a.revenue,0) revenue,
  a.isclosed isclosed,
  a.iswon iswon

FROM {{ref('sf_proc_directive')}} a
LEFT JOIN {{ref('mappings_crm_proc')}} b
ON (
  a.leadsource = b.salesforce_source and
  a.client = b.client
  )