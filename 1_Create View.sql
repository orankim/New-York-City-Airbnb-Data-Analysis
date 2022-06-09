CREATE VIEW `nyc-data21.NYC_Airbnb.Listing` AS
SELECT L.id, L.host_id, L.availability_365, L.number_of_reviews
FROM `nyc-data21.NYC_Airbnb.listing_origin` L;

CREATE VIEW `nyc-data21.NYC_Airbnb.Room` AS
SELECT L.latitude,L.longitude,L.id,L.host_id,L.room_type,L.name
FROM `nyc-data21.NYC_Airbnb.listing_origin` L;

CREATE VIEW `nyc-data21.NYC_Airbnb.Neighbourhood` AS
SELECT L.latitude, L.longitude, L.neighbourhood, L.neighbourhood_group
FROM `nyc-data21.NYC_Airbnb.listing_origin` L;

CREATE VIEW `nyc-data21.NYC_Airbnb.Host` AS
SELECT L.host_id, L.host_name, L.calculated_host_listings_count
FROM `nyc-data21.NYC_Airbnb.listing_origin` L;

CREATE VIEW `nyc-data21.NYC_Airbnb.Calendar` AS
SELECT C.listing_id, C.date, C.available, C.price, C.minimum_nights, C.maximum_nights
FROM `nyc-data21.NYC_Airbnb.calendar_origin` C;
