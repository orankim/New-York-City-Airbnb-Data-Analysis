#Add geographical information cell
SELECT *,
ST_GeogPoint(longitude, latitude) AS g
FROM `nyc-data21.NYC_Airbnb.listing_origin`;
