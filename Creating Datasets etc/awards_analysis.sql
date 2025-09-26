-- Basic stats fact 
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
    PRIMARY KEY (player_id, season)  
);

-- All-Star appearances fact table
CREATE TABLE all_star (
    player TEXT NOT NULL,
    player_id TEXT NOT NULL,
    season INT NOT NULL,
    PRIMARY KEY (player_id, season)
);

-- Awards fact table
CREATE TABLE player_awards (
    season INT NOT NULL,
    award TEXT NOT NULL,
    player_id TEXT,
    PRIMARY KEY (player_id, season)
);

-- Assign ownership to postgres
ALTER TABLE nba_player_stats OWNER TO postgres;
ALTER TABLE all_star OWNER TO postgres;
ALTER TABLE player_awards OWNER TO postgres;

-- Optional indexes for season queries
CREATE INDEX idx_nba_season ON nba_player_stats (season);
CREATE INDEX idx_allstar_season ON all_star (season);
CREATE INDEX idx_awards_season ON player_awards (season);

