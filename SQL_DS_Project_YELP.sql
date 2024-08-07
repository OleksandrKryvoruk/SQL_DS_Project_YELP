/*Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:*/   */

SELECT COUNT(*)
FROM table
	
/* i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key. */

SELECT COUNT(DISTINCT(key))
FROM table



/* i. Business = id: 10000
ii. Hours = business_id: 1562
iii. Category = business_id: 2643
iv. Attribute = business_id: 1115
v. Review = id:10000, business_id: 8090, user_id: 9581
vi. Checkin = business_id: 493
vii. Photo = id: 10000, business_id: 6493
viii. Tip = user_id: 537, business_id: 3979
ix. User = id: 10000
x. Friend = user_id: 11
xi. Elite_years = user_id: 2780
	

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:  */
	
		SELECT COUNT(*)
		FROM user
		WHERE id IS NULL OR 
		name IS NULL OR 
		review_count IS NULL OR 
		yelping_since IS NULL OR
		useful IS NULL OR 
		funny IS NULL OR 
		cool IS NULL OR 
		fans IS NULL OR 
		average_stars IS NULL OR 
		compliment_hot IS NULL OR 
		compliment_more IS NULL OR 
		compliment_profile IS NULL OR 
		compliment_cute IS NULL OR 
		compliment_list IS NULL OR 
		compliment_note IS NULL OR 
		compliment_plain IS NULL OR 
		compliment_cool IS NULL OR 
		compliment_funny IS NULL OR 
		compliment_writer IS NULL OR 
		compliment_photos IS NULL 

	
	

	
/* 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields: */
		
		SELECT MIN(column)
		FROM table

		SELECT MAX(column)
		FROM table

		SELECT AVG(column)
		FROM table

/* 	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1 		max: 5		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer: */
	
		SELECT city,
		SUM(review_count) AS reviews
		FROM business
		GROUP BY city
		ORDER BY reviews DESC
	
	/* Copy and Paste the Result Below:
	+-----------------+---------+
	| city            | reviews |
	+-----------------+---------+
	| Las Vegas       |   82854 |
	| Phoenix         |   34503 |
	| Toronto         |   24113 |
	| Scottsdale      |   20614 |
	| Charlotte       |   12523 |
	| Henderson       |   10871 |
	| Tempe           |   10504 |
	| Pittsburgh      |    9798 |
	| MontrÃ©al        |    9448 |
	| Chandler        |    8112 |
	| Mesa            |    6875 |
	| Gilbert         |    6380 |
	| Cleveland       |    5593 |
	| Madison         |    5265 |
	| Glendale        |    4406 |
	| Mississauga     |    3814 |
	| Edinburgh       |    2792 |
	| Peoria          |    2624 |
	| North Las Vegas |    2438 |
	| Markham         |    2352 |
	| Champaign       |    2029 |
	| Stuttgart       |    1849 |
	| Surprise        |    1520 |
	| Lakewood        |    1465 |
	| Goodyear        |    1155 |
	+-----------------+---------+

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer: */

			SELECT stars,
			SUM(review_count) AS count
			FROM business
			WHERE city == 'Avon'
			GROUP BY stars	

/* Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

			+-------+-------+
			| stars | count |
			+-------+-------+
			|   1.5 |    10 |
			|   2.5 |     6 |
			|   3.5 |    88 |
			|   4.0 |    21 |
			|   4.5 |    31 |
			|   5.0 |     3 |
			+-------+-------+	


ii. Beachwood

SQL code used to arrive at answer: */

			SELECT stars,
			SUM(review_count) AS count
			FROM business
			WHERE city == 'Beachwood'
			GROUP BY stars	

/* Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
			+-------+-------+
			| stars | count |
			+-------+-------+
			|   2.0 |     8 |
			|   2.5 |     3 |
			|   3.0 |    11 |
			|   3.5 |     6 |
			|   4.0 |    69 |
			|   4.5 |    17 |
			|   5.0 |    23 |
			+-------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer: */
	
		SELECT id, name, review_count
		FROM user
		ORDER BY review_count DESC
		LIMIT 3	
		
	/* Copy and Paste the Result Below:
		
		+------------------------+--------+--------------+
		| id                     | name   | review_count |
		+------------------------+--------+--------------+
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
		| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
		| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
		+------------------------+--------+--------------+


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
	Yes, users who posted more reviews have more fans. Yelp users may follow users who actively posting new reviews because they feel they can trust the opinion of a person whoâ€™s written literally hundreds of commentaries on local businesses and activities. 
	
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: "love" has 1780, while "hate" only has 232

	
	SQL code used to arrive at answer: */

		SELECT COUNT(text)
		FROM review
		WHERE text LIKE "%love%"

		SELECT COUNT(text)
		FROM review
		WHERE text LIKE "%hate%"

	
	
/* 10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer: */
	
		SELECT id, name, fans
		FROM user
		ORDER BY fans DESC
		LIMIT 10	
	
	/* Copy and Paste the Result Below:

		+------------------------+-----------+------+
		| id                     | name      | fans |
		+------------------------+-----------+------+
		| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
		| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
		| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
		| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
		| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
		| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
		| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
		| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
		| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
		+------------------------+-----------+------+
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

City: Las Vegas
Category: Shopping
The 4-5 star group seems to have shorter hours then the 2-3 star group.

ii. Do the two groups you chose to analyze have a different number of reviews?
         
The 4-5 star group has more reviews than 2-3 star group in total.          

iii. Are you able to infer anything from the location data provided between these two groups? Explain.

No, every business is in a different zip-code.

SQL code used for analysis: */

SELECT
       CASE
       WHEN stars>=4 THEN '4-5 Stars'
       WHEN (stars>=2 AND stars<=3) THEN '2-3 Stars'
       END as rating,

       postal_code,
       review_count,
       hours.hours,
       name,
       neighborhood


FROM business INNER JOIN category
     ON business.id=category.business_id

     INNER JOIN hours
     ON business.id=hours.business_id

WHERE city='Las Vegas'
      AND category = 'Shopping'
      AND (stars>=4 OR (stars <3 and stars>2))

ORDER BY stars DESC, hours DESC

		
		
/* 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         
The businesses that are open tend to have more reviews than ones that are closed on average. */
Open:   AVG(review_count) = 31.757
Closed: AVG(review_count) = 23.198

         
/* ii. Difference 2:
         
The average star rating is higher for businesses that are open than businesses that are closed. */
Open:   AVG(stars) = 3.68
Closed: AVG(stars) = 3.52
        
         
/* SQL code used for analysis: */

SELECT
	COUNT(DISTINCT(id)) AS number_of_business,
	ROUND(AVG(review_count),2) AS avg_review,
	SUM(review_count) AS total_review,
	ROUND(AVG(stars),2) AS avg_rating,
	is_open
FROM business
GROUP BY is_open
	
	
/* 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

Predicting the number of fans a user will have.
                  
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
From the ER diagram, I noticed that the integer type data such as review_count, number of useful comments and compliments may be useful when predicting the number of fans a user will have. There could have been a lot of other analysis that could have been done based on other factors like the quality of the review made, review sentiment analysis, rating of the business for which the review was made etc. but I havenâ€™t considered all these in the current analysis.
                 
iii. Output of your finished dataset:
+---------+--------------+------------+-----------------+-----------------+---------------------+
| name    | years_active | elite_year | fans_per_review | fans_per_useful | fans_per_compliment |
+---------+--------------+------------+-----------------+-----------------+---------------------+
| Gerald  |            8 |       None |            0.13 |            0.01 |                0.01 |
| .Hon    |           14 |       None |            0.08 |            0.01 |                0.01 |
| eric    |           13 |       None |            0.01 |            16.0 |                0.24 |
| Roanna  |           14 |       None |             0.1 |            0.03 |                0.02 |
| Ed      |           11 |          7 |            0.04 |            0.27 |                0.13 |
| Dominic |            9 |          6 |            0.04 |            0.46 |                0.13 |
| Lissa   |           13 |          8 |            0.14 |            0.26 |                0.04 |
| Alison  |           13 |       None |            0.08 |             0.2 |                0.03 |
| Sui     |           11 |       None |             0.1 |            8.67 |                0.27 |
| Crissy  |           12 |       None |            0.04 |            6.25 |                0.24 |
+---------+--------------+------------+-----------------+-----------------+---------------------+

+--------------+-----------------+-----------------+---------------------+
| years_active | fans_per_review | fans_per_useful | fans_per_compliment |
+--------------+-----------------+-----------------+---------------------+
|       7.1995 | 0.0329976979281 |  0.240480232298 |      0.179715921136 |
+--------------+-----------------+-----------------+---------------------+

he result of the analysis are as follows:
-- 1) Being an elite member doesnâ€™t have much of an effect on the number of fans as most of the high fan user werenâ€™t elite members ever.
-- 2) On an average, a user has been on yelp for 7 years.
-- 3) Now for fan prediction, it seems on an average each review can count towards 0.033 fans i.e. on an average one can expect 1 fan for every 30 reviews posted
-- 4) Other observations are, on an average, one can expect 1 fan for every 4 rating for usefulness given by users and on average 1 fan for every 5.5 rating for compliment given by users


         
         
iv. Provide the SQL code you used to create your final dataset: */

SELECT
	name,
	DATE('NOW')-yelping_since AS years_active,
	(MAX(year)-MIN(year)) AS elite_year,
	ROUND(fans*1.0/review_count,2) as fans_per_review,
	ROUND(fans*1.0/useful,2) as fans_per_useful,
	ROUND(fans*1.0/(funny+cool+compliment_hot+ compliment_more+ compliment_profile+ compliment_cute+ compliment_list + compliment_note + compliment_plain + compliment_cool + compliment_funny + compliment_writer + compliment_photos),2) AS fans_per_compliment

FROM user LEFT JOIN elite_years
ON user.id=elite_years.user_id

GROUP BY name

ORDER BY review_count DESC
LIMIT 10

+---------+--------------+------------+-----------------+-----------------+---------------------+
/* | name    | years_active | elite_year | fans_per_review | fans_per_useful | fans_per_compliment |
+---------+--------------+------------+-----------------+-----------------+---------------------+
| Gerald  |            8 |       None |            0.13 |            0.01 |                0.01 |
| .Hon    |           14 |       None |            0.08 |            0.01 |                0.01 |
| eric    |           13 |       None |            0.01 |            16.0 |                0.24 |
| Roanna  |           14 |       None |             0.1 |            0.03 |                0.02 |
| Ed      |           11 |          7 |            0.04 |            0.27 |                0.13 |
| Dominic |            9 |          6 |            0.04 |            0.46 |                0.13 |
| Lissa   |           13 |          8 |            0.14 |            0.26 |                0.04 |
| Alison  |           13 |       None |            0.08 |             0.2 |                0.03 |
| Sui     |           11 |       None |             0.1 |            8.67 |                0.27 |
| Crissy  |           12 |       None |            0.04 |            6.25 |                0.24 |/*/
+---------+--------------+------------+-----------------+-----------------+---------------------+

SELECT
	AVG(DATE('NOW')-yelping_since) AS years_active,
	AVG(ROUND(fans*1.0/review_count,2)) as fans_per_review,
	AVG(ROUND(fans*1.0/useful,2)) as fans_per_useful,
	AVG(ROUND(fans*1.0/(funny+cool+compliment_hot+ compliment_more+ compliment_profile+ compliment_cute+ compliment_list + compliment_note + compliment_plain + compliment_cool + compliment_funny + compliment_writer + compliment_photos),2)) AS fans_per_compliment

FROM user;

+--------------+-----------------+-----------------+---------------------+
/* | years_active | fans_per_review | fans_per_useful | fans_per_compliment | 
+--------------+-----------------+-----------------+---------------------+
|       7.1995 | 0.0329976979281 |  0.240480232298 |      0.179715921136 | */
+--------------+-----------------+-----------------+---------------------+

