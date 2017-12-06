SELECT * 
FROM 
{{ref('sf_stats_directive')}}

UNION ALL

SELECT * 
FROM 
{{ref('sf_stats_esub')}}

UNION ALL

SELECT * 
FROM 
{{ref('sf_stats_clear')}}