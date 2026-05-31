


SELECT
skills,
ROUND(AVG(job_postings_fact.salary_year_avg),2) AS Average_salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id

WHERE 
job_postings_fact.job_title_short = 'Data Analyst' AND
job_postings_fact.job_work_from_home = true AND 
job_postings_fact.salary_year_avg IS NOT NULL

GROUP BY 
skills

ORDER BY 
Average_salary DESC

LIMIT 10