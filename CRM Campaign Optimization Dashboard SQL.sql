CREATE TABLE CRM_Campaign_Data (
	Campaign_Name VARCHAR(100),
	Campaign_Type VARCHAR(50),
    Recipient_ID INT,         
    Delivery_Status VARCHAR(20),    
    Open_Status VARCHAR(20),        
    Click_Status  VARCHAR(20),        
    Conversion_Status VARCHAR(20),   
    Engagement_Time INT,     
    Sent_Timestamp TIMESTAMP,      
    Opened_Timestamp TIMESTAMP,    
    Clicked_Timestamp TIMESTAMP,   
    Converted_Timestamp TIMESTAMP, 
    Recipient_Age INT,       
    Recipient_Gender VARCHAR(20),    
    Recipient_Location VARCHAR(50),  
    Click_Through_Rate FLOAT
		
);



SELECT * FROM CRM_Campaign_Data

ALTER TABLE CRM_Campaign_Data
ALTER COLUMN Converted_Timestamp TYPE VARCHAR(255);

ALTER TABLE CRM_Campaign_Data
ALTER COLUMN Opened_Timestamp TYPE VARCHAR(255);

ALTER TABLE CRM_Campaign_Data
ALTER COLUMN Clicked_Timestamp TYPE VARCHAR(255);


COPY CRM_Campaign_Data
FROM 'C:/Drive(D)/CRM Campaign Optimization Dashboard/processed_crm_data.csv'
DELIMITER ','
CSV HEADER 


-- 1.Overall Conversion Rate:


SELECT ROUND(SUM
		(CASE WHEN conversion_status = 'Converted' THEN 1 ELSE 0 END)* 100 / COUNT(*) ,2) 
			AS Conversion_rate 
	FROM CRM_Campaign_Data

-- INSIGHTS = Overall Conversion Rate : 48.00



	

-- 2.Click-Through Rate by Campaign Type:

SELECT campaign_type,
		ROUND(SUM(CASE WHEN click_status = 'Clicked' THEN 1 ELSE 0 END) * 100 / COUNT(*) , 2) AS Click_Through_Rate
FROM CRM_Campaign_Data
GROUP BY campaign_type

-- INSIGHTS Email : 49.00 , SMS : 50.00,  Push Notification : 49.00



-- 3.Top Performing Locations

SELECT recipient_location,
		ROUND(SUM(CASE WHEN conversion_status = 'Converted' THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS Conversion_rate 
FROM CRM_Campaign_Data
GROUP BY recipient_location
ORDER BY Conversion_rate DESC
LIMIT 5;

-- INSIGHTS
-- "Miami"	- 58.00
-- "Houston"  -	54.00
-- "Chicago" - 47.00
-- "Los Angeles" - 47.00
-- "New York" -	43.00



	

