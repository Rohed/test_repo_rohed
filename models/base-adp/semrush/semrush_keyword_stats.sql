SELECT  
date, 
account,
channel,
platform,
count(keyword) as top_5_keywords
FROM {{ref('semrush_keyword_proc')}} 
group by date, account, channel, platform
order by account asc, date asc