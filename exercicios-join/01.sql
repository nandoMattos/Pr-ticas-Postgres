SELECT u.id, u.name, c.name AS city
FROM users u
JOIN cities c ON u."cityId" = c.id
WHERE c.name = 'Rio de Janeiro';
