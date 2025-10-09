/* Write your T-SQL query statement below */
select
    results
from
    (
        SELECT
            top 1 u.name results
        FROM
            Users u
            INNER JOIN MovieRating m ON u.user_id = m.user_id
        group by
            u.name
        order by
            count(1) desc,
            u.name asc
    ) a1
UNION ALL
select
    results
from
    (
        SELECT
            top 1 u.title as results
        FROM
            Movies u
            INNER JOIN MovieRating m ON u.movie_id = m.movie_id
        where
            m.created_at like '2020-02%'
        group by
            u.title
        order by
            avg(rating + 0.00) desc,
            u.title
    ) a2