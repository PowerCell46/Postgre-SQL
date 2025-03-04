SELECT
    DISTINCT product_id,
    'store1' AS store,
    (
        SELECT
            p1.store1
        FROM
            Products p1
        WHERE
            p1.product_id = pMain.product_id
    ) AS price
FROM
    Products pMain
WHERE
    (
        SELECT
            p1.store1
        FROM
            Products p1
        WHERE
            p1.product_id = pMain.product_id
    ) IS NOT NULL
  
UNION ALL -- Unite with the store2 results
  
SELECT
    DISTINCT product_id,
    'store2' AS store,
    (
        SELECT
            p2.store2
        FROM
            Products p2
        WHERE
            p2.product_id = pMain.product_id
    ) AS price
FROM
    Products pMain
WHERE

    (
        SELECT
            p2.store2
        FROM
            Products p2
        WHERE
            p2.product_id = pMain.product_id
    ) IS NOT NULL
  
UNION ALL -- Unite with the store3 results
  
SELECT
    DISTINCT product_id,
    'store3' AS store,
    (
        SELECT
            p3.store3
        FROM
            Products p3
        WHERE
            p3.product_id = pMain.product_id
    ) AS price
FROM
    Products pMain
WHERE
    (
        SELECT
            p3.store3
        FROM
            Products p3
        WHERE
            p3.product_id = pMain.product_id
    ) IS NOT NULL;
