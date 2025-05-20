# Data Analytics Assessment

This repository contains my SQL solutions to a Data Analyst assessment in a financial institution. Each query answers a real-world business question. I analyzed the data using MySQL and will be explaining my approach to each question below.

---

## Question 1: High-Value Customers with Multiple Products

**Objective:**
Identify customers who have both a funded savings and investment plan, showing how many of each they have including the total amount they have deposited.

**My Approach:**  
- I combined the users, plans, and savings tables using `JOIN`.
- Then using `CASE` inside a `COUNT()`, I retrieved the list of customers with a count of total number of funded savings & investment plans, as well as the total amount deposited per customer.
- Next I converted deposits from kobo to naira.
- Then I filtered to show only customers with at least one savings plan or one investment plan. 
- Finally, I sorted by total deposits in descending order.

**Challenges:**  
I had to make sure I was not double-counting plans with more than one deposits. I used `DISTINCT` to correct that.

---

## Question 2: Transaction Frequency Analysis

**Objective:**  
Group customers into frequency categories based on how often they transact monthly.

**My Approach:**  
- Counted total transactions per customer.
- Calculated the number of active months between their first and last transaction.
- Computed average monthly transactions and used `CASE` to bucket them as High, Medium, or Low frequency.
- Then grouped by frequency tier and calculated the average and total count.

**Challenges:**  
To avoid dividing by zero (for people with just one transaction month), I added `+1` when calculating active months.

---

## Question 3: Account Inactivity Alert

**Objective:** 
Find all active savings or investment accounts that haven’t had any transactions in the last 365 days.

**My Approach:**  
- Used `MAX(transaction_date)` to get the last activity date per plan.
- Used `DATEDIFF()` to calculate how many days it’s been.
- Filtered out plans with less than 365 days of inactivity.
- Tagged each result as either “Savings” or “Investment” using a simple `CASE`.

---

## Question 4: Customer Lifetime Value (CLV) Estimation

**Objective:**
Estimate CLV using transaction history and tenure, based on a given formula.

**My Approach:** 
- Calculated tenure in months from signup to today.
- Counted total transactions and summed their value.
- Used 0.1% of the total value (converted to naira) as average profit per transaction.
- Plugged everything into the provided CLV formula and sorted results by CLV.

**Challenges:**
Some customers had short or inactive accounts, so I made sure to exclude those with zero tenure to avoid divide-by-zero errors.



---