import pandas as pd
import matplotlib.pyplot as plt

# Import trend dataframe
df = pd.read_csv(r"C:\Users\Hans Christopher\Documents\DATA ANALYST TOOLS\SQL\NBA SQL\Output CSV's\league_trends.csv")

# Ensure season is integer
df["season"] = df["season"].astype(int)

# Pace
plt.figure(figsize=(10, 6))
plt.plot(df["season"], df["pace"], linewidth=2, color="blue")
plt.title("NBA League Pace Over Seasons", fontsize=16)
plt.xlabel("Season", fontsize=14)
plt.ylabel("Pace", fontsize=14)
plt.grid(True, linestyle="--", alpha=0.6)
plt.tight_layout()
plt.show()

# 3P Attempt Rate
plt.figure(figsize=(10, 6))
plt.plot(df["season"], df["x3p_ar"], linewidth=2, color="green")
plt.title("NBA League 3P Attempt Rate Over Seasons", fontsize=16)
plt.xlabel("Season", fontsize=14)
plt.ylabel("3P Attempt Rate", fontsize=14)
plt.grid(True, linestyle="--", alpha=0.6)
plt.tight_layout()
plt.show()



