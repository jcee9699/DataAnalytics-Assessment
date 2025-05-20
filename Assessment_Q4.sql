SELECT 
    u.id AS customer_id,
    u.name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months, # to get tenure in months from registration to today
    COUNT(s.id) AS total_transactions,
    ROUND(
        (COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * 
        ((0.001 * SUM(s.confirmed_amount) / 100) / COUNT(s.id)), 2 # I multiplied by the given formula, 0.1% and then divided by 100 to convert to naira
    ) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
GROUP BY u.id, u.name
HAVING tenure_months > 0 # I excluded customers with zero tenure to avoid divide-by-zero errors
ORDER BY estimated_clv DESC;
