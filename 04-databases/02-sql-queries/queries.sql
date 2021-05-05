---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
SELECT * from sites;

-- Get all sites sorted by name
SELECT * from sites ORDER BY name;

-- Gett all activity names sorted by name
SELECT * from activities ORDER BY name;

-- Get all "Sport" activities
SELECT * from activities WHERE category="Sport";

-- Get all Escape Games in Nantes
SELECT * from activities WHERE name like "%Escape%" AND city="Nantes";

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
SELECT count(*) from activities;

-- Count all "Adventure" activities
SELECT count(*) from activities WHERE category="Adventure";

-- Count the number of activities per category
SELECT category, count(*) as total from activities group by category;

-- Get the 3 category names with the biggest number of activities
SELECT category , count(*) as total from activities group by category ORDER by total DESC LIMIT 3;

---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working FROM site "Graslin", sorted by first name
SELECT * from employees
JOIN sites ON sites.id=employees.site_id
WHERE employees.site_id=2 ORDER by first_name;

-- Get all the activity names where you have been to, sorted by name
SELECT activities.name from participations
JOIN employees ON employees.id=participations.employee_id
JOIN team_building_sessions ON team_building_sessions.id=participations.team_building_session_id
JOIN activities ON activities.id=team_building_sessions.activity_id
WHERE employees.first_name="Mathilde";

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
SELECT teams.name from teams
JOIN team_building_sessions ON team_building_sessions.team_id=teams.id
JOIN activities ON activities.id=team_building_sessions.activity_id
WHERE activities.category= "Adventure"
GROUP BY teams.name;

-- Get the team names and total number of team building sessions done, sorted by top teams
SELECT teams.name, count(*) as total from team_building_sessions
JOIN teams ON teams.id = team_building_sessions.team_id
GROUP by teams.name
ORDER by total DESC;

-- Get all the employee names, team names and site names that have never attended a team building session
SELECT first_name, last_name, teams.name, sites.name from employees
JOIN sites ON sites.id=employees.site_id
JOIN teams ON teams.id=employees.team_id
LEFT OUTER JOIN participations ON participations.employee_id=employees.id
WHERE participations.id IS NULL;

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to least expensive
-- TODO: SELECT ...
-- Expected result:
-- name          total_price
-- ------------  -----------
-- Finance & RH  1620
-- Business Dev  1446
-- R&D           1140
-- Marketing     445
-- Customer Suc  360
-- Product Owne  267
-- UI / UX       240

-- Get the site names and total number of team building sessions done, sorted by top sites
-- TODO: SELECT ...
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Graslin        12
-- Paris 13ème    10
