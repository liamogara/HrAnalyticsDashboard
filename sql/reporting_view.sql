CREATE VIEW employees_reporting AS
SELECT
	EmployeeID,
	Department,
	JobTitle,
	HireDate,
	TerminationDate,
	EmploymentType,
	Salary,
	Location,
	CASE
		WHEN TerminationDate IS NULL THEN 1
		ELSE 0
	END AS Active
FROM employees;