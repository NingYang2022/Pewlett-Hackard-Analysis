-- Deliverable 1:The Number of Retiring Employees by Title 
-- 1.Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no,first_name, last_name FROM employees;

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT emp_no, title, from_date, to_date FROM titles;


-- 4.Join both tables on the primary key.
SELECT  emp.emp_no, 
		emp.first_name,
		emp.last_name,
		titles.title, 
		titles.from_date, 
		titles.to_date
FROM employees AS emp
	 JOIN titles 
		ON emp.emp_no = titles.emp_no
ORDER BY emp_no
;

-- 5.Filter the data on the birth_date column to retrieve the employees 
-- who were born between 1952 and 1955. Then, order by the employee number.

SELECT  emp.emp_no, 
		emp.first_name,
		emp.last_name,
		titles.title, 
		titles.from_date, 
		titles.to_date
FROM employees AS emp
JOIN titles 
		ON emp.emp_no = titles.emp_no
	 WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
;

-- 6.Export the Retirement Titles table from the previous step as retirement_titles.csv 
-- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
SELECT  emp.emp_no, 
		emp.first_name,
		emp.last_name,
		titles.title, 
		titles.from_date, 
		titles.to_date
INTO retirement_titles                            -- 3 Create a new table using the INTO clause.
FROM employees AS emp
JOIN titles                                         
		ON emp.emp_no = titles.emp_no
	 WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
;

SELECT * FROM retirement_titles；

-- get data from retirement_titles, display in order by (emp_no, from_date) 
-- and DESCENDING on from_date
SELECT  * FROM retirement_titles
ORDER BY emp_no, from_date DESC;

-- 9.	Retrieve the employee number, first and last name, and title columns 
--from the Retirement Titles table
SELECT  emp_no, 
		first_name, 
		last_name,
		title FROM retirement_titles
ORDER BY emp_no, from_date DESC;

-- 10. Use Dictinct with Order by to remove duplicate rows
-- retrieve a single row defined by the ON () clause.
SELECT  DISTINCT ON (emp_no) *
FROM retirement_titles
ORDER BY emp_no, from_date DESC;

--11.Exclude those employees that have already left the company 
--by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
SELECT  DISTINCT ON (emp_no) *
FROM retirement_titles
	WHERE to_date = ('9999-01-01')
ORDER BY emp_no, from_date DESC;


-- 13.Sort the Unique Titles table in ascending order by 
-- the employee number and descending order by the last date (i.e., to_date) of the most recent title.
SELECT  DISTINCT ON (emp_no)
		emp_no, 
		first_name, 
		last_name,
		title
FROM retirement_titles
	WHERE to_date = ('9999-01-01')
ORDER BY emp_no, from_date DESC;

-- 12.Create a Unique Titles table using the INTO clause.
SELECT  DISTINCT ON (emp_no)
		emp_no, 
		first_name, 
		last_name,
		title
INTO unique_titles
FROM retirement_titles
	WHERE to_date = ('9999-01-01')
ORDER BY emp_no, from_date DESC;

SELECT * FROM unique_titles;

SELECT count(title) FROM unique_titles
GROUP BY title;


--16 retrieve the number of employees by their most recent job title 
-- who are about to retire.
--19.Group the table by title, then sort the count column in descending order.
SELECT COUNT(title), title 
FROM unique_titles
--into retiring_titles
GROUP BY title
ORDER BY COUNT(title) DESC
；

--18. create a Retiring Titles table to hold the required information.
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC
；
-------------------------------------------------------
--Deliverble 2:The Employees Eligible for the Mentorship Program 

--1.Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no,
	   first_name, 
	   last_name, 
	   birth_date
FROM employees;

-- 2.Retrieve the from_date and to_date columns from the Department Employee table.
SELECT emp_no,
	   from_date,
	   to_date
FROM dept_emp;

-- 3. Retrieve the title column from the Titles table.
SELECT emp_no,
	   title
FROM titles;

-- 4-9
SELECT DISTINCT ON (emp_no)  -- 4. Use a DISTINCT ON statement to retrieve the first occurrence 
							 -- of the employee number for each set of rows
			e.emp_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			de.from_date,
			de.to_date,
			titles.title
INTO mentorship_eligibility  					-- 5 Create a new table using the INTO clause.

FROM employees AS e
	INNER JOIN dept_emp AS de		         --6. Join the Employees and the Department Employee tables 
		ON (e.emp_no = de.emp_no)				-- on the primary key.
	INNER JOIN titles						 --7. Join the Employees and the Titles tables 
		ON (e.emp_no = titles.emp_no)			-- on the primary key.

WHERE (de.to_date = '9999-01-01')							--8a. Filter to_date column to all the current employees,
     
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')	--8b. Filter birth_date column to get employees whose birth 
																--dates are between January 1, 1965 and December 31, 1965.
ORDER BY e.emp_no							 --9.Order the table by the employee number.
;


SELECT * FROM mentorship_eligibility;

