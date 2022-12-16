SELECT u.id, COUNT(*) as educations
FROM educations e
JOIN users u ON e."userId" = u.id
GROUP BY u.id;
