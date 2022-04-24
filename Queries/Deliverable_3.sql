-- Deliverable 3: Employee Database Analysis

-- retrieve total number for each title from the mentorship_eligibility table
-- and export to mentorship_eligibility_titles table
SELECT COUNT(title), title 
INTO mentorship_eligibility_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(title) DESC;

-- compare the counts by title between retiring_titles and mentorship_eligibility_titles
-- and find out the difference
SELECT rt.count AS retiring_titles_count,
	   rt.title, 
	   met.count AS mentorship_eligibility_titles_count,
	   COALESCE(rt.count-met.count, rt.count) as count_difference    -- if the met.count is null, 
																	 -- then (rt.count-met.count) is rt.count
FROM retiring_titles AS rt
	LEFT JOIN mentorship_eligibility_titles AS met
		ON (rt.title = met.title)
ORDER BY rt.count DESC;