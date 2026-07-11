## Overview
A portfolio project simulating a real-world AML (Anti-Money Laundering) workflow. 
A synthetic dataset of 184 customers and 1,850 transactions with intentionally 
embedded suspicious patterns and data quality issues, built to practice the full 
pipeline: cleaning → SQL analysis → visualization.

## Tools & Skills
- **Excel / Power Query** – data cleaning (inconsistent date formats, phone 
  number formats, IBAN formatting, missing "@" in emails, duplicate records)
- **MySQL** – data analysis (JOINs, GROUP BY/HAVING, self-JOIN for velocity 
  detection, subqueries)
- **Power BI** – interactive dashboard, KPI cards, geographic visualization

## Workflow
1. Cleaned the raw data in Excel/Power Query
2. Loaded the tables into MySQL and wrote SQL queries to detect:
   - **Structuring** – multiple cash deposits just under the $10,000 threshold 
     on the same day
   - **Round-tripping** – a large wire transfer in, followed within 1-3 days 
     by a wire transfer out of a similar amount
   - **High transaction velocity** – an unusually high number of transactions 
     within a short time window
   - **High-risk country exposure** – transactions to/from sanctioned or 
     high-risk countries
3. Connected MySQL to Power BI and built a two-page interactive dashboard

## Key Findings
- Customers listed as "Unemployed" with disproportionately high transaction 
  volumes
- PEP (Politically Exposed Person) customers with concentrated high-risk activity
- Geographic "hotspots" of transfers to high-risk countries

## Dashboard Preview

## Note
All data is synthetic (mock), generated for educational purposes. 
No real customer information is included.
