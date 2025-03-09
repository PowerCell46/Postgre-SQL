SELECT
    CASE -- Keep the same id, in case it's odd number of entries and it's the last element  
        WHEN ((SELECT COUNT(*) FROM Seat) % 2 != 0) AND (id = (SELECT MAX(id) FROM Seat)) THEN id
        ELSE ( -- If the id is even: decrement; otherwize: increment
            CASE
                WHEN id % 2 = 0 THEN id - 1
                ELSE id + 1
            END
        )
    END AS id,
    student
FROM
    Seat
ORDER BY
    ( -- Order by the new col, can't use the name, because it's duplicate with the og table col name
        CASE 
            WHEN ((SELECT COUNT(*) FROM Seat) % 2 != 0) AND (id = (SELECT MAX(id) FROM Seat)) THEN id
            ELSE (
                CASE
                    WHEN id % 2 = 0 THEN id - 1
                    ELSE id + 1
                END
            )
        END
    );
