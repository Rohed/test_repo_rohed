SELECT
campaignid,
lower(trim(regexp_replace(replace(replace(replace(replace(finalurl,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url

FROM (

SELECT  
campaignid,
finalurl,
first_value(finalurl) OVER (PARTITION BY campaignid ORDER BY day DESC) lv
FROM `agency-data-pipeline-185318.adwords_directive.FINAL_URL_REPORT`
)

WHERE lv = finalurl
group by campaignid, url
order by campaignid asc