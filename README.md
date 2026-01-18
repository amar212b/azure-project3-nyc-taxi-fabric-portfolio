# azure-project3-nyc 

# NYC Taxi Trip Analytics – Microsoft Fabric Portfolio Project

**Domain:** Transportation  
**Business Problem:** Analyze NYC Yellow Taxi trip data for insights on revenue trends, trip distance, and payment patterns to optimize operations.

**Dataset:** Kaggle NYC Yellow Taxi (multiple months CSV)  
Note: Dataset contained historical spillover; cleaning applied, analysis includes all data for richer patterns.

**Architecture:** Medallion pattern in Fabric Lakehouse  
- Bronze: Raw CSV upload  
- Silver: Cleaning + timestamp conversion  
- Gold: Daily revenue, monthly avg distance, payment summary  

**Notebooks (4-step clean structure):**
1. 01_bronze_ingest.ipynb – Load raw data  
2. 02_silver_clean.ipynb – Clean & timestamp  
3. 03_gold_aggregate.ipynb – Daily revenue + monthly distance + payment summary  
4. 04_quality_checks.ipynb – Assertions-only validation  

**Git Integration Note**  
Fabric native sync (GitHub/Azure DevOps) is disabled in trial/developer subscription due to billing restrictions. Notebooks exported manually as .ipynb for version control.

**Screenshots:**
https://github.com/amar212b/azure-project3-nyc-taxi-fabric-portfolio/tree/35f55e6979c526955a2503804daae8428920a0a3/images

