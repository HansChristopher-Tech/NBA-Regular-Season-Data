import pandas as pd

# Import the file
df = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\team_summaries\team_summaries.csv")

#give league average a proper abbreviation of NBA_AVE
df.loc[df["team"] == "League Average", "abbreviation"] = "NBA_AVE"
df = df.drop(columns=["Unnamed: 0"])

#Save CSV's
df.to_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\cleaned_data_Sets\team_summaries\team_summaries.csv", index = False)
print(df.info())