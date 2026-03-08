CREATE VIEW IF NOT EXISTS active_employees AS
SELECT *
FROM employees
WHERE TerminationDate IS NULL;

CREATE VIEW IF NOT EXISTS depeartment_headcount AS
SELECT
	Department,
	COUNT(*) AS Headcount
FROM employees
WHERE TerminationDate IS NULL
GROUP BY Department
ORDER BY Headcount DESC;

CREATE VIEW IF NOT EXISTS monthly_hires AS
SELECT
	strftime('%Y-%m', HireDate) AS HireMonth,
	COUNT(*) AS Hires
FROM employees
GROUP BY HireMonth
ORDER BY HireMonth;

CREATE VIEW IF NOT EXISTS monthly_terminations AS
SELECT
	strftime('%Y-%m', TerminationDate) AS TermMonth,
	COUNT(*) AS Terminations
FROM employees
WHERE TerminationDate IS NOT NULL
GROUP BY TermMonth
ORDER BY TermMonth;

CREATE VIEW IF NOT EXISTS department_turnover AS
SELECT
	Department,
	COUNT(TerminationDate) * 1.0 / COUNT(*) AS TurnoverRate
FROM employees
GROUP BY Department
ORDER BY TurnoverRate DESC;