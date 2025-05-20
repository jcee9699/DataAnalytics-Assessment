SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 AND s.confirmed_amount > 0 THEN p.id END) AS savings_count, # to identify customers with at least one funded savings plan
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 AND s.confirmed_amount > 0 THEN p.id END) AS investment_count, # to identify customers with at least one funded investment plan
    ROUND(SUM(s.confirmed_amount) / 100, 2) AS total_deposits # converted kobo to naira by dividing by two and then rounding up
FROM users_customuser u
JOIN plans_plan p ON u.id = p.owner_id
JOIN savings_savingsaccount s ON p.id = s.plan_i
GROUP BY u.id, u.name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;