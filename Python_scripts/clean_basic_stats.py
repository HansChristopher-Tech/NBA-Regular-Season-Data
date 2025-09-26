import pandas as pd

# Import the dataset
df_1 = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\player_analytics\basic_Stats.csv")
df_2 = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\player_analytics\advanced_stats.csv")

# Drop 2TM
df_1 = df_1[~df_1["team"].str.contains("2TM", case=False, na=False)]
df_2 = df_2[~df_2["team"].str.contains("2TM", case=False, na=False)]

# Detect duplicates
dup_mask_1 = df_1.duplicated(subset=['player_id', 'season'], keep=False)
dup_mask_2 = df_2.duplicated(subset=['player_id', 'season'], keep=False)

# First: rename duplicates
df_1.loc[dup_mask_1, 'player_id'] = df_1.loc[dup_mask_1].apply(
    lambda row: f"{row['player_id']}_{row['team']}", axis=1
)
df_2.loc[dup_mask_2, 'player_id'] = df_2.loc[dup_mask_2].apply(
    lambda row: f"{row['player_id']}_{row['team']}", axis=1
)

# Second: drop any remaining duplicates (safety)
df_1 = df_1.drop_duplicates(subset=['player_id', 'season', 'team'], keep='first')
df_2 = df_2.drop_duplicates(subset=['player_id', 'season', 'team'], keep='first')

# Save
df_1.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\player_analytics\basic_Stats.csv", index=False)
df_2.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\player_analytics\advanced_stats.csv", index=False)
