SELECT MAX(j.salary) as maximumSalary, r.name as role
FROM jobs j
JOIN roles r ON j."roleId" = r.id
GROUP BY r.id
ORDER BY r.name; 
