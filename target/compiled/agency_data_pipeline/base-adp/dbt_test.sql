-- Welcome to your first dbt model!
-- Did you know that you can also configure models directly within
-- the SQL file? This will override configurations stated in dbt_project.yml

-- Try changing 'view' to 'table', then re-running dbt
-- 


SELECT account, count(date) FROM `agency-data-pipeline-185318:agency_data_pipeline.ga_mcf` group by account