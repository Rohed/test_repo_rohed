select *
from  ( 

SELECT  
'Clear Company' as client,
id,
name,
createddate,
closedate,
stagename,
amount revenue,
leadsource,
isclosed,
iswon,
_sdc_sequence _sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY id ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.salesforce_deal_clear.Opportunity`
) 

WHERE lv = _sdc_sequence
order by _sdc_sequence desc