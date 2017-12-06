select *
from  ( 

SELECT  
'Directive Consulting' as client,
'None' as channel,
'None' as platform,
invoiceid,
cast(date as date) date,
amountpaid revenue,
_sdc_sequence _sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY invoiceid ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.xero_directive.invoices` 
WHERE status = 'PAID'
and invoicenumber like 'INV-%'

) 

WHERE lv = _sdc_sequence
order by _sdc_sequence desc