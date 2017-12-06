SELECT  
account,
'Organic' as channel,
'Moz' as platform,
date,
max(domain_authority) as domain_authority
FROM `agency-data-pipeline-185318.agency_data_pipeline.moz`
where account in (select account from `agency-data-pipeline-185318`.`agency_data_pipeline`.`accounts_proc` where platform = 'Moz')
group by account, channel, platform, date
order by account asc, date asc