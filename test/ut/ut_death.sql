-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Unit tests for cdm_death table
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- FK to daring-tracer-300615.mimic4_data.admissions.deathtime
-- -------------------------------------------------------------------

INSERT INTO daring-tracer-300615.mimiciv_full_metrics_april26.report_unit_test
SELECT
    CAST(NULL AS STRING)                AS report_id,
    FORMAT_DATETIME('%Y-%m-%d %X', CURRENT_DATETIME()) AS report_starttime, -- X = HH:MM:SS
    'cdm_death'          AS table_id,
    'foreign key'                       AS test_type, -- unique, not null, concept etc.
    'death_date'                         AS field_name,
    CAST(NULL AS STRING)                AS criteria_json,
    (COUNT(cdm.death_date) = 0)          AS test_passed -- FK source
FROM
    daring-tracer-300615.mimiciv_full_cdm_april26.cdm_death cdm
LEFT JOIN
(
    SELECT deathtime FROM daring-tracer-300615.mimic4_data.admissions
    UNION DISTINCT
    SELECT dischtime FROM daring-tracer-300615.mimic4_data.admissions
) fk
    ON cdm.death_date = fk.deathtime
WHERE
    fk.deathtime IS NULL -- FK target
;
