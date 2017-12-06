SELECT 
  a.date date,
  b.client client,  
  a.channel channel,
  'Organic' as platform,
  sum(a.ref_domains) ref_domains,
  sum(a.link_count) link_count,
  max(a.domain_authority) domain_authority,
  sum(a.organic_keywords) organic_keywords,
  sum(a.organic_traffic) organic_traffic,
  sum(a.organic_value) organic_value,  
  sum(a.top_5_keywords) top_5_keywords
FROM 
  {{ref('agg_seo')}} a 
LEFT JOIN {{ref('accounts_proc')}} b
ON ( 
  a.account = b.account and
  a.platform = b.platform )
group by date, channel, client, platform
order by client asc, date asc