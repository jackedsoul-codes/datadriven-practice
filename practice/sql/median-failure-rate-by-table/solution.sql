WITH ordered AS (
    SELECT
        tbl_name,
        fail_pct,
        COUNT(*) OVER (
            PARTITION BY tbl_name
        ) AS length_tblname,
        ROW_NUMBER() OVER (
            PARTITION BY tbl_name
            ORDER BY fail_pct
        ) AS rn
    FROM dq_checks
    WHERE fail_pct IS NOT NULL
)
SELECT
    tbl_name,
    ROUND(AVG(fail_pct), 0) AS median_fail_pct
FROM ordered
WHERE rn BETWEEN length_tblname / 2.0
             AND length_tblname / 2.0 + 1
GROUP BY tbl_name;
