select *
from  ( 

SELECT  
'Directive Consulting' as client,
id,
name,
createddate,
closedate,
stagename,
0.00 as revenue,
leadsource,
isclosed,
iswon,
_sdc_sequence _sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY id ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.salesforce_deal_directive.sf_Opportunity`
) 

WHERE lv = _sdc_sequence
order by _sdc_sequence desc