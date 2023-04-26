-- ----------------------------------------------------------------------------------------------
-- Alternative statistics for CDM tables
--
-- Number of  persons
-- Total
-- Race/Ethnicity Breakdown
-- Number of visits
-- Total
-- Stratified by visit_concept_id
-- Top 100 Mapped and Unmapped values on event tables
-- Total count on event tables
-- ----------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------
-- assuming that databases are:
-- cdm:             omop
-- vocabularies:    mimic_vocabulary
-- metrics output:  mimic_ metrics
--
-- create database mimic_ metrics;
-- ----------------------------------------------------------------------------------------------

drop table if exists daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits;
create table daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits
(
        category string,
        name string,
        count int64
);

-- ----------------------------------------------------------------------------------------------
-- Number of  persons
-- ----------------------------------------------------------------------------------------------
insert into daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits
select 'Number of persons' as category, 'Total' as name,  count(*) as count
from daring-tracer-300615.mimiciv_full_cdm_april26.cdm_person
;

insert into daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits
select 'Number of persons by Race' as category, vc.concept_name as name,  count(*) as count
from daring-tracer-300615.mimiciv_full_cdm_april26.cdm_person per
left join daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept vc
    on per.race_concept_id = vc.concept_id
group by vc.concept_name
order by vc.concept_name
;


insert into daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits
select 'Number of persons by Ethnicity' as category, vc.concept_name as name,  count(*) as count
from daring-tracer-300615.mimiciv_full_cdm_april26.cdm_person per
left join daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept vc
    on per.ethnicity_concept_id = vc.concept_id
group by vc.concept_name
order by vc.concept_name
;

-- ----------------------------------------------------------------------------------------------
-- Number of visits
-- Total
-- Stratified by visit_concept_id
-- ----------------------------------------------------------------------------------------------

insert into daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits
select 'Number of visits' as category, 'Total' as name,  count(*) as count
from daring-tracer-300615.mimiciv_full_cdm_april26.cdm_visit_occurrence
;


insert into daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits
select 'Number of visits by visit_concept_id' as category, vc.concept_name as name,  count(*) as count
from daring-tracer-300615.mimiciv_full_cdm_april26.cdm_visit_occurrence vis
left join daring-tracer-300615.mimiciv_full_cdm_april26.voc_concept vc
    on vis.visit_concept_id = vc.concept_id
group by vc.concept_name
order by vc.concept_name
;

select * from daring-tracer-300615.mimiciv_full_metrics_april26.me_persons_visits order by category, name;
