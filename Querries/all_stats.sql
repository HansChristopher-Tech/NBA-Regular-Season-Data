-- BEST Shooting Seasons in NBA History?
WITH stats AS (
    SELECT DISTINCT
        basics.*,
        advance.per,
        advance.ts_percent,
        advance.x3p_ar,
        advance.f_tr,
        advance.orb_percent,
        advance.drb_percent,
        advance.trb_percent,
        advance.ast_percent,
        advance.stl_percent,
        advance.blk_percent,
        advance.tov_percent,
        advance.usg_percent,
        advance.ows,
        advance.dws,
        advance.ws,
        advance.ws_48,
        advance.obpm,
        advance.dbpm,
        advance.bpm,
        advance.vorp
    FROM nba_player_advanced_stats AS advance
    JOIN nba_player_stats AS basics
        ON basics.player_id = advance.player_id
        AND basics.season = advance.season
        AND basics.team = advance.team
)
SELECT
    player,
    season,
    x3p_per_game AS makes,
    x3pa_per_game AS attempts,
    x3p_percent AS percent,
    x3p_ar AS attempt_rate,
    ts_percent as true_shooting
FROM stats
WHERE 
    x3pa_per_game > 4 
    AND mp_per_game > 30
    AND g > 42
ORDER BY makes DESC
LIMIT 10

-- Who have the greatest Offensive Season in NBA History
WITH stats AS (
    SELECT DISTINCT
        basics.*,
        advance.per,
        advance.ts_percent,
        advance.x3p_ar,
        advance.f_tr,
        advance.orb_percent,
        advance.drb_percent,
        advance.trb_percent,
        advance.ast_percent,
        advance.stl_percent,
        advance.blk_percent,
        advance.tov_percent,
        advance.usg_percent,
        advance.ows,
        advance.dws,
        advance.ws,
        advance.ws_48,
        advance.obpm,
        advance.dbpm,
        advance.bpm,
        advance.vorp
    FROM nba_player_advanced_stats AS advance
    JOIN nba_player_stats AS basics
        ON basics.player_id = advance.player_id
        AND basics.season = advance.season
        AND basics.team = advance.team
)
SELECT
    player,
    season,
    pts_per_game AS points,
    ast_per_game AS assists,
    (fga_per_game * fg_percent) AS field_goals,
    ft_per_game AS free_throws,
    x3p_per_game AS "3PTs",
    per,
    ts_percent AS true_shooting,
    ws AS win_shares,
    bpm AS box_plus_minus
FROM stats 
WHERE mp_per_game > 35 
  AND g > 42
ORDER BY ws DESC
LIMIT 10;

--- Who have the greatest Defensive Season in NBA History
WITH stats AS (
    SELECT DISTINCT
        basics.*,
        advance.per,
        advance.ts_percent,
        advance.x3p_ar,
        advance.f_tr,
        advance.orb_percent,
        advance.drb_percent,
        advance.trb_percent,
        advance.ast_percent,
        advance.stl_percent,
        advance.blk_percent,
        advance.tov_percent,
        advance.usg_percent,
        advance.ows,
        advance.dws,
        advance.ws,
        advance.ws_48,
        advance.obpm,
        advance.dbpm,
        advance.bpm,
        advance.vorp
    FROM nba_player_advanced_stats AS advance
    JOIN nba_player_stats AS basics
        ON basics.player_id = advance.player_id
        AND basics.season = advance.season
        AND basics.team = advance.team
)
SELECT
    player,
    season,
    stl_per_game AS steals,
    blk_per_game AS blocks,
    trb_per_game AS total_rebounds,
    stl_percent,
    blk_percent,
    trb_percent,
    dws AS def_win_shares,
    dbpm AS def_box_plus_minus
FROM stats
WHERE mp_per_game > 25
  AND g > 42
ORDER BY dws DESC
LIMIT 10;

