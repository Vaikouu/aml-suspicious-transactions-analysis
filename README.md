## Workflow
1. Cleaned the raw data in Excel/Power Query
2. Loaded the tables into MySQL and progressed from easy → medium difficulty 
   SQL queries to detect:
   - **Structuring** – multiple cash deposits just under the $10,000 threshold 
     on the same day
   - **Round-tripping** – a large wire transfer in, followed within 1-3 days 
     by a wire transfer out of a similar amount
   - **High transaction velocity** – an unusually high number of transactions 
     within a short time window (self-JOIN)
   - **High-risk country exposure** – transactions to/from high-risk countries
3. Connected MySQL to Power BI and built a two-page interactive dashboard

## Dashboard Pages

### Page 1 – High Risk Clients and Transactions
- KPI cards: Total Customers / PEP customers split, Total Amount Transferred
- Monthly transaction trend (line chart)
- High-risk client ranking table with data bars
- PEP clients table with transaction totals

### Page 2 – High Risk Countries and Transfers
- Top customers by transaction count
- Transaction type breakdown (donut chart)
- Geographic map of transfers to high-risk countries
- Unemployed clients with disproportionately high transaction volumes

## Key Findings
- Customers listed as "Unemployed" with disproportionately high transaction 
  volumes (e.g. one flagged customer had 32 transactions)
- PEP customers with concentrated high-risk activity
- Geographic "hotspots" of transfers to high-risk countries

## Note
All data is synthetic (mock), generated for educational purposes. 
No real customer information is included.
