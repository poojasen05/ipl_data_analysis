# IPL Data Analysis (2008-2024)

## Overview
This project analyzes 260,920 ball-by-ball records and 1,095 matches from the Indian Premier League (2008-2024) using **SQL** and **Python** to uncover insights about team performance, toss strategy, player rankings, and how the game has evolved over 16 seasons.

The analysis follows a complete data analytics workflow: data cleaning, SQL-based querying, exploratory data analysis (EDA), visualization, and business insight generation.

---

## Dataset
-  [matches.csv](matches.csv) — 1,095 matches (2008-2024)
- **deliveries.csv** — 260,920 ball-by-ball records
- **Source:** [IPL Complete Dataset (Kaggle)](https://www.kaggle.com/datasets/patrickb1912/ipl-complete-dataset-20082020)

---

## Business Questions Answered
1. Which team has won the most matches across IPL history?
2. Does winning the toss actually help win the match?
3. Is fielding first (chasing) a better strategy than batting first?
4. Who are the top run scorers and wicket takers of all time?
5. Which bowlers dominate in powerplay vs death overs?
6. Which venues produce the highest-scoring matches?
7. How has run-scoring evolved across seasons?

---

## Key Findings

**1. Mumbai Indians lead the all-time franchise rankings**
Mumbai Indians have won 144 matches, narrowly ahead of Chennai Super Kings (138) and Kolkata Knight Riders (131). This consistency reflects sustained core-squad retention rather than a single standout season.

**2. Fielding first after winning the toss is the stronger strategy**
Toss winners who chose to field went on to win 377 matches, compared to only 177 when they chose to bat first — roughly 68% of toss-aligned wins come from chasing. Knowing the target consistently translates into better execution under pressure.

**3. Virat Kohli and Yuzvendra Chahal are the all-time standout performers**
Kohli leads run-scoring with 8,014 runs, ahead of Dhawan (6,769) and Rohit Sharma (6,630). Chahal tops the wicket charts with 205 wickets, ahead of Chawla (192) and Bravo (183).

**4. Death-over and powerplay specialists are two different skill sets**
In death overs (16-20), Bravo (115 wickets) and Malinga (104) dominate, while in powerplay (overs 1-6), Ishant Sharma (59) and Sandeep Sharma (53) lead — almost no overlap between the two lists.

**5. Scoring has surged since the Impact Player rule**
Average runs per match rose from around 287-315 in 2009-2017 to a peak of 365.79 in 2024, with 2023 at 350.18 — roughly a 17% jump from the earlier baseline.

**6. Certain venues consistently produce high-scoring contests**
The Dr. Y.S. Rajasekhara Reddy ACA-VDCA Stadium recorded the highest average chase target (232.5), followed by the Himachal Pradesh Cricket Association Stadium (203).

---

## Conclusion
This analysis of 260,000+ ball-by-ball records across 16 IPL seasons shows that consistency, not single-season brilliance, drives franchise success — Mumbai Indians' 144 wins and CSK's 138 reflect sustained squad stability. Tactically, fielding first is the clear winning strategy, with chasing teams winning 68% of toss-aligned matches, confirming the modern T20 shift toward setting a target. At the player level, Kohli's 8,014 runs and Chahal's 205 wickets highlight rare multi-season excellence, while the near-zero overlap between death-over and powerplay wicket-takers proves bowling talent must be valued by match phase. Most notably, scoring has surged 17% since 2017 (315 to 365.79 avg runs/match by 2024), driven by the Impact Player rule and flatter pitches — meaning franchises must now prioritize death-over bowling depth and phase-specific specialists to stay competitive.

---

## Tools Used
- **Python** — pandas, matplotlib, seaborn
- **SQL** — SQLite (via Python, using `pd.read_sql_query`)
- **Jupyter Notebook** — for analysis and visualization

---

## Repository Structure
```
ipl-data-analysis/
│
├── ipl_analysis.ipynb         # Full analysis notebook (cleaning, SQL, EDA, charts, insights)
├── ipl_analysis.sql           # Standalone SQL queries with insights
├── matches.csv                # Cleaned match-level data (1,095 rows)
├── deliveries.csv             # Cleaned ball-by-ball data (260,920 rows)
├── chart1_team_wins.png       # Top 10 teams by total wins
├── chart_bat_vs_field_season.png   # Win % by toss decision per season
├── chart_season_runs_trend.png     # Average runs per match by season
└── README.md
```

---

## How to Run
1. Clone this repository
2. Open 
in Jupyter Notebook
3. Run all cells (`matches.csv` and `deliveries.csv` should be in the same folder)
4. SQL queries can also be run independently using `ipl_analysis.sql`

---

## Author
Pooja Sen
