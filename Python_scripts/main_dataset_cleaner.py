import pandas as pd
import os

#Set-Up
os.system("cls" if os.name == "nt" else "clear")


#Import dataframe
df_awards = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\datasets\Player Award Shares.csv")
df_team_summaries = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\datasets\Team Summaries.csv")
df_all_star = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\datasets\All-Star Selections.csv")
df_player_per_game = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\datasets\Player Per Game.csv")
df_advanced = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\datasets\Advanced.csv")

#Get Only Players Who Won Awards MVP, DPOY, Etc
df_awards = df_awards[df_awards["winner"] == True]

#Remove NA's
df_team_summaries = df_team_summaries.replace("NA", 0)
df_team_summaries = df_team_summaries.fillna(0)
df_advanced = df_advanced.replace("NA", 0)
df_advanced= df_advanced.fillna(0)
df_player_per_game = df_player_per_game.replace("NA", 0)
df_player_per_game = df_player_per_game.fillna(0)

#Drop Columns 
df_all_star.drop(columns=["team", "lg", "replaced"], inplace=True)
df_awards.drop(columns=["winner"], inplace=True)

#For Team Summaries Create Another Boolean Column that checks if team won a ring or not
nba_champions = [
    "Oklahoma City Thunder",  # 2024-25
    "Boston Celtics",         # 2023-24
    "Denver Nuggets",         # 2022-23
    "Golden State Warriors",  # 2021-22
    "Milwaukee Bucks",        # 2020-21
    "Los Angeles Lakers",     # 2019-20
    "Toronto Raptors",        # 2018-19
    "Golden State Warriors",  # 2017-18
    "Golden State Warriors",  # 2016-17
    "Cleveland Cavaliers",    # 2015-16
    "Golden State Warriors",  # 2014-15
    "San Antonio Spurs",      # 2013-14
    "Miami Heat",             # 2012-13
    "Miami Heat",             # 2011-12
    "Dallas Mavericks",       # 2010-11
    "Los Angeles Lakers",     # 2009-10
    "Los Angeles Lakers",     # 2008-09
    "Boston Celtics",         # 2007-08
    "San Antonio Spurs",      # 2006-07
    "Miami Heat",             # 2005-06
    "San Antonio Spurs",      # 2004-05
    "Detroit Pistons",        # 2003-04
    "San Antonio Spurs",      # 2002-03
    "Los Angeles Lakers",     # 2001-02
    "Los Angeles Lakers",     # 2000-01
    "Los Angeles Lakers",     # 1999-00
    "San Antonio Spurs",      # 1998-99
    "Chicago Bulls",          # 1997-98
    "Chicago Bulls",          # 1996-97
    "Chicago Bulls",          # 1995-96
    "Houston Rockets",        # 1994-95
    "Houston Rockets",        # 1993-94
    "Chicago Bulls",          # 1992-93
    "Chicago Bulls",          # 1991-92
    "Chicago Bulls",          # 1990-91
    "Detroit Pistons",        # 1989-90
    "Detroit Pistons",        # 1988-89
    "Los Angeles Lakers",     # 1987-88
    "Los Angeles Lakers",     # 1986-87
    "Boston Celtics",         # 1985-86
    "Los Angeles Lakers",     # 1984-85
    "Boston Celtics",         # 1983-84
    "Philadelphia 76ers",     # 1982-83
    "Los Angeles Lakers",     # 1981-82
    "Boston Celtics",         # 1980-81
    "Los Angeles Lakers",     # 1979-80
    "Seattle SuperSonics",    # 1978-79
    "Washington Bullets",     # 1977-78
    "Portland Trail Blazers", # 1976-77
    "Boston Celtics",         # 1975-76
    "Golden State Warriors",  # 1974-75
    "Boston Celtics",         # 1973-74
    "New York Knicks",        # 1972-73
    "Los Angeles Lakers",     # 1971-72
    "Milwaukee Bucks",        # 1970-71
    "New York Knicks",        # 1969-70
    "Boston Celtics",         # 1968-69
    "Boston Celtics",         # 1967-68
    "Philadelphia 76ers",     # 1966-67
    "Boston Celtics",         # 1965-66
    "Boston Celtics",         # 1964-65
    "Boston Celtics",         # 1963-64
    "Boston Celtics",         # 1962-63
    "Boston Celtics",         # 1961-62
    "Boston Celtics",         # 1960-61
    "Boston Celtics",         # 1959-60
    "Boston Celtics",         # 1958-59
    "St. Louis Hawks",        # 1957-58
    "Boston Celtics",         # 1956-57
    "Philadelphia Warriors",  # 1955-56
    "Syracuse Nationals",     # 1954-55
    "Minneapolis Lakers",     # 1953-54
    "Minneapolis Lakers",     # 1952-53
    "Minneapolis Lakers",     # 1951-52
    "Rochester Royals",       # 1950-51
    "Minneapolis Lakers",     # 1949-50
    "Minneapolis Lakers",     # 1948-49
    "Baltimore Bullets",      # 1947-48
    "Philadelphia Warriors"   # 1946-47
]
date = list(range(2025, 1946, -1))
champ_dict = dict(zip(date, nba_champions))
df_team_summaries["Champions"] = (
    df_team_summaries["team"].str.strip().str.upper()
    == df_team_summaries["season"].map(champ_dict).str.upper()
)

#Arrange the columns
col = df_team_summaries.pop("Champions")  
insert_at = df_team_summaries.columns.get_loc("playoffs")  
df_team_summaries.insert(insert_at+1, "Champions", col)

#Drop Columns
df_team_summaries.drop(columns=["arena", "attend", "attend_g"], inplace=True)

#For basic and advance stats remove player's teams for players that have been traded

#Export Dataframe
df_awards.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\main_awards.csv")
df_team_summaries.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\team_summaries.csv")
df_all_star.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\all_stars.csv")
df_player_per_game.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\basic_Stats.csv")
df_advanced.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\advanced_stats.csv")
print("CSV's Saved")