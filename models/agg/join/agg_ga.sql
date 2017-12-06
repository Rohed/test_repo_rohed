SELECT *
FROM 
{{ref('ga_platform_directive')}}

UNION ALL

SELECT *
FROM
{{ref('ga_platform_esub')}}

UNION ALL

SELECT *
FROM
{{ref('ga_platform_greenlight')}}

UNION ALL

SELECT *
FROM
{{ref('ga_platform_timetrade')}}

UNION ALL

SELECT *
FROM
{{ref('ga_platform_freedom')}}

UNION ALL

SELECT *
FROM
{{ref('ga_platform_xactly')}}

UNION ALL

SELECT *
FROM
{{ref('ga_platform_clear')}}