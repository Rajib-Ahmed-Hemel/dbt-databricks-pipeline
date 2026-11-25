select 
    operation,
    operationMetrics['numOutputRows'] as rows_written,
    operationMetrics['numSourceRows'] as rows_merged_in,
    operationMetrics['numTargetRowsUpdated'] as rows_updated,
    operationMetrics['numTargetRowsInserted'] as rows_inserted
from (DESCRIBE HISTORY dev.marts.fct_job_postings)
where operation in ('CREATE OR REPLACE TABLE AS SELECT','MERGE')
order by version desc;

-- delete from dev.marts.fct_job_postings
-- where search_date='2026-06-30';