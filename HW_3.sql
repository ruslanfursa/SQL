
/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/

SELECT employee_name, monthly_salary
FROM employees  
JOIN employee_salary ON employees.id = employee_salary.employee_id 
JOIN salary ON employee_salary.salary_id = salary.id;

/*2. Вывести всех работников у которых ЗП меньше 2000.*/

SELECT employee_name, monthly_salary
FROM employees  
JOIN employee_salary ON employees.id = employee_salary.employee_id 
JOIN salary ON employee_salary.salary_id = salary.id
WHERE monthly_salary < 2000;

/*3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/

SELECT employee_name, monthly_salary
FROM employee_salary  
JOIN salary  ON employee_salary.salary_id = salary.id
LEFT JOIN employees ON employees.id = employee_salary.employee_id 
WHERE employee_name IS NULL;

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/

SELECT employee_name, monthly_salary
FROM employee_salary  
JOIN salary  ON employee_salary.salary_id = salary.id
LEFT JOIN employees ON employees.id = employee_salary.employee_id 
WHERE employee_name  IS NULL AND monthly_salary < 2000;

/* 5. Найти всех работников кому не начислена ЗП.*/

SELECT employee_name, monthly_salary
FROM employee_salary  
JOIN salary  ON employee_salary.salary_id = salary.id
RIGHT JOIN employees ON employees.id = employee_salary.employee_id 
WHERE monthly_salary IS NULL;

/*6. Вывести всех работников с названиями их должности.*/

SELECT employee_name, role_name 
FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id;

/* 7. Вывести имена и должность только Java разработчиков.*/

SELECT employee_name, role_name 
FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id
WHERE role_name LIKE '%Java developer';


/*8. Вывести имена и должность только Python разработчиков.*/

SELECT employee_name, role_name 
FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id
WHERE role_name LIKE '%Python developer';

/* 9. Вывести имена и должность всех QA инженеров.*/

SELECT employee_name, role_name 
FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id
WHERE role_name LIKE '%QA engineer%';

/*10. Вывести имена и должность ручных QA инженеров.*/

SELECT employee_name, role_name 
FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id
WHERE role_name LIKE '%Manual QA engineer%';

/*11. Вывести имена и должность автоматизаторов QA*/

SELECT employee_name, role_name 
FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id
WHERE role_name LIKE '%Automation QA engineer%';

/* 12. Вывести имена и зарплаты Junior специалистов*/

SELECT employee_name, role_name, monthly_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE role_name LIKE '%Junior%';

/* 13. Вывести имена и зарплаты Middle специалистов*/

SELECT employee_name, role_name, monthly_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE role_name LIKE '%Middle%';

/* 14. Вывести имена и зарплаты Senior специалистов*/

SELECT employee_name, role_name, monthly_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE role_name LIKE '%Senior%';

/*15. Вывести зарплаты Java разработчиков*/

SELECT monthly_salary, role_name 
FROM salary 
JOIN roles_employee ON salary.id = roles_employee.employee_id
JOIN roles ON roles.id = roles_employee.role_id
WHERE role_name LIKE '%Java developer';

/* 16. Вывести зарплаты Python разработчиков*/

SELECT role_name, monthly_salary
FROM roles_employee 
JOIN employees ON roles_employee.employee_id = employees.id 
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id 
WHERE LOWER (role_name) LIKE '%python%';

/*17. Вывести имена и зарплаты Junior Python разработчиков*/

SELECT employee_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id=employees.id 
JOIN roles ON roles_employee.role_id=roles.id
JOIN employee_salary ON roles_employee.employee_id=employee_salary.employee_id
JOIN salary ON salary.id=employee_salary.salary_id 
WHERE LOWER(role_name) LIKE 'junior python developer';

/*18. Вывести имена и зарплаты Middle JS разработчиков*/

SELECT employee_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id=employees.id 
JOIN roles ON roles_employee.role_id=roles.id
JOIN employee_salary ON roles_employee.employee_id=employee_salary.employee_id
JOIN salary ON salary.id=employee_salary.salary_id 
WHERE LOWER(role_name) LIKE '%middle javascript developer%';

/*19. Вывести имена и зарплаты Senior Java разработчиков*/

SELECT employee_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id=employees.id 
JOIN roles ON roles_employee.role_id=roles.id
JOIN employee_salary ON roles_employee.employee_id=employee_salary.employee_id
JOIN salary ON salary.id=employee_salary.salary_id 
WHERE LOWER(role_name) LIKE '%senior javascript developer%';

/*20. Вывести зарплаты Junior QA инженеров*/

SELECT monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id=employees.id 
JOIN roles ON roles_employee.role_id=roles.id
JOIN employee_salary ON roles_employee.employee_id=employee_salary.employee_id
JOIN salary ON salary.id=employee_salary.salary_id 
WHERE LOWER(role_name) LIKE '%junior%qa%';

/*21. Вывести среднюю зарплату всех Junior специалистов*/

SELECT AVG(monthly_salary) AS aver_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%Junior%';

/*22. Вывести сумму зарплат JS разработчиков*/

SELECT SUM(monthly_salary) AS sum_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%javascript developer';

/*23. Вывести минимальную ЗП QA инженеров*/

SELECT MIN(monthly_salary) AS min_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%qa%';

/*24. Вывести максимальную ЗП QA инженеров*/

SELECT MAX(monthly_salary) AS max_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%qa%';

/*25. Вывести количество QA инженеров*/

SELECT COUNT(employee_name) AS count_qa 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%qa%';

/*26. Вывести количество Middle специалистов.*/

SELECT COUNT(employee_name) AS count_middle
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%middle%';

/*27. Вывести количество разработчиков*/

SELECT COUNT(employee_name) AS count_developer
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%developer%';

/*28. Вывести фонд (сумму) зарплаты разработчиков.*/

SELECT SUM(monthly_salary) AS sum_salary 
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON roles.id = roles_employee.role_id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE LOWER(role_name) LIKE '%developer';

/*29. Вывести имена, должности и ЗП всех специалистов по возрастанию*/

SELECT employee_name,role_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id 
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id 
ORDER BY monthly_salary ASC;

/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300*/

SELECT employee_name,role_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id 
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id 
WHERE monthly_salary>=1700 AND monthly_salary<=2300 
ORDER BY monthly_salary ASC;

/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300*/

SELECT employee_name,role_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id 
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id 
WHERE monthly_salary<2300
ORDER BY monthly_salary ASC;

/*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000*/

SELECT employee_name,role_name,monthly_salary
FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id 
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id 
WHERE monthly_salary IN (1100, 1500, 2000)
ORDER BY monthly_salary ASC;


















