--- Counts how many players have made an all - star team from 1947- 2024
SELECT
    all_star.player,
    COUNT(season) AS all_star_count
FROM all_star
GROUP BY player
ORDER BY all_star_count DESC;

-- Season by Season Highest teams with most all-stars
WITH player_season AS (
    SELECT 
        player_id,
        season,
        MAX(team) AS team
    FROM nba_player_stats
    WHERE team <> '2TM' 
    GROUP BY player_id, season
),
all_star_stats_alltime AS (
    SELECT
        a.player,
        a.season AS all_star_season,
        p.team
    FROM all_star AS a
    LEFT JOIN player_season AS p
        ON a.player_id = p.player_id AND a.season = p.season
),
all_star_counts AS (
    SELECT
        all_star_season AS season,
        team,
        COUNT(DISTINCT player) AS all_star_count
    FROM all_star_stats_alltime
    GROUP BY all_star_season, team
)
SELECT DISTINCT ON (season)
    season,
    team,
    all_star_count
FROM all_star_counts
WHERE team IS NOT NULL
ORDER BY season DESC, all_star_count DESC;

--- Find Average pts,reb,assist of all stars
WITH all_stats AS (
    SELECT DISTINCT
        a.player,
        a.season AS all_star_season,
        p.team,
        p.pos,
        p.pts_per_game,
        p.trb_per_game,
        p.ast_per_game
    FROM all_star a
    LEFT JOIN nba_player_stats p
        ON a.player_id = p.player_id AND a.season = p.season
    WHERE p.team <> '2TM'
)

SELECT
    AVG(pts_per_game) AS avg_points,
    AVG(trb_per_game) AS avg_rebounds,
    AVG(ast_per_game) AS avg_assists
FROM all_stats;
