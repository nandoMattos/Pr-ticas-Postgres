SELECT u.id, COUNT(*) as testimonialCount
FROM testimonials t
JOIN users u ON t."writerId" = u.id
GROUP BY u.id;
