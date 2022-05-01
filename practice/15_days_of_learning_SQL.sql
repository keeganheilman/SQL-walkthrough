-- https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem


/*
Enter your query here.
*/


SELECT
    submission_date,
    (
        SELECT COUNT(DISTINCT hacker_id)
        FROM Submissions s2 
        WHERE s2.submission_date = s1.submission_date
        AND DATEDIFF(s1.submission_date , '2016-03-01') = 
            (
                SELECT COUNT(DISTINCT s3.submission_date)
                FROM submissions s3
                WHERE s3.hacker_id = s2.hacker_id
                AND s3.submission_date < s1.submission_date
            )
    ) sub_counts, 
    (
        SELECT hacker_id
        FROM submissions s2
        WHERE s2.submission_date = s1.submission_date 
        GROUP BY hacker_id
        ORDER BY count(submission_id) DESC, hacker_id limit 1
    ) h_id,
    (
        SELECT h.name
        FROM hackers h
        WHERE h.hacker_id = h_id
    ) h_name
FROM (
    DISTINCT submission_date
    FROM submissions
    ) s1
GROUP BY submission_date
