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
{{ref('majestic_link_proc')}} a
LEFT JOIN {{ref('accounts_proc')}} b
ON ( 
  a.account = b.account and
  a.platform = b.platform )
order by client asc, date asc