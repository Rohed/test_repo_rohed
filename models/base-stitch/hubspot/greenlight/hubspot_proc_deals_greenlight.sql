SELECT
client,
dealname,
cast(coalesce(oreo_date, create_date) as date) createddate,
cast(close_date as date) closedate,
deal_stage dealstage,
case when deal_source_secondary is not null then deal_source_secondary
  when deal_source_primary = 'Inbound Paid' then 'Adwords' else deal_source_primary end
  as leadsource,
dealid id,
revenue
FROM
(
SELECT 
'Greenlight Guru' as client,
properties.dealname.value dealname,
DATE_FROM_UNIX_DATE(case when properties.hs_createdate.timestamp is null then null else cast(cast(properties.hs_createdate.timestamp as int64)/(1000*60*60*24) as int64) end) create_date, 
DATE_FROM_UNIX_DATE(case when properties.oreo_date.timestamp is null then null else cast(cast(properties.oreo_date.timestamp as int64)/(1000*60*60*24) as int64) end) oreo_date, 
DATE_FROM_UNIX_DATE(case when properties.closedate.timestamp is null then null else cast(cast(properties.closedate.timestamp as int64)/(1000*60*60*24) as int64) end) close_date, 
properties.dealstage.value deal_stage,
properties.deal_source_secondary.value deal_source_secondary,
properties.deal_source.value deal_source_primary,
properties.amount.value revenue,
dealid,
_sdc_sequence,
first_value(_sdc_sequence) OVER (PARTITION BY dealid ORDER BY _sdc_sequence DESC) lv
FROM `agency-data-pipeline-185318.hubspot_lead_greenlight.deals` 
)
where lv = _sdc_sequence