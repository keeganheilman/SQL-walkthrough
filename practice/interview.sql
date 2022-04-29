-- https://www.hackerrank.com/challenges/interviews/problem

SELECT c.contest_id, c.hacker_id, c.name, sum(s.total_subs), sum(s.total_accepted_subs), sum(v.total_vs), sum(v.total_unique_vs)
FROM contests c
INNER JOIN colleges g
ON c.contest_id = g.contest_id
INNER JOIN challenges h
ON g.college_id = h.college_id
LEFT JOIN (
    SELECT challenge_id, sum(total_submissions) total_subs, sum(total_accepted_submissions) total_accepted_subs
    FROM submission_stats
    GROUP BY challenge_id
) s
ON h.challenge_id = s.challenge_id
LEFT JOIN (
    SELECT challenge_id, sum(total_views) total_vs, sum(total_unique_views) total_unique_vs
    FROM view_stats
    GROUP BY challenge_id
) v
ON h.challenge_id = v.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING
    sum(s.total_subs) != 0 OR
    sum(s.total_accepted_subs) != 0 OR
    sum(v.total_vs) != 0 OR
    sum(v.total_unique_vs) != 0
ORDER BY c.contest_id ASC;