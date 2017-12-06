SELECT * FROM `agency-data-pipeline-185318.agency_data_pipeline.ga_mcf`
where account in (select account from {{ref('accounts_proc')}} where platform = 'Google Analytics')