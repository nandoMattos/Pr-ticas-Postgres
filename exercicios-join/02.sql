SELECT t.id, u1.name AS writer, u2.name AS recipient, t.message
FROM testimonials t 
JOIN users u1 ON t."writerId" = u1.id
JOIN users u2 ON t."recipientId" = u2.id;
