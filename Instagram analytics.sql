use ig_clone;

show tables;

select * from comments;
select * from follows;
select * from likes;
select * from photo_tags;
select * from photos;
select * from tags;
select * from users;


# A) Marketing: 

# 1. Find the 5 oldest users of the Instagram from the database provided
SELECT 
    *
FROM
    users
ORDER BY created_at ASC
LIMIT 5;




# 2. Find the users who have never posted a single photo on Instagram

SELECT 
    id, username
FROM
    users
WHERE
    id NOT IN (SELECT DISTINCT
            user_id
        FROM
            photos);



# 3. Declaring Contest Winner: The team started a contest and the user 
#	who gets the most likes on a single photo will win the contest 
#	now they wish to declare the winner.

#Your Task: Identify the winner of the contest and 
#			provide their details to the team


SELECT u.id, u.username, p.id AS photo_id, COUNT(l.user_id) AS total_likes
FROM users u
INNER JOIN photos p ON u.id = p.user_id
INNER JOIN likes l ON p.id = l.photo_id
GROUP BY u.id, u.username, p.id
ORDER BY total_likes DESC
LIMIT 1;




# 4. Hashtag Researching: A partner brand wants to know, 
#	which hashtags to use in the post to reach the most people on the platform.

#Your Task: Identify and suggest the top 5 most commonly
#           used hashtags on the platform


SELECT t.tag_name, COUNT(t.tag_name) AS tags_count
FROM tags t
JOIN photo_tags p ON t.id = p.tag_id
GROUP BY tag_name
ORDER BY tags_count DESC
LIMIT 5;



# 5. Launch AD Campaign: The team wants to know,
#	 which day would be the best day to launch ADs.

# Your Task: What day of the week do most users register on? 
#			Provide insights on when to schedule an ad campaign


SELECT DAYNAME(created_at) AS registration_day, COUNT(*) AS registration_count
FROM users
GROUP BY registration_day
ORDER BY registration_count DESC
LIMIT 2;



select * from comments;
select * from follows;
select * from likes;
select * from photo_tags;
select * from photos;
select * from tags;
select * from users;

# B) Investor Metrics:

# 1. User Engagement: Are users still as active and post on Instagram
#		  or they are making fewer posts

#Your Task: Provide how many times does average user posts on Instagram. Also,
# 			provide the total number of photos on Instagram/total number of users

SELECT 
    COUNT(image_url) AS total_photos,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(image_url) / COUNT(DISTINCT user_id) AS average_photos_per_user
FROM
    photos;



# Bots & Fake Accounts: The investors want to know if the platform
 #		is crowded with fake and dummy accounts
 
# Your Task: Provide data on users (bots) who have liked every single photo
#			 on the site (since any normal user would not be able to do this).

SELECT user_id FROM likes
GROUP BY user_id
HAVING COUNT(DISTINCT photo_id) = (
    SELECT COUNT(*) FROM photos);



