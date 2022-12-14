SELECT u.id, u.name, r.name AS role, c.name AS company, e."startDate"
FROM experiences e
JOIN users u ON e."userId" = u.id
JOIN companies c ON e."companyId" = c.id
JOIN roles r ON e."roleId" = r.id
WHERE u.id = 50
  AND e."endDate" IS NOT NULL;
