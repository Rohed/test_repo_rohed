SELECT 
  a.date date,
  b.client client,  
  a.account account,
  a.channel channel,
  a.platform platform,
  coalesce(a.impressions,0) realized_impressions,
  coalesce(a.available_impressions,0) available_impressions,
  coalesce(a.impression_share,0) impression_share 
  
FROM {{ref('agg_impression_share_union')}} a 
LEFT JOIN {{ref('accounts_proc')}} b
ON ( 
  a.account = b.account and
  a.platform = b.platform )
order by client asc, date asc