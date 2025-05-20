SELECT 
    p.id AS plan_id,
    p.owner_id,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date, # to get the most recent activity date for each plan
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days  # to get the total number of days that had elapsed
FROM plans_plan p
JOIN savings_savingsaccount s ON p.id = s.plan_id
WHERE (p.is_regular_savings = 1 OR p.is_a_fund = 1)
GROUP BY p.id, p.owner_id, type
HAVING inactivity_days > 365
ORDER BY inactivity_days ASC;