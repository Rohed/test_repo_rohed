SELECT 
date,
account,
channel,
platform,
null as ref_domains,
null as link_count,
domain_authority,
null as organic_keywords,
null as organic_traffic,
null as organic_value,
null as top_5_keywords
FROM   
{{ref('moz_proc')}}

UNION ALL

SELECT 
date,
account,
channel,
platform,
null as ref_domains,
null as link_count,
null as domain_authority,
organic_keywords,
organic_traffic,
organic_value,
null as top_5_keywords
FROM
{{ref('semrush_domain_proc')}}

UNION ALL

SELECT 
date,
account,
channel,
platform,
null as ref_domains,
null as link_count,
null as domain_authority,
null as organic_keywords,
null as organic_traffic,
null as organic_value,
top_5_keywords
FROM 
{{ref('semrush_keyword_stats')}}


UNION ALL

SELECT 
date,
account,
channel,
platform,
ref_domains,
null as link_count,
null as domain_authority,
null as organic_keywords,
null as organic_traffic,
null as organic_value,
null as top_5_keywords
FROM 
{{ref('majestic_domain_stats')}}

UNION ALL

SELECT 
date,
account,
channel,
platform,
null as ref_domains,
link_count,
null as domain_authority,
null as organic_keywords,
null as organic_traffic,
null as organic_value,
null as top_5_keywords
FROM 
{{ref('majestic_link_stats')}}
