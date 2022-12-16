SELECT s.name as school, c.name as course, COUNT(*) as "studentsCount", e.status
FROM educations e
JOIN courses c ON e."courseId" = c.id
JOIN schools s ON e."schoolId" = s.id
JOIN users u ON e."userId" = u.id
GROUP BY c.name, s.name, e.status
ORDER BY "studentsCount" DESC
LIMIT 3;
