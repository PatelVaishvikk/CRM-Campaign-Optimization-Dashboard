# CRM Campaign Optimization Dashboard

## Project Overview
This project analyzes marketing campaign data from a hypothetical Braze CRM tool. The dataset includes information on email, SMS, and push notification campaigns, along with user engagement metrics such as delivery status, clicks, conversions, and recipient demographics. The goal is to optimize marketing strategies and derive actionable insights by creating an interactive Tableau dashboard and querying the data with SQL.

---

## Objectives
- Analyze key performance indicators (KPIs) such as conversion rates, click-through rates, and campaign efficiency.
- Identify high-performing campaigns and top-performing locations.
- Evaluate the effectiveness of campaign types and optimize targeting strategies.
- Visualize the data using Tableau for better interpretability.

---

## Dataset Description
This dataset is structured to mimic data exported from the Braze CRM tool, containing the following fields:
- **Campaign_Name**: Name of the marketing campaign.
- **Campaign_Type**: Type of campaign (Email, SMS, Push Notification).
- **Recipient_ID**: Unique identifier for each recipient.
- **Delivery_Status**: Status of the campaign delivery (Delivered, Undelivered).
- **Open_Status**: Whether the campaign was opened.
- **Click_Status**: Whether the campaign was clicked.
- **Conversion_Status**: Whether the recipient converted.
- **Engagement_Time**: Time taken for engagement (in seconds).
- **Sent_Timestamp**: Timestamp of when the campaign was sent.
- **Opened_Timestamp**: Timestamp of when the campaign was opened.
- **Clicked_Timestamp**: Timestamp of when the campaign was clicked.
- **Converted_Timestamp**: Timestamp of when the recipient converted.
- **Recipient_Age**: Age of the recipient.
- **Recipient_Gender**: Gender of the recipient.
- **Recipient_Location**: Location of the recipient.
- **Click_Through_Rate**: Calculated as clicks/delivered.
- **Conversion_Rate**: Calculated as conversions/delivered.

---

## SQL Insights

### 1. Overall Conversion Rate
**Query**:
```sql
SELECT ROUND(SUM(CASE WHEN conversion_status = 'Converted' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Conversion_rate
FROM CRM_Campaign_Data;
```
**Insight**: The overall conversion rate is **48.00%**.

---

### 2. Click-Through Rate by Campaign Type
**Query**:
```sql
SELECT campaign_type,
    ROUND(SUM(CASE WHEN click_status = 'Clicked' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Click_Through_Rate
FROM CRM_Campaign_Data
GROUP BY campaign_type;
```
**Insights**:
- Email: **48.00%**
- SMS: **54.00%**
- Push Notification: **52.00%**

---

### 3. Top Performing Locations
**Query**:
```sql
SELECT recipient_location,
    ROUND(SUM(CASE WHEN conversion_status = 'Converted' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Conversion_rate
FROM CRM_Campaign_Data
GROUP BY recipient_location
ORDER BY Conversion_rate DESC
LIMIT 5;
```
**Insights**:
- Miami: **60.00%**
- Houston: **50.00%**
- Chicago: **49.00%**
- Los Angeles: **48.00%**
- New York: **41.00%**

---

### 4. Conversion Rate by Campaign Type
**Query**:
```sql
SELECT campaign_type,
    ROUND(SUM(CASE WHEN conversion_status = 'Converted' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Conversion_rate
FROM CRM_Campaign_Data
GROUP BY campaign_type;
```
**Insight**: SMS campaigns have the highest conversion rate at **54.00%**.

---

### 5. Conversion Rate by Campaign Type and Location
**Query**:
```sql
SELECT campaign_type, recipient_location,
    ROUND(SUM(CASE WHEN conversion_status = 'Converted' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Conversion_rate
FROM CRM_Campaign_Data
GROUP BY campaign_type, recipient_location;
```
**Insight**: Specific campaign types perform better in certain locations, e.g., SMS campaigns perform exceptionally well in Miami.

---

## Tableau Dashboard Insights
1. **Conversion Rate by Campaign Type**:
   - SMS campaigns outperform Email and Push Notifications in terms of conversion rate.

2. **Conversion Rate by Location and Campaign Type**:
   - Miami has the highest conversion rate across all campaign types.
   - Email campaigns perform better in Los Angeles and Chicago compared to other locations.

3. **Click-Through Rate by Campaign Type**:
   - SMS campaigns have the highest average click-through rate, closely followed by Push Notifications.

4. **Top Performing Locations**:
   - Locations like Miami and Houston consistently show better performance across different metrics.

---

## Repository Structure
- **SQL Scripts**: Contains all SQL queries used for deriving insights.
- **Dataset**: `final_data.csv` (processed data mimicking Braze CRM output).
- **Tableau Dashboard**: `.twbx` file for interactive visualizations.
- **README.md**: Detailed explanation of the project.

---

## Screenshots
![Tableau Dashboard Screenshot](Dashboard_Screenshot.png)

---

This project demonstrates how CRM data can be analyzed and visualized to drive actionable insights, improve marketing strategies, and enhance campaign performance.
