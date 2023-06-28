#Q1
CREATE DATABASE ecommerce

#Q2
use ecommerce;

#Q3
describe users_data;

#Q4
SELECT
*
FROM
users_data
LIMIT 100;

#Q5
SELECT
COUNT(DISTINCT country) distinct_values_exist_in_table_for_field_country
FROM
users_data;
SELECT
COUNT(DISTINCT language) distinct_values_exist_in_table_for_field_country
FROM
users_data;
SELECT
COUNT(DISTINCT country, language) distinct_values_exist_in_table_for_field_country_And_Language
FROM
users_data;

#Q6
select count(if (gender='M',1,null) ) Male_Users from users_data;
select count(if (gender='F',1,null) ) Male_Users from users_data;

#Q7
SELECT
count(hasProfilePicture) Uses_Profile_Picture_in_their_Profile
FROM
users_data where hasProfilePicture='True';

select count(hasAnyApp) Uses_Application_for_users_data_Platform
from users_data where hasAnyApp='True';

select count(hasAndroidApp) Uses_Android_App
from users_data where hasAndroidApp='True';

select count(hasIosApp) Uses_ios_app
from users_data where hasIosApp='True';

#Q8
SELECT
productsBought total_number_of_buyers, country
FROM
users_data
WHERE
productsBought > 0
group by country
ORDER BY productsBought DESC;

#Q9
SELECT
productsSold total_number_of_sellers, country
FROM
users_data
WHERE
productsSold > 0
group by country
ORDER BY productsSold ASC;

#Q10
SELECT
country, productsPassRate name_of_top_10_countries
FROM
users_data
ORDER BY productsPassRate DESC
LIMIT 10;

#Q11
SELECT
language, COUNT(language) different_language_choices
FROM
users_data
GROUP BY language;

#Q12
SELECT
gender, productsWished product_in_a_wishlist
FROM
users_data
WHERE
gender = 'F'
UNION SELECT
gender, socialProductsLiked
FROM
users_data
WHERE
gender = 'F';

#Q13
SELECT
gender, productsWished choice_of_male_users_about_being_seller_or_buyer
FROM
users_data
WHERE
gender = 'M'
UNION SELECT
gender, socialProductsLiked
FROM
users_data
WHERE
gender = 'M';

#Q14
SELECT
country, MAX(productsBought) country_is_having_maximum_number_of_buyers,count(productsBought) Count_number_of_buyers
FROM
users_data ;

#Q15
SELECT
country, productsSold name_of_10_countries_having_zero_number_of_sellers
FROM
users_data
WHERE
productsSold = 0
LIMIT 10;

#Q16
SELECT
daysSinceLastLogin User_days_Since_Last_Login
FROM
users_data
ORDER BY daysSinceLastLogin ASC
LIMIT 110;

#Q17
SELECT
count(gender) number_of_female_users , gender
FROM
users_data
WHERE
gender = 'F'
AND daysSinceLastLogin > 100
ORDER BY daysSinceLastLogin
LIMIT 110;

#Q18
SELECT
COUNT(gender) number_of_female_users, country
FROM
users_data
WHERE
gender = 'F'
GROUP BY country;

#Q19
SELECT
COUNT(gender) number_of_female_users, country
FROM
users_data
WHERE
gender = 'M'
GROUP BY country;

#Q20
SELECT
*
FROM
users_data;

SELECT
AVG(productsSold) average_number_of_products_sold,
AVG(productsBought) average_number_of_products_bought,
COUNT(gender) Number_Of_male_users ,
country
FROM
users_data
WHERE
gender = 'M'
GROUP BY country;






