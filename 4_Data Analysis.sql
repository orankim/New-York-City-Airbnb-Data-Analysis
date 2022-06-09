#Top3 price of each neighbourhood group
SELECT DISTINCT neighbourhood_group, price
FROM(SELECT DISTINCT neighbourhood_group, price,
ROW_NUMBER() OVER (PARTITION BY neighbourhood_group ORDER BY price DESC) AS rank_num
FROM `nyc-data21.NYC_Airbnb.NRC`)
WHERE rank_num<=3;

#Top 5 most reviews 
SELECT DISTINCT neighbourhood_group, room_type, price, number_of_reviews
FROM(`nyc-data21.NYC_Airbnb.NRC` NRC
INNER JOIN `nyc-data21.NYC_Airbnb.Listing` L
ON NRC.id=L.id)
ORDER BY number_of_reviews DESC LIMIT 5;

#Monthly average price, listings number of whole New York City
SELECT EXTRACT(month FROM C.date) AS m, AVG(price), COUNT(listing_id)
FROM `nyc-data21.NYC_Airbnb.Calendar` C
GROUP BY m
ORDER BY m ASC;

#Monthly average price and availability number of each neighbourhood group
SELECT EXTRACT(month from NRC.date) AS m, neighbourhood_group as n, AVG(price), COUNT(available)
FROM `nyc-data21.NYC_Airbnb.NRC` NRC
WHERE NRC.available='t'
GROUP BY m, n
ORDER BY m, n ASC;

#Monthly average price of each room type
SELECT EXTRACT(month from NRC.date) AS m, room_type as n, AVG(price)
FROM `nyc-data21.NYC_Airbnb.NRC` NRC
WHERE NRC.available='t'
GROUP BY m, n
ORDER BY m, n ASC;
