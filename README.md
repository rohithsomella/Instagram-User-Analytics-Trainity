# Instagram-User-Analytics-Trainity


![INSTAGRAM user analytics](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/c4fc526d-93c5-4fcb-a221-f2ce64748cd7)


## Project Description:
This project aims to analyse various aspects of user behaviour and engagement on the Instagram platform. The goal is to provide insights into user activity, identify patterns, and uncover any potential issues, such as the presence of fake accounts. By analysing data from the database, Aim is to gain a deeper understanding of user engagement and provide valuable insights to the leadership team.

## Approach:
To conduct this analysis, I have utilized an SQL database containing tables for users, photos, likes, comments, and tags. I wrote SQL queries to extract relevant data and performed various analyses to derive insights. The queries involved joining tables, aggregating data, and applying logical conditions to filter the results. The findings were then used to draw conclusions and make informed decisions.

## Tech-Stack Used:
•	SQL Database: Used to store and organize the Instagram data.

•	MySQL: Utilized as the database management system to query and manipulate the data.

## Insights:
•	User Engagement Patterns: Analysing user activity revealed peak engagement hours, popular posting times, and trends in user behaviour. This information can be used to optimize content scheduling and maximize user reach.

•	Most Commonly Used Hashtags: Identified the top 5 hashtags frequently used by users, providing valuable information for content strategy and ad campaigns. These hashtags can be leveraged to increase visibility and target relevant audiences.

•	Average User Posting Frequency: Calculated the average number of posts per user, indicating the level of user activity on the platform. This insight helps understand user behaviour and identify highly active or less engaged users.

•	Detection of Potentially Fake Accounts: Identified users who have liked every single photo on the site, indicating the presence of potential bots or fake accounts. This finding helps in identifying and addressing potential issues related to platform integrity.

## Result:
Through this project, I have gained valuable insights into user behaviour, engagement patterns, and the presence of potential fake accounts on Instagram. The analysis provides actionable information for the leadership team to make data-driven decisions, improve user experience, and enhance platform integrity. The findings have helped us better understand the user activity, optimize strategies for content creation and ad campaigns, and address stakeholder concerns regarding fake accounts.

# Analysis Using SQL


A) Marketing: The marketing team wants to launch some campaigns, and they need your help with the following
1.	Rewarding Most Loyal Users: People who have been using the platform for the longest time.
Your Task: Find the 5 oldest users of the Instagram from the database provided

`SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;`

 ![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/4c0f104b-5f93-428f-a73c-d61f3b4fbab2)


Here are the Top oldest users of the Instagram.


2.	Remind Inactive Users to Start Posting: By sending them promotional emails to post their 1st photo.
Your Task: Find the users who have never posted a single photo on Instagram


`SELECT id, username FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM photos);`

 ![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/cacd19d6-aaa5-48ed-a2d4-5308b6fd9123)


These are the list of users who have never posted a single photo on Instagram.

3.	Declaring Contest Winner: The team started a contest and the user who gets the most likes on a single photo will win the contest now they wish to declare the winner.
Your Task: Identify the winner of the contest and provide their details to the team


`SELECT u.id, u.username, p.id AS photo_id, COUNT(l.user_id) AS total_likes
FROM users u
INNER JOIN photos p ON u.id = p.user_id
INNER JOIN likes l ON p.id = l.photo_id
GROUP BY u.id, u.username, p.id
ORDER BY total_likes DESC
LIMIT 1;`

 ![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/5d48843a-f46a-405d-8c4c-365fafabccb1)


Here is the Winner of the Contest with 48 total likes and 5 likes difference with other user.

4.	Hashtag Researching: A partner brand wants to know, which hashtags to use in the post to reach the most people on the platform.
Your Task: Identify and suggest the top 5 most commonly used hashtags on the platform


`SELECT t.tag_name, COUNT(t.tag_name) AS tags_count
FROM tags t
JOIN photo_tags p ON t.id = p.tag_id
GROUP BY tag_name
ORDER BY tags_count DESC
LIMIT 5;`  

 ![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/551e4768-83c7-4240-8ad1-1857be5d7ce1)

These are the top 5 most commonly used hashtags.


5.	Launch AD Campaign: The team wants to know, which day would be the best day to launch ADs.
Your Task: What day of the week do most users register on? Provide insights on when to schedule an ad campaign

`SELECT DAYNAME(created_at) AS registration_day, COUNT(*) AS registration_count
FROM users
GROUP BY registration_day
ORDER BY registration_count DESC
LIMIT 2;`

 ![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/70fd41eb-5ae8-4f72-a979-909e783dd0c4)

As the data suggest any of these two days can be the best to launch Ads to get maximum reach.


B) Investor Metrics: Our investors want to know if Instagram is performing well and is not becoming redundant like Facebook, they want to assess the app on the following grounds
1.	User Engagement: Are users still as active and post on Instagram or they are making fewer posts
Your Task: Provide how many times does average user posts on Instagram. Also, provide the total number of photos on Instagram/total number of users

`SELECT 
    COUNT(image_url) AS total_photos,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(image_url) / COUNT(DISTINCT user_id) AS average_photos_per_user
FROM photos;`

 ![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/c106baa3-60fb-4756-b041-95ffec03ed05)

This the result of an average number of a user post on Instagram.

2.	Bots & Fake Accounts: The investors want to know if the platform is crowded with fake and dummy accounts
Your Task: Provide data on users (bots) who have liked every single photo on the site (since any normal user would not be able to do this).


`SELECT user_id FROM likes
GROUP BY user_id
HAVING COUNT(DISTINCT photo_id) = (
    SELECT COUNT(*) FROM photos);`
 
![image](https://github.com/rohithsomella/Instagram-User-Analytics-Trainity/assets/141708838/8c9f7f40-c9fd-4a80-a8ed-f1e8cc7f99b4)

These are the user id’s of the bots account or bots users.




