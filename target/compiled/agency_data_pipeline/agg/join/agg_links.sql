SELECT 
  a.date date,
  b.client client,  
  a.channel channel,
  a.platform platform,
  a.source_domain source_domain,
  a.source_url source_url,
  a.target_url url,
  a.citation_flow citation_flow,
  a.trust_flow trust_flow
FROM   
`agency-data-pipeline-185318`.`agency_data_pipeline`.`majestic_link_proc` a
LEFT JOIN `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` b
ON ( 
  a.account = b.account and
  a.platform = b.platform )
order by client asc, date asc