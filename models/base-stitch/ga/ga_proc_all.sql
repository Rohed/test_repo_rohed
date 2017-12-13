SELECT *
FROM 
{{ref('ga_proc_directive')}}

UNION ALL

SELECT *
FROM
{{ref('ga_proc_esub')}}

UNION ALL

SELECT *
FROM
{{ref('ga_proc_greenlight')}}

UNION ALL

SELECT *
FROM
{{ref('ga_proc_timetrade')}}

UNION ALL

SELECT *
FROM
{{ref('ga_proc_freedom')}}

UNION ALL

SELECT *
FROM
{{ref('ga_proc_xactly')}}

UNION ALL

SELECT *
FROM
{{ref('ga_proc_clear')}}