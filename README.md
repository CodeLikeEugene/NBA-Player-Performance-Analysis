# 🏀 NBA Player Performance Analysis: Who's the Real MVP?

https://img.shields.io/badge/SQL-Analysis-blue
https://img.shields.io/badge/MySQL-Database-orange
https://img.shields.io/badge/Sports-Analytics-green
https://img.shields.io/badge/Data-Analytics-purple

## 📌 Project Overview

Basketball discussions are often driven by narratives, opinions, and traditional box-score statistics. This project leverages data analytics to evaluate player performance more objectively.

Using NBA player statistics spanning the **1996–97 through 2022–23 seasons**, this analysis explores player dominance, franchise excellence, player development, efficiency trends, and MVP value through advanced SQL techniques.

The goal was to move beyond surface-level statistics and uncover meaningful insights that explain how elite players and organizations separate themselves from the rest of the league.

---

## 🎯 Business Questions

The project was designed to answer the following questions:

### Player Performance
- Who led the NBA in scoring each season?
- Who led the NBA in rebounding each season?
- Who led the NBA in assists each season?

### Player Development
- Which players improved the most year-over-year?
- How do rookie contributions compare to veteran contributions?

### League Trends
- Do high-volume scorers sacrifice efficiency?
- How has the physical profile of NBA players evolved over time?

### Franchise Analysis
- Which teams consistently produce elite performers?

### Advanced Analytics
- Who is the real MVP when performance is evaluated using a weighted scoring model?
- What would a data-driven NBA Dream Team look like?

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|--------|--------|
| MySQL | Data analysis and querying |
| SQL | Data exploration and transformation |
| Window Functions | Ranking and trend analysis |
| Common Table Expressions (CTEs) | Query organization |
| GitHub | Documentation and version control |
| Excel / Power BI | Data visualization (optional) |

---

## 🧠 SQL Skills Demonstrated

This project demonstrates proficiency in:

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- LAG()
- Aggregate Functions
- GROUP BY
- CASE Statements
- Subqueries
- Data Storytelling
- Trend Analysis
- Metric Development

---

# 📊 Analytical Process

## 1. Data Exploration

The dataset was explored to understand:

- Player demographics
- Team affiliations
- Physical attributes
- Performance metrics
- Efficiency statistics

This phase established which variables would be used to answer the business questions.

---

## 2. Data Preparation

Several transformations were performed:

- Extracting season years from text-based season fields
- Creating decade classifications
- Defining rookie and veteran groups
- Building weighted performance metrics
- Preparing data for ranking analysis

---

## 3. Performance Analysis

Window functions were used to rank players within each season based on:

- Points Per Game (PPG)
- Rebounds Per Game (RPG)
- Assists Per Game (APG)

This allowed league leaders to be identified consistently across nearly three decades.

---

## 4. Comparative Analysis

Players and teams were compared across:

- Usage groups
- Experience levels
- Seasons
- Decades
- Franchises

The goal was to uncover trends that would not be immediately visible through descriptive statistics alone.

---

# 🔍 Key Findings

---

## 🏆 Generational Players Dominate Scoring Titles

Seasonal scoring analysis revealed that offensive dominance is heavily concentrated among a small group of players.

Notable scoring leaders included:

- Michael Jordan
- Allen Iverson
- Kobe Bryant
- Kevin Durant
- James Harden
- Joel Embiid

### Highlight

James Harden recorded the highest scoring average in the dataset:

**36.1 Points Per Game (2018–19 Season)**

### Insight

Elite scoring is not evenly distributed throughout the league. Instead, scoring leadership is repeatedly controlled by generational offensive talents capable of sustaining excellence over multiple seasons.

---

## 📈 High Usage Does Not Reduce Efficiency

A common basketball assumption is that players who take on larger offensive workloads become less efficient.

To test this, players were grouped by offensive usage rate and compared using True Shooting Percentage.

| Usage Group | Average TS% |
|------------|------------|
| Low Usage | 53.6% |
| Medium Usage | 53.1% |
| High Usage | 53.8% |

### Insight

Contrary to popular belief, high-volume scorers maintained the highest efficiency.

The analysis found no evidence that increased offensive responsibility leads to lower shooting efficiency.

---

## 🚀 Biggest Year-Over-Year Improvements

Year-over-year scoring improvements were calculated using SQL's `LAG()` function.

### Top Five Most Improved Scorers

| Player | Improvement |
|----------|----------|
| CJ McCollum | +14.0 PPG |
| Devonte' Graham | +13.5 PPG |
| David West | +13.3 PPG |
| Zach Randolph | +11.7 PPG |
| Jason Terry | +11.6 PPG |

### Insight

Player development is often non-linear. Increased opportunities, expanded roles, and organizational investment can significantly accelerate player growth.

---

## 📉 The NBA Has Become Smaller and Lighter

Average player height and weight were compared across decades.

| Decade | Avg Height (cm) | Avg Weight (kg) |
|---------|---------|---------|
| 90s | 200.9 | 100.5 |
| 00s | 201.0 | 101.4 |
| 10s | 200.6 | 100.0 |
| 20s | 198.8 | 97.8 |

### Insight

Modern NBA players are slightly smaller and lighter than previous generations.

The data reflects the league's transition toward:

- Pace
- Spacing
- Versatility
- Perimeter-oriented play

rather than traditional size-based advantages.

---

## 🏀 Which Teams Consistently Produce Elite Players?

To evaluate franchise consistency, the top two scorers from every season were identified and team appearances were counted.

| Team | Top 2 Scorer Appearances |
|---------|---------|
| LAL | 11 |
| PHI | 9 |
| OKC | 8 |
| HOU | 6 |
| CLE | 3 |

### Insight

The Los Angeles Lakers have been the most consistent producer of elite offensive talent in the dataset.

Their repeated appearances among the league's top scorers suggest sustained excellence in attracting and developing superstar players.

---

## 👴 Veterans Outperform Rookies

Players were grouped as:

- Rookie (Age ≤ 22)
- Veteran (Age ≥ 30)

### Results

| Group | PPG | RPG | APG |
|---------|---------|---------|---------|
| Rookie | 7.75 | 3.40 | 1.56 |
| Veteran | 8.05 | 3.61 | 2.02 |

### Insight

Veteran players outperformed rookies across all major performance categories.

Experience remains one of the strongest contributors to overall player productivity and game impact.

---

## 👑 Data MVP: Luka Dončić

A custom MVP model was developed to measure overall offensive impact.

### MVP Formula

```text
40% Points Per Game

30% Rebounds + Assists

30% True Shooting Percentage
```

### Result

| Player | Team | MVP Score |
|----------|----------|----------|
| Luka Dončić | DAL | 18.12 |

### Insight

Luka's combination of scoring, rebounding, playmaking, and efficiency produced the strongest overall player profile during the 2022–23 season.

---

# 🌟 Data-Driven Dream Team

Positional information was unavailable in the dataset.

Instead, a role-based Dream Team was constructed using statistical specialties.

| Role | Player |
|----------|----------|
| Best Scorer | Luka Dončić |
| Best Rebounder | Dennis Rodman |
| Best Playmaker | Chris Paul |
| Most Efficient Shooter | Jordan Sibert |
| Data MVP | LeBron James |

### Methodology

To ensure a unique roster, players selected for one category were removed from consideration for subsequent categories.

---

# 💡 Recommendations

Based on the analysis:

### For Teams

- Continue investing in player development programs.
- Identify opportunities for role expansion among emerging players.
- Avoid assuming increased usage leads to reduced efficiency.

### For Analysts

Future models should incorporate:

- Defensive metrics
- Win Shares
- Player Efficiency Rating (PER)
- Box Plus Minus (BPM)
- Playoff performance metrics
- Advanced impact statistics

to provide a more complete evaluation of player value.

---

# 📂 Repository Structure

```text
NBA-Player-Performance-Analysis/

│
├── Dataset/
│   └── all_seasons.csv
│
├── SQL/
│   ├── 01_season_leaders.sql
│   ├── 02_usage_vs_efficiency.sql
│   ├── 03_most_improved_players.sql
│   ├── 04_era_analysis.sql
│   ├── 05_top_franchises.sql
│   ├── 06_rookies_vs_veterans.sql
│   ├── 07_data_mvp.sql
│   └── 08_dream_team.sql
│
├── Reports/
│   └── NBA_Portfolio_Report.docx
│
├── Visualizations/
│   ├── top_franchises.png
│   ├── rookie_vs_veteran.png
│   ├── usage_vs_efficiency.png
│   └── player_size_by_decade.png
│
└── README.md
```

---

# ✅ Project Outcome

This project demonstrates the use of SQL to solve real-world analytical questions in sports.

By combining data exploration, ranking techniques, trend analysis, custom metric development, and storytelling, the analysis transformed nearly three decades of NBA data into actionable insights.

The findings challenge common assumptions, highlight long-term franchise excellence, identify player development trends, and provide a data-driven perspective on player value.

---

## Skills Demonstrated

**SQL • MySQL • Data Analysis • Data Storytelling • Window Functions • CTEs • Business Intelligence • Sports Analytics • Trend Analysis • Performance Analytics**
