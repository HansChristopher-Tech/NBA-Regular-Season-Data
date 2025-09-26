WITH awards_list AS (
    SELECT DISTINCT
        p.player AS player,
        a.season AS season,
        a.award AS award
    FROM player_awards a
    LEFT JOIN nba_player_stats p
        ON a.player_id = p.player_id
)
-- Count total awards per player across all seasons
SELECT
    player,
    COUNT(player) AS total_awards
FROM awards_list
GROUP BY player
ORDER BY total_awards DESC

-- MVP's Stats
WITH all_stats AS (
    SELECT DISTINCT
        p.player,
        a.season,
        p.pts_per_game,
        p.trb_per_game,
        p.ast_per_game
    FROM player_awards a
    LEFT JOIN nba_player_stats p
        ON a.player_id = p.player_id AND a.season = p.season
    WHERE a.award = 'nba mvp'
)

SELECT
    AVG(pts_per_game) AS avg_points,
    AVG(trb_per_game) AS avg_rebounds,
    AVG(ast_per_game) AS avg_assists
FROM all_stats;

-- How long do nba rookie of the year winners last
WITH all_time_stats AS (
    SELECT DISTINCT
        a.player_id,
        a.season AS roy_season
    FROM player_awards a
    WHERE LOWER(a.award) = 'nba roy' AND a.season <= 2004
)

SELECT
    p.player,
    COUNT(*) AS nba_seasons
FROM nba_player_stats p
JOIN all_time_stats r
    ON p.player_id = r.player_id
GROUP BY p.player
ORDER BY nba_seasons DESC;







