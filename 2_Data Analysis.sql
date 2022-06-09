#Understand room type
SELECT DISTINCT room_type
FROM `nyc-data21.NYC_Airbnb.Room`;

#Understand neighbourhood group
SELECT DISTINCT neighbourhood_group
FROM `nyc-data21.NYC_Airbnb.Neighbourhood`;

#Join three views and select the best listings in each neighbourhood group
SELECT DISTINCT N.neighbourhood_group, H.calculated_host_listings_count
FROM `nyc-data21.NYC_Airbnb.Neighbourhood` N
INNER JOIN `nyc-data21.NYC_Airbnb.Host` H
INNER JOIN `nyc-data21.NYC_Airbnb.Room` R
ON H.host_id=R.host_id
ON R.longitude=N.longitude AND R.latitude=N.latitude
ORDER BY H.calculated_host_listings_count DESC LIMIT 3;

#Join three views and select room types of the best listings in each nighbourhood group
SELECT DISTINCT room_type
FROM(
SELECT DISTINCT R.room_type, N.neighbourhood_group, H.calculated_host_listings_count
FROM `nyc-data21.NYC_Airbnb.Neighbourhood` N
INNER JOIN `nyc-data21.NYC_Airbnb.Host` H
INNER JOIN `nyc-data21.NYC_Airbnb.Room` R
ON H.host_id=R.host_id
ON R.longitude=N.longitude AND R.latitude=N.latitude
ORDER BY H.calculated_host_listings_count DESC LIMIT 3);
