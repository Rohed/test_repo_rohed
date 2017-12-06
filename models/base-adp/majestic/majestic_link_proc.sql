SELECT  
account,
'Organic' as channel,
'Majestic' as platform,
source_domain,
lower(trim(regexp_replace(replace(replace(replace(replace(source_url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as source_url,
lower(trim(regexp_replace(replace(replace(replace(replace(target_url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as target_url,
min(date) as date, 
max(citation_flow) as citation_flow,
max(trust_flow) as trust_flow
FROM `agency-data-pipeline-185318.agency_data_pipeline.majestic_link` 
where account in (select account from {{ref('accounts_proc')}} where platform = 'Majestic')
and citation_flow > 20
group by account, channel, platform, source_domain, source_url, target_url