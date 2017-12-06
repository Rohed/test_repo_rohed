SELECT 
account, 
channel, 
platform, 
date, 
SUM(link_count) OVER(PARTITION BY account ORDER BY date asc) as link_count
FROM (

SELECT  
account,
channel,
platform,
date,
count(source_url) as link_count
FROM {{ref('majestic_link_proc')}}
group by account, channel, platform, date

)
order by account asc, date asc