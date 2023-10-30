
CREATE DATABASE SharkTankIndia;

Use SharkTankIndia;

-- Tables 'deals' and 'presenters' imported with [Table Data Import Wizard]

-- view 'deals' table

SELECT * 
FROM deals;

-- view 'presenters' table

SELECT *
FROM presenters;

-- make a new table 'sti_data' by joining deals and presenters table
Drop table sti_data;
CREATE TABLE sti_data AS
SELECT d.*,
		p.no_of_presenters, p.male_presenter, p.female_presenter
        FROM deals d
        join presenters p
        on d.pitch_no = p.pitch_no;

SELECT *
FROM sti_data;
		
-- breaking down deal column into other columns so that data is more easy to understand 

ALTER TABLE sti_data
ADD deal_amount text;

ALTER TABLE sti_data
ADD deal_equity text;

ALTER TABLE sti_data
ADD deal_debt text;

SELECT *
FROM sti_data;

-- Extract deal Amount from deal columns to deal_amount column

SET SQL_SAFE_UPDATES = 0;

UPDATE sti_data
SET deal_amount = SUBSTRING_INDEX(deal, 'for', 1)
WHERE deal like '%equity%';

UPDATE sti_data
SET deal_amount = REPLACE(
						REPLACE(
							REPLACE(
								REPLACE(
									REPLACE(deal_amount,
                                    ' Lakhs',''),
                                    ' lakhs',''),
                                    ' lakh',''),
                                    ' crore', '00'),
                                    ' Crore','00');
                                    
SELECT *
FROM sti_data;

 -- Extract Deal Equity from deal column to deal_equity column
 
UPDATE sti_data
SET deal_equity = SUBSTRING_INDEX(
								SUBSTRING_INDEX(deal,
                                "%", 1),
                                " " ,-1)
WHERE deal like '%quity%';

SELECT *
FROM sti_data;

-- Extract Deal Debt from deal column to deal_debt column

UPDATE sti_data
SET deal_debt = SUBSTRING_INDEX(
							SUBSTRING_INDEX(
								SUBSTRING_INDEX(LOWER(deal),
                                'equity', -1),
                                ' ' ,-3),
                                'lakh',1)
WHERE deal like '%debt%';

SELECT *
FROM sti_data;

-- cleaning sti_data table

AlTER TABLE sti_data
drop column deal;

UPDATE sti_data
SET deal_debt = 25
where deal_debt ='â‚¹25 ';

-- replace y with 1 (True)

UPDATE sti_data
SET ashneer = CASE
		        WHEN ashneer = 'Y' THEN 1
                WHEN ashneer = 'N' THEN 0
                WHEN ashneer = 'N/A' THEN 0
END,
namita = CASE
				WHEN namita = 'Y' THEN 1
                WHEN namita = 'N' THEN 0
                WHEN namita = 'N/A' THEN 0
END,
anupam = CASE
				WHEN anupam = 'Y' THEN 1
                WHEN anupam = 'N' THEN 0
                WHEN anupam = 'N/A' THEN 0
END,
vineeta = CASE
				WHEN vineeta = 'Y' THEN 1
                WHEN vineeta = 'N' THEN 0
                WHEN vineeta = 'N/A' THEN 0
END,
aman = CASE
				WHEN aman = 'Y' THEN 1
                WHEN aman = 'N' THEN 0
                WHEN aman = 'N/A' THEN 0
END,
peyush = CASE
				WHEN peyush = 'Y' THEN 1
                WHEN peyush = 'N' THEN 0
                WHEN peyush = 'N/A' THEN 0
END,
ghazal = CASE
				WHEN ghazal = 'Y' THEN 1
                WHEN ghazal = 'N' THEN 0
                WHEN ghazal = 'N/A' THEN 0
END;
    
SELECT*
FROM sti_data;

-- Fill null values with 0

UPDATE sti_data
Set deal_amount = 0 
WHERE deal_amount is null; 

UPDATE sti_data
Set deal_equity = 0 
WHERE deal_equity is null;

UPDATE sti_data
Set deal_debt = 0 
WHERE deal_debt is null;				

SELECT *
FROM sti_data;

-- Trim columns we extracted from deal column

UPDATE sti_data
SET deal_amount = trim(deal_amount);

UPDATE sti_data
SET deal_equity = trim(deal_equity);

UPDATE sti_data
SET deal_debt = trim(deal_debt);

-- Change data types

ALTER TABLE sti_data
MODIFY COLUMN ashneer INT;

ALTER TABLE sti_data
MODIFY COLUMN namita INT;

ALTER TABLE sti_data
MODIFY COLUMN anupam INT;

ALTER TABLE sti_data
MODIFY COLUMN vineeta INT;

ALTER TABLE sti_data
MODIFY COLUMN aman INT;

ALTER TABLE sti_data
MODIFY COLUMN peyush INT;

ALTER TABLE sti_data
MODIFY COLUMN ghazal INT;

ALTER TABLE sti_data
MODIFY COLUMN deal_amount FLOAT;

ALTER TABLE sti_data
MODIFY COLUMN deal_equity FLOAT;

ALTER TABLE sti_data
MODIFY COLUMN deal_debt FLOAT;

SHOW COLUMNS from sti_data;

