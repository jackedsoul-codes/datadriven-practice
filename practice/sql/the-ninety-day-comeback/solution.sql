WITH first_sessions AS (
    SELECT
        user_id,
        MIN(DATE(session_start)) AS first_date
    FROM user_sessions
    GROUP BY user_id
),
retained AS (
    SELECT DISTINCT
        u.user_id
    FROM user_sessions u
    JOIN first_sessions f
        ON u.user_id = f.user_id
    WHERE DATE(u.session_start) > f.first_date
      AND DATE(u.session_start) <= DATE_ADD(f.first_date, INTERVAL 90 DAY)
)
SELECT
    CAST(
        (SELECT COUNT(*) FROM retained) * 1.0 /
        (SELECT COUNT(DISTINCT user_id) FROM user_sessions)
        AS DOUBLE
    ) AS retention_rate;
