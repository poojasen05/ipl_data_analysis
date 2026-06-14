-- ============================================
-- IPL Data Analysis - SQL Queries
-- Dataset: matches.csv (950+ matches), deliveries.csv (260,000+ balls)
-- Seasons covered: 2008-2024
-- ============================================

-- Query 1: Top 10 teams by total wins
SELECT winner,
       COUNT(*) as total_wins
FROM matches
GROUP BY winner
ORDER BY total_wins DESC
LIMIT 10;

-- Insight: Mumbai Indians lead all-time with 144 wins, ahead of 
-- Chennai Super Kings (138) and Kolkata Knight Riders (131).
-- This shows MI's success comes from sustained squad consistency 
-- rather than a single dominant season.


-- Query 2: Overall toss-winner vs match-winner percentage
SELECT ROUND(
    SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
) as toss_win_pct
FROM matches;

-- Insight: Toss winners win the match only slightly more than half 
-- the time, showing toss advantage alone does not guarantee victory.


-- Query 3: Win count by toss decision (bat vs field), 
-- only counting matches where toss winner = match winner
SELECT toss_decision,
       COUNT(*) as wins
FROM matches
WHERE toss_winner = winner
GROUP BY toss_decision;

-- Insight: Fielding first produced 377 wins vs 177 for batting first.
-- This confirms fielding first (chasing) is the stronger strategy 
-- in modern T20 cricket.


-- Query 4: Top 10 run scorers of all time
SELECT batter,
       SUM(batsman_runs) as total_runs
FROM deliveries
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;

-- Insight: Virat Kohli leads all-time with 8,014 runs, ahead of 
-- Shikhar Dhawan (6,769) and Rohit Sharma (6,630).


-- Query 5: Top 10 wicket takers (excluding run outs)
SELECT bowler,
       SUM(is_wicket) as total_wickets
FROM deliveries
WHERE dismissal_kind != 'run out'
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;

-- Insight: Yuzvendra Chahal has taken the most wickets (205) 
-- excluding run outs, ahead of Piyush Chawla (192) and Dwayne Bravo (183).


-- Query 6: Top wicket takers in death overs (16-20)
SELECT bowler,
       SUM(is_wicket) as wickets
FROM deliveries
WHERE over BETWEEN 16 AND 20
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;

-- Insight: Dwayne Bravo has the most death-over wickets (115), 
-- making him the most effective death-bowling specialist historically.


-- Query 7: Top wicket takers in powerplay (overs 1-6)
SELECT bowler,
       SUM(is_wicket) as wickets
FROM deliveries
WHERE over BETWEEN 1 AND 6
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;

-- Insight: Ishant Sharma has the most powerplay wickets (59), 
-- showing almost no overlap with the death-over specialists list - 
-- proving these are two distinct bowling skill sets.


-- Query 8: Average chase target by venue (top 5 highest-scoring grounds)
SELECT venue,
       AVG(target_runs) as avg_target_runs
FROM matches
GROUP BY venue
ORDER BY avg_target_runs DESC
LIMIT 5;

-- Insight: Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium has 
-- the highest average chase target (232.5), indicating it is one of 
-- the most batting-friendly venues in the league.


-- Query 9: Average runs per match by season (JOIN query)
SELECT m.season,
       SUM(d.total_runs) as total_runs,
       COUNT(DISTINCT d.match_id) as matches,
       ROUND(SUM(d.total_runs) * 1.0 / COUNT(DISTINCT d.match_id), 2) as avg_runs_per_match
FROM deliveries d
JOIN matches m ON d.match_id = m.id
GROUP BY m.season
ORDER BY m.season;

-- Insight: Average runs per match rose from ~287-315 in 2009-2017 
-- to a peak of 365.79 in 2024 - a 17% increase, driven by the 
-- Impact Player rule and increasingly batting-friendly conditions.