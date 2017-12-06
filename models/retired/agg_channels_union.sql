SELECT *
FROM 
  {{ref('ga_adwords')}}
 UNION ALL

SELECT *
FROM 
  {{ref('ga_bing_ads')}}
UNION ALL  

SELECT *
FROM 
  {{ref('ga_capterra')}}
UNION ALL  

SELECT *
FROM  
  {{ref('ga_fb_ads')}}
UNION ALL  

SELECT *
FROM  
  {{ref('ga_linkedin_ads')}}

UNION ALL  

SELECT *
FROM  
  {{ref('ga_twitter_ads')}}

UNION ALL

SELECT *
FROM  
  {{ref('ga_search_console')}}

UNION ALL

SELECT *
FROM  

  {{ref('ga_direct')}}

UNION ALL

SELECT *
FROM  

  {{ref('ga_software_advice')}}  