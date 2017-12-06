SELECT  
date, 
account,
'Organic' as channel,
'SEMrush' as platform,
lower(trim(regexp_replace(replace(replace(replace(replace(url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
keyword,
min(position) as position, 
max(search_volume) as search_volume,
max(cpc) as cpc
FROM `agency-data-pipeline-185318.agency_data_pipeline.semrush_keyword` 
where account in (select account from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` where platform = 'SEMrush')
group by date, account, channel, platform, url, keyword