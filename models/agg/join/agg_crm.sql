SELECT 
cast(date(closedate) as date) closedate,
client,
channel,
platform,
leadsource,
name dealname,
revenue,
isclosed,
iswon,
stagename as dealstage
FROM 
{{ref('sf_client_esub')}}

UNION ALL

SELECT
cast(date(closedate) as date) closedate,
client,
channel,
platform,
leadsource,
name dealname,
revenue,
isclosed,
iswon, 
stagename as dealstage
FROM
{{ref('sf_client_directive')}}

UNION ALL

SELECT
cast(date(closedate) as date) closedate,
client,
channel,
platform,
leadsource,
name dealname,
revenue,
isclosed,
iswon, 
stagename as dealstage
FROM
{{ref('sf_client_clear')}}

UNION ALL

SELECT
cast(closedate as date) closedate,
client,
channel,
platform,
leadsource,
dealname,
revenue,
null as isclosed,
null as iswon,
dealstage
FROM
{{ref('hubspot_client_deals_greenlight')}}

