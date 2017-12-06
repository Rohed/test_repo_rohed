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
null as dealstage
FROM 
`agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_client_esub`

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
null as dealstage
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_client_directive`

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
null as dealstage
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`sf_client_clear`

UNION ALL

SELECT
cast(closedate as date) closedate,
client,
channel,
platform,
dealsource leadsource,
dealname,
revenue,
null as isclosed,
null as iswon,
dealstage
FROM
`agency-data-pipeline-185318`.`agency_data_pipeline`.`hubspot_client_deals_greenlight`