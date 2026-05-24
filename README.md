# London Crime Analysis (2023 to 2024)

A portfolio project exploring crime patterns across London boroughs using Python, SQL, machine learning, and Power BI.

---

## Business Question

**Which London boroughs have the highest crime rates, what types of crime dominate, and can we predict future crime trends?**

---

## Key Findings

1. Westminster and Lambeth consistently rank as the highest-crime boroughs across all months.
2. Violence and sexual offences account for the largest share of reported crimes citywide.
3. Only around 20% of crimes result in a resolved outcome. The majority are closed with no further action.
4. K-Means clustering identified 4 distinct borough profiles ranging from high-volume mixed crime hubs to low-crime residential areas.
5. Prophet forecasting suggests crime volumes in high-crime clusters will remain elevated through mid-2025 with modest seasonal variation.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Python (Pandas, Matplotlib, Seaborn) | Data loading, cleaning, exploratory analysis |
| DuckDB | In-process SQL analysis on 1.1M rows |
| Scikit-learn | K-Means clustering |
| Prophet | Time series forecasting |
| Power BI | Interactive dashboard |
| GitHub | Version control and portfolio hosting |

---

## Data Source

**UK Police Open Data** available at [data.police.uk](https://data.police.uk/data/)

Monthly street-level crime records for the Metropolitan Police Service covering January 2023 to December 2024. The raw dataset contains approximately 1.1 million rows across 12 monthly CSV files.

---

## Project Structure

```
london-crime-analysis/
├── data/
│   └── cleaned_crime_data.csv
├── notebooks/
│   ├── 01_data_loading.ipynb
│   └── 02_eda.ipynb
├── sql/
│   ├── 01_total_crimes_by_borough.sql
│   ├── 02_monthly_crime_trend.sql
│   ├── 03_top3_crimes_per_borough.sql
│   ├── 04_outcome_distribution.sql
│   ├── 05_resolution_rate_by_borough.sql
│   ├── 06_yoy_change.sql
│   ├── 07_cumulative_share_by_crime_type.sql
│   ├── 08_rolling_3month_avg.sql
│   ├── 09_monthly_rank_by_borough.sql
│   └── 10_high_volume_low_resolution.sql
├── images/
│   ├── chart1.png
│   ├── chart2.png
│   ├── chart3.png
│   ├── chart4.png
│   ├── chart5.png
│   ├── chart6.png
│   ├── chart7.png
│   └── chart8.png
├── dashboard/
│   ├── london_crime_dashboard.pbix
│   ├── page1_overview.png
│   ├── page2_borough_analysis.png
│   ├── page3_crime_type_breakdown.png
│   └── page4_clustering_results.png
├── exports/
│   ├── borough_monthly_crimes.csv
│   ├── outcome_summary.csv
│   └── cluster_profiles.csv
├── .gitignore
└── README.md
```

---

## Methodology

### Step 1: Data Loading and Cleaning

Loaded 12 monthly CSV files using glob and combined them with pd.concat. Cleaned the dataset by dropping the Context column, filling null outcome values, converting the Month column to datetime format, and removing the Crime ID column. Saved the output as cleaned_crime_data.csv.

### Step 2: Exploratory Data Analysis

Ran 8 analysis questions using Pandas, Matplotlib, and Seaborn covering crime volume by borough, crime type distribution, monthly trends, outcome breakdown, resolution rates by borough, seasonal patterns, heatmaps, and top crime types per borough.

### Step 3: SQL Analysis with DuckDB

Wrote 10 SQL queries using DuckDB to perform analytical queries on the full 1.1M row dataset. Queries covered borough rankings, monthly trends, window functions (RANK, LAG, SUM OVER), year-on-year change, rolling averages, and Pareto analysis of crime types.

### Step 4: K-Means Clustering

Applied K-Means clustering to group London boroughs by their crime profile. Used the elbow method to select k=4. Clustering was based on the percentage share of each crime type per borough rather than raw counts, so that borough size does not skew results.

#### Cluster Profiles

| Cluster | Label | Characteristics |
|---------|-------|----------------|
| 0 | High-Volume Mixed Crime Hubs | Very high overall crime, diverse crime types, low resolution rate |
| 1 | Residential Low-Crime Boroughs | Low crime volume, mostly theft and minor offences |
| 2 | Violence-Dominant Boroughs | Moderate volume, disproportionately high violence and sexual offences |
| 3 | Theft and Property Crime Boroughs | Mid-range volume, dominated by vehicle crime and shoplifting |

### Step 5: Time Series Forecasting with Prophet

Used Meta's Prophet library to forecast monthly crime counts per cluster through mid-2025. Configured with logistic growth, no seasonal components (due to limited training data of 12 months), and conservative changepoint settings to avoid overfitting.

### Step 6: Power BI Dashboard

Built a 4-page interactive dashboard connected to the exported CSV files.

**Page 1: Overview** covers total crimes, resolution rate KPI cards, monthly trend line chart, and crime type donut chart.

**Page 2: Borough Analysis** covers a bar chart of top 10 boroughs by crime volume and a map visual showing borough-level crime intensity.

**Page 3: Crime Type Breakdown** covers crime type comparison across boroughs with slicer filters by year and borough.

**Page 4: Clustering Results** covers cluster assignment by borough, cluster profile bar charts, and Prophet forecast line chart.

#### Dashboard Screenshots

![Page 1 Overview](dashboard/page1_overview.png)
![Page 2 Borough Analysis](dashboard/page2_borough_analysis.png)
![Page 3 Crime Type Breakdown](dashboard/page3_crime_type_breakdown.png)
![Page 4 Clustering Results](dashboard/page4_clustering_results.png)

> **Note:** The Power BI file requires 8GB or more RAM to open without memory errors due to the size of the dataset.

---

## How to Run

1. Clone this repository.
2. Upload the notebook files to Google Colab.
3. Mount your Google Drive and update the file paths in the notebooks.
4. Run 01_data_loading.ipynb first to generate cleaned_crime_data.csv.
5. Run 02_eda.ipynb for EDA, SQL analysis, clustering, and forecasting.
6. Open the Power BI file from the dashboard folder using Power BI Desktop.

Required Python packages:

```
pandas
matplotlib
seaborn
duckdb
scikit-learn
prophet
```

Install with:

```
pip install pandas matplotlib seaborn duckdb scikit-learn prophet
```

---

## Author

**Sakshi Hanamshetti**

[GitHub](https://github.com/SakshiHanamshetti) | [LinkedIn](https://www.linkedin.com/in/sakshi-hanamshetti)


