SELECT u.id, u.name, c.name AS course, s.name AS school, e."endDate"
FROM educations e
JOIN users u ON e."userId" = u.id
JOIN courses c ON e."courseId" = c.id
JOIN schools s ON e."schoolId" = s.id
WHERE u.id = 30
  AND e.status = 'finished';
