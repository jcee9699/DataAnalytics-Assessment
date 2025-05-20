# Data Analytics Assessment

This repository contains my SQL solutions to a Data Analyst assessment at a financial institution. Each query addresses a real-world business question. I analyzed the data using MySQL and will describe my approach to each question below.

---

## Question 1: High-Value Customers with Multiple Products

**Objective:**  
To identify customers who have both a funded savings and investment plan, showing how many of each they have including the total amount they have deposited.

**My Approach:**  
- I combined the users, plans, and savings tables using `JOIN`.
- Then using `CASE` inside a `COUNT()`, I retrieved the list of customers with a count of total number of funded savings & investment plans, as well as the total amount deposited per customer.
- Next, I converted deposits from kobo to naira.
- Then filtered to show only customers with at least one savings plan or one investment plan. 
- Finally, I sorted by total deposits in descending order.

**Challenges:**  
I had to make sure I was not double-counting plans with more than one deposits. I used `DISTINCT` to correct that.

---

## Question 2: Transaction Frequency Analysis

**Objective:**  
To group customers into frequency categories based on how often they transact each month.

**My Approach:**  
- I counted the total transactions each customer has made.
- Then calculated the total number of months of activity from the initial to the final transaction
- Next, I calculated average monthly transactions and applied `CASE` to categorize them into High frequency, Medium frequency, or Low frequency.
- Lastly, I organized by frequency tier and computed the average and total count.

**Challenges:**  
I included `+1` in the calculation of active months for customers with only one transaction month so that I do not divide by zero.

---

## Question 3: Account Inactivity Alert

**Objective:** 
To identify all currently active savings or investment accounts that have not recorded any transactions over the past year.


**My Approach:**  
- Using `CASE` statement, I categorized each plan as either “Savings” or “Investment”.
- Then I used `MAX(transaction_date)` to retrieve the most recent activity date for each plan.
- Next, I determined the total number of days that had elapsed using `DATEDIFF()`.
- Finally, I filtered out plans with less than 365 days of inactivity.
---

## Question 4: Customer Lifetime Value (CLV) Estimation

**Objective:**  
To determine customer lifetime value using transaction history and tenure, based on a given formula.


**My Approach:** 
- I calculated tenure in months from registration to the present day.
- Then I counted total transactions and aggregated their value.
- Next, I used 0.1% of the total value (converted to naira) as average profit per transaction.
- Lastly, I sorted the results by estimated clv.

**Challenges:**  
Some customers had short or inactive accounts, so I ensured to exclude those with zero tenure to avoid divide-by-zero errors.


---