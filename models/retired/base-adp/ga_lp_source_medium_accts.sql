SELECT * FROM `agency-data-pipeline-185318.agency_data_pipeline.ga_lp_source_medium`
where account in (select account from {{ref('accounts_proc')}} where platform = 'Google Analytics')