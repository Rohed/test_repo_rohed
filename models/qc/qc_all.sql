SELECT *
FROM
{{ref('qc_ga')}} 

UNION ALL

SELECT *
FROM
{{ref('qc_cost')}} 

UNION ALL

SELECT *
FROM
{{ref('qc_crm_after')}} 