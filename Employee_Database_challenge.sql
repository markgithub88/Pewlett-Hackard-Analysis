
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date 
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
ORDER by e.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title
INTO unique_titles

FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT desc;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
	de.from_date,
    de.to_date,
	ti.title
 	INTO mentorship_eligibilty
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;
SELECT * FROM mentorship_eligibilty
SELECT * FROM retirement_titles

SELECT (*) FROM unique_titles


SELECT COUNT (*) FROM mentorship_eligibilty

SELECT COUNT (*) FROM retiring_titles

SELECT * FROM retiring_titles


SELECT COUNT(title),title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT desc;











