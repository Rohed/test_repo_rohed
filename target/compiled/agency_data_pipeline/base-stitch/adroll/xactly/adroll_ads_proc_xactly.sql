select
eid, 
url
from 
  ( 
SELECT   
eid,
lower(trim(regexp_replace(replace(replace(replace(replace(destination_url,'www.',''),'http://',''),'https://',''),'.html',''),r'\?.*$',''),'/')) as url,
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY eid ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.adroll_xactly.adroll_ads` 
  )
where lv = _sdc_sequence