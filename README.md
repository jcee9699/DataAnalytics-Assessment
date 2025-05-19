# Cowrywise Data Analytics Assessment

Hi there 👋  
This repository contains my SQL solutions to the Cowrywise Data Analyst assessment. Each query is designed to answer a real-world business question using relational data. I've done my best to keep the queries accurate, readable, and well-commented — and I’ve added a short explanation for each one below.

---

## 🧩 Question 1: High-Value Customers with Multiple Products

**What was asked:**  
Find customers who have both a funded savings and investment plan. Show how many of each they have, plus the total amount they’ve deposited.

**What I did:**  
- Joined the users, plans, and savings tables together.
- Used `CASE` inside a `COUNT()` to calculate savings vs. investment counts.
- Filtered to show only customers with at least one of both.
- Converted deposits from kobo to naira.
- Sorted by total deposits in descending order.

**A small challenge:**  
I had to make sure I wasn’t double-counting plans with multiple deposits. I used `DISTINCT` to fix that.

---

## 🔄 Question 2: Transaction Frequency Analysis

**What was asked:**  
Group customers into frequency categories based on how often they transact monthly.

**What I did:**  
- Counted total transactions per customer.
- Calculated the number of active months between their first and last transaction.
- Computed average monthly transactions and used `CASE` to bucket them as High, Medium, or Low frequency.
- Then grouped by frequency tier and calculated the average and total count.

**A small challenge:**  
To avoid dividing by zero (for people with just one transaction month), I added `+1` when calculating active months.

---

## 🔍 Question 3: Account Inactivity Alert

**What was asked:**  
Find all active savings or investment accounts that haven’t had any transactions in the last 365 days.

**What I did:**  
- Used `MAX(transaction_date)` to get the last activity date per plan.
- Used `DATEDIFF()` to calculate how many days it’s been.
- Filtered out plans with less than 365 days of inactivity.
- Tagged each result as either “Savings” or “Investment” using a simple `CASE`.

---

## 📊 Question 4: Customer Lifetime Value (CLV) Estimation

**What was asked:**  
Estimate CLV using transaction history and tenure, based on a given formula.

**What I did:**  
- Calculated tenure in months from signup to today.
- Counted total transactions and summed their value.
- Used 0.1% of the total value (converted to naira) as average profit per transaction.
- Plugged everything into the provided CLV formula and sorted results by CLV.

**A small challenge:**  
Some customers had short or inactive accounts, so I made sure to exclude those with zero tenure to avoid divide-by-zero errors.



---