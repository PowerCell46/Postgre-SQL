SELECT
    qMain.person_name
FROM
    Queue qMain
WHERE
    (
        SELECT
            SUM(weight)
        FROM
            Queue q1
        WHERE q1.turn <= qMain.turn
    )
    <= 1000
ORDER BY
    (
        SELECT
            SUM(weight)
        FROM
            Queue q1
        WHERE q1.turn <= qMain.turn
    ) DESC
LIMIT 1;
