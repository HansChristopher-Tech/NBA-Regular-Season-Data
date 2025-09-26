-- Stats of Champions
WITH winners AS (
    SELECT *
    FROM nba_team_stats
    WHERE champions IS TRUE
),
-- Stats of Non - Champions
losers AS (
    SELECT *
    FROM nba_team_stats
    WHERE champions IS FALSE
      AND playoffs IS TRUE
)
-- Averages of Champions 
SELECT
    'Champions' AS category,
    AVG(age) AS avg_age,
    AVG(w) AS avg_wins,
    AVG(l) AS avg_losses,
    AVG(pw) AS avg_pw,
    AVG(pl) AS avg_pl,
    AVG(mov) AS avg_mov,
    AVG(sos) AS avg_sos,
    AVG(srs) AS avg_srs,
    AVG(o_rtg) AS avg_o_rtg,
    AVG(d_rtg) AS avg_d_rtg,
    AVG(n_rtg) AS avg_n_rtg,
    AVG(pace) AS avg_pace,
    AVG(f_tr) AS avg_f_tr,
    AVG(x3p_ar) AS avg_x3p_ar,
    AVG(ts_percent) AS avg_ts_percent,
    AVG(e_fg_percent) AS avg_e_fg_percent,
    AVG(tov_percent) AS avg_tov_percent,
    AVG(orb_percent) AS avg_orb_percent,
    AVG(ft_fga) AS avg_ft_fga,
    AVG(opp_e_fg_percent) AS avg_opp_e_fg_percent,
    AVG(opp_tov_percent) AS avg_opp_tov_percent,
    AVG(drb_percent) AS avg_drb_percent,
    AVG(opp_ft_fga) AS avg_opp_ft_fga
FROM winners

UNION ALL
-- Averages of Non - Champions 
SELECT
    'Non-Champ Playoff Teams' AS category,
    AVG(age) AS avg_age,
    AVG(w) AS avg_wins,
    AVG(l) AS avg_losses,
    AVG(pw) AS avg_pw,
    AVG(pl) AS avg_pl,
    AVG(mov) AS avg_mov,
    AVG(sos) AS avg_sos,
    AVG(srs) AS avg_srs,
    AVG(o_rtg) AS avg_o_rtg,
    AVG(d_rtg) AS avg_d_rtg,
    AVG(n_rtg) AS avg_n_rtg,
    AVG(pace) AS avg_pace,
    AVG(f_tr) AS avg_f_tr,
    AVG(x3p_ar) AS avg_x3p_ar,
    AVG(ts_percent) AS avg_ts_percent,
    AVG(e_fg_percent) AS avg_e_fg_percent,
    AVG(tov_percent) AS avg_tov_percent,
    AVG(orb_percent) AS avg_orb_percent,
    AVG(ft_fga) AS avg_ft_fga,
    AVG(opp_e_fg_percent) AS avg_opp_e_fg_percent,
    AVG(opp_tov_percent) AS avg_opp_tov_percent,
    AVG(drb_percent) AS avg_drb_percent,
    AVG(opp_ft_fga) AS avg_opp_ft_fga
FROM losers;

-- Grab League Average throughout the years
SELECT
    o_rtg,
    d_rtg
FROM nba_team_stats
WHERE abbreviation = 'NBA_AVE' AND pace <> 0 AND x3p_ar <> 0 AND drb_percent <> 0



