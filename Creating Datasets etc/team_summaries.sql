-- Basic stats fact table

DROP TABLE IF EXISTS nba_team_stats;

CREATE TABLE nba_team_stats (
    season INT NOT NULL,
    lg TEXT NOT NULL,
    team TEXT NOT NULL,
    abbreviation TEXT NOT NULL,
    playoffs BOOLEAN,
    champions BOOLEAN,
    age FLOAT,
    w FLOAT,
    l FLOAT,
    pw FLOAT,
    pl FLOAT,
    mov FLOAT,
    sos FLOAT,
    srs FLOAT,
    o_rtg FLOAT,
    d_rtg FLOAT,
    n_rtg FLOAT,
    pace FLOAT,
    f_tr FLOAT,
    x3p_ar FLOAT,
    ts_percent FLOAT,
    e_fg_percent FLOAT,
    tov_percent FLOAT,
    orb_percent FLOAT,
    ft_fga FLOAT,
    opp_e_fg_percent FLOAT,
    opp_tov_percent FLOAT,
    drb_percent FLOAT,
    opp_ft_fga FLOAT
);

-- Ownership 
ALTER TABLE nba_team_stats OWNER TO postgres;

-- Index
CREATE INDEX idx_nba_team_stats ON nba_team_stats (season);

 

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

\copy nba_team_stats FROM 'C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\team_summaries\team_summaries.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding
