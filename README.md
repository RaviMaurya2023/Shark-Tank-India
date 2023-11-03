# Data Cleaning Project in MySQL Workbench : Shark-Tank-India

Database Creation: created a database named "SharkTankIndia" and switched to it using the "USE" statement.

Data Import: Y "deals" and "presenters" tables were imported using a data import wizard.

Join Tables: Create a new table called "sti_data" by joining the "deals" and "presenters" tables using a common key, "pitch_no."

Column Splitting: added new columns for "deal_amount," "deal_equity," and "deal_debt" to break down the information from the original "deal" column.

Data Transformation: Extracted deal amounts, deal equity, and deal debt from the original "deal" column, cleaned the data, and replace "Y" with 1 and "N" with 0 in several columns.

Data Cleanup: Removed unnecessary columns and replace null values with 0 where appropriate.

Data Type Modification: Changed the data types of several columns to INT (integer) or FLOAT (floating-point number).
