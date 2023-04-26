-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Copy vocabulary tables from the master vocab dataset
-- (to apply custom mapping here?)
-- -------------------------------------------------------------------

-- check
-- SELECT 'VOC', COUNT(*) FROM daring-tracer-300615.target_mimiciii_demo.concept
-- UNION ALL
-- SELECT 'TARGET', COUNT(*) FROM daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept
-- ;

-- affected by custom mapping

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.concept
;

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept_relationship AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.concept_relationship
;

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_vocabulary AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.vocabulary
;

-- not affected by custom mapping

CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_domain AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.domain
;
CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept_class AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.concept_class
;
CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_relationship AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.relationship
;
CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept_synonym AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.concept_synonym
;
CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept_ancestor AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.concept_ancestor
;
CREATE OR REPLACE TABLE daring-tracer-300615.mimiciv_full_cdm_april26.voc_drug_strength AS
SELECT * FROM daring-tracer-300615.target_mimiciii_demo.drug_strength
;

