


INSERT INTO daring-tracer-300615.mimiciv_full_metrics_april26.me_top_cdm_measurement
SELECT
    'unit_concept_id'     AS concept_field,
    IF(vc.concept_id IS NOT NULL, 'Mapped', 'Unmapped') AS category,
    CAST(ev.unit_source_value AS STRING)  AS source_value,
    vc.concept_id           AS concept_id,
    vc.concept_name         AS concept_name,
    COUNT(*)                AS count,
    ROUND(CAST(
            COUNT(IF(ev.unit_concept_id <> 0, 1, NULL)) 
        AS FLOAT64) / COUNT(*) * 100, 2) AS percent,
    1111111111111 AS is_top
FROM daring-tracer-300615.mimiciv_full_cdm_april26.cdm_measurement ev
LEFT JOIN daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept vc
    ON ev.unit_concept_id = vc.concept_id
WHERE ev.unit_concept_id IS NOT NULL
GROUP BY ev.unit_source_value, vc.concept_id, vc.concept_name
ORDER BY category, count DESC
-- LIMIT 1000 -- ?
;


INSERT INTO daring-tracer-300615.mimiciv_full_metrics_april26.me_tops_together
SELECT
    'cdm_measurement'      AS table_name,
    *
from daring-tracer-300615.mimiciv_full_metrics_april26.me_top_cdm_measurement rt
WHERE rt.category = 'Mapped'
order by count desc
LIMIT 100
UNION ALL
SELECT
    'cdm_measurement'      AS table_name,
    *
from daring-tracer-300615.mimiciv_full_metrics_april26.me_top_cdm_measurement rt
WHERE rt.category = 'Unmapped'
order by count desc
LIMIT 100

;

