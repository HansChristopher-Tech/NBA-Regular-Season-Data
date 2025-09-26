-- ========================
-- Basic stats fact table
-- ========================
DROP TABLE IF EXISTS nba_player_stats CASCADE;

CREATE TABLE nba_player_stats (
    season INT NOT NULL,
    lg TEXT NOT NULL,
    player TEXT NOT NULL,
    player_id TEXT NOT NULL,
    age INT NOT NULL,
    team TEXT NOT NULL,
    pos TEXT NOT NULL,
    g INT NOT NULL,
    gs INT NOT NULL,
    mp_per_game FLOAT NOT NULL,
    fg_per_game FLOAT NOT NULL,
    fga_per_game FLOAT NOT NULL,
    fg_percent FLOAT NOT NULL,
    x3p_per_game FLOAT NOT NULL,
    x3pa_per_game FLOAT NOT NULL,
    x3p_percent FLOAT NOT NULL,
    x2p_per_game FLOAT NOT NULL,
    x2pa_per_game FLOAT NOT NULL,
    x2p_percent FLOAT NOT NULL,
    e_fg_percent FLOAT NOT NULL,
    ft_per_game FLOAT NOT NULL,
    fta_per_game FLOAT NOT NULL,
    ft_percent FLOAT NOT NULL,
    orb_per_game FLOAT NOT NULL,
    drb_per_game FLOAT NOT NULL,
    trb_per_game FLOAT NOT NULL,
    ast_per_game FLOAT NOT NULL,
    stl_per_game FLOAT NOT NULL,
    blk_per_game FLOAT NOT NULL,
    tov_per_game FLOAT NOT NULL,
    pf_per_game FLOAT NOT NULL,
    pts_per_game FLOAT NOT NULL,
    PRIMARY KEY (player_id, season, team)
);

-- ==========================
-- Advanced stats fact table
-- ==========================
DROP TABLE IF EXISTS nba_player_advanced_stats CASCADE;

CREATE TABLE nba_player_advanced_stats (
    season INT NOT NULL,
    lg TEXT NOT NULL,
    player TEXT NOT NULL,
    player_id TEXT NOT NULL,
    age FLOAT NOT NULL,
    team TEXT NOT NULL,
    pos TEXT NOT NULL,
    g INT NOT NULL,
    gs FLOAT NOT NULL,
    mp FLOAT NOT NULL,
    per FLOAT NOT NULL,
    ts_percent FLOAT NOT NULL,
    x3p_ar FLOAT NOT NULL,
    f_tr FLOAT NOT NULL,
    orb_percent FLOAT NOT NULL,
    drb_percent FLOAT NOT NULL,
    trb_percent FLOAT NOT NULL,
    ast_percent FLOAT NOT NULL,
    stl_percent FLOAT NOT NULL,
    blk_percent FLOAT NOT NULL,
    tov_percent FLOAT NOT NULL,
    usg_percent FLOAT NOT NULL,
    ows FLOAT NOT NULL,
    dws FLOAT NOT NULL,
    ws FLOAT NOT NULL,
    ws_48 FLOAT NOT NULL,
    obpm FLOAT NOT NULL,
    dbpm FLOAT NOT NULL,
    bpm FLOAT NOT NULL,
    vorp FLOAT NOT NULL,
    PRIMARY KEY (player_id, season, team)
);

-- =================================
-- Ownership & Indexes
-- =================================
ALTER TABLE nba_player_stats OWNER TO postgres;
ALTER TABLE nba_player_advanced_stats OWNER TO postgres;

-- Fast lookups by season
CREATE INDEX idx_basic_season ON nba_player_stats (season);
CREATE INDEX idx_advanced_season ON nba_player_advanced_stats (season);
 

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

\copy nba_player_stats FROM 'C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\player_analytics\basic_Stats.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy nba_player_advanced_stats  FROM 'C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\player_analytics\advanced_stats.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding
