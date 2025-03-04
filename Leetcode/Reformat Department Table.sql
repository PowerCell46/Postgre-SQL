SELECT
    DISTINCT id,
    (
        SELECT
            dJan.revenue
        FROM
            Department dJan
        WHERE
            dJan.id = dMain.id
        AND
            dJan.month = 'Jan'
    ) AS "Jan_Revenue",
    (
        SELECT
            dFeb.revenue
        FROM
            Department dFeb
        WHERE
            dFeb.id = dMain.id
        AND
            dFeb.month= 'Feb'
    ) AS "Feb_Revenue",
    (
        SELECT
            dMar.revenue
        FROM
            Department dMar
        WHERE
            dMar.id = dMain.id
        AND
            dMar.month = 'Mar'
    ) AS "Mar_Revenue",
    (
        SELECT
            dApr.revenue
        FROM
            Department dApr
        WHERE
            dApr.id = dMain.id
        AND
            dApr.month = 'Apr'
    ) AS "Apr_Revenue",
    (
        SELECT
            dMay.revenue
        FROM
            Department dMay
        WHERE
            dMay.id = dMain.id
        AND
            dMay.month = 'May'
    ) AS "May_Revenue",
    (
        SELECT
            dJun.revenue
        FROM
            Department dJun
        WHERE
            dJun.id = dMain.id
        AND
            dJun.month = 'Jun'
    ) AS "Jun_Revenue",
    (
        SELECT
            dJul.revenue
        FROM
            Department dJul
        WHERE
            dJul.id = dMain.id
        AND
            dJul.month = 'Jul'
    ) AS "Jul_Revenue",
    (
        SELECT
            dAug.revenue
        FROM
            Department dAug
        WHERE
            dAug.id = dMain.id
        AND
            dAug.month = 'Aug'
    ) AS "Aug_Revenue",
    (
        SELECT
            dSep.revenue
        FROM
            Department dSep
        WHERE
            dSep.id = dMain.id
        AND
            dSep.month = 'Sep'
    ) AS "Sep_Revenue",
    (
        SELECT
            dOct.revenue
        FROM
            Department dOct
        WHERE
            dOct.id = dMain.id
        AND
            dOct.month = 'Oct'
    ) AS "Oct_Revenue",
    (
        SELECT
            dNov.revenue
        FROM
            Department dNov
        WHERE
            dNov.id = dMain.id
        AND
            dNov.month = 'Nov'
    ) AS "Nov_Revenue",
    (
        SELECT
            dDec.revenue
        FROM
            Department dDec
        WHERE
            dDec.id = dMain.id
        AND
            dDec.month = 'Dec'
    ) AS "Dec_Revenue"
FROM
    Department dMain;
