
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select em.emp_no, em.last_name, em.first_name, em.gender, sa.salary
from employees em 
	left join salaries sa
		on sa.emp_no = em.emp_no;

-- 2. List employees who were hired in 1986.
select * from employees where extract('year' from hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select de.dept_no,
	de.dept_name,
	mg.emp_no,
	em.first_name,
	em.last_name, 
	mg.from_date,
	mg.to_date
from departments de
	left join dept_manager mg
		on mg.dept_no = de.dept_no
	left join employees	em
		on em.emp_no = mg.emp_no;
	

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no, 
	em.last_name, 
	em.first_name, 
	dm. dept_name 
from dept_emp de
	left join departments dm
		on dm.dept_no = de.dept_no
	left join employees em
		on em.emp_no = de.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees where first_name = 'Hercules' and  last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select em.emp_no,
	em.first_name,
	em.last_name,
	dm.dept_name
from departments dm
	inner join dept_emp de
		on de.dept_no = dm.dept_no
	left join employees em
		on em.emp_no = de.emp_no
where dm.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select em.emp_no,
	em.first_name,
	em.last_name,
	dm.dept_name
from departments dm
	inner join dept_emp de
		on de.dept_no = dm.dept_no
	left join employees em
		on em.emp_no = de.emp_no
where dm.dept_name = 'Sales' or dm.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) from employees group by last_name order by last_name desc;
