/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy nba_player_stats FROM 'C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\award_analytics\basic_Stats.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy all_star FROM 'C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\award_analytics\all_stars.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy player_awards FROM 'C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\award_analytics\main_awards.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


*/

-- NOTE: This has been updated from the video to fix issues with encoding