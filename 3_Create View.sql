CREATE VIEW `nyc-data21.NYC_Airbnb.NRC` AS
SELECT N.neighbourhood, N.neighbourhood_group, R.id, R.room_type,
C.date, C.available, C.price, C.maximum_nights, C.minimum_nights
FROM `nyc-data21.NYC_Airbnb.Neighbourhood` N
INNER JOIN `nyc-data21.NYC_Airbnb.Room` R
INNER JOIN `nyc-data21.NYC_Airbnb.Calendar` C
ON R.id=C.listing_id
ON R.longitude=N.longitude AND R.latitude=N.latitude;
