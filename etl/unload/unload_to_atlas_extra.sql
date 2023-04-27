-- Unload to ATLAS
-- extra tables (d_items to concept)

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_current_cdm_april26.d_items_to_concept AS 
SELECT
    *
FROM daring-tracer-300615.mimiciv_full_cdm_april26.d_items_to_concept
;

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_current_cdm_april26.d_labitems_to_concept AS 
SELECT
    *
FROM daring-tracer-300615.mimiciv_full_cdm_april26.d_labitems_to_concept
;

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_current_cdm_april26.d_micro_to_concept AS 
SELECT
    *
FROM daring-tracer-300615.mimiciv_full_cdm_april26.d_micro_to_concept
;

