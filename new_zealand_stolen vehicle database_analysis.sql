-- (1) What day of the week are vehicles most often and least often stolen?

SELECT 
    DAYNAME(date_stolen) AS day_of_week,
    COUNT(*) AS total_stolen
FROM 
    stolen_vehicles
GROUP BY 
    day_of_week
ORDER BY 
    total_stolen DESC;
    
    -- The most amount of vehicles stolen has been during Mondays and the least amount of vehicles that have been stolen have been during saturdays.
   

-- (2)What types of vehicles are most often and least often stolen? Does this vary by region?

SELECT 
    l.region,
    sv.vehicle_type,
    COUNT(*) AS total_stolen
FROM 
    stolen_vehicles sv
JOIN 
    locations l ON sv.location_id = l.location_id
GROUP BY 
    l.region, sv.vehicle_type
ORDER BY 
    l.region, total_stolen DESC;

-- Saloon seems to be the more often stolen vehicle, while least stolen are more than one and varies depending on the region. Mostly trucks, caravan, mobile home - light, 
-- But in Auckland, the numbers of vehicles stolen are much higher irrespective of the vehicle type compared to other region. 



-- (3)What is the average age of the vehicles that are stolen? Does this vary based on the vehicle type?

-- overall average age
SELECT 
    AVG(2025 - model_year) AS avg_vehicle_age
FROM 
    stolen_vehicles;
-- based on vehicle type
SELECT 
    vehicle_type,
    AVG(2025 - model_year) AS avg_vehicle_age
FROM 
    stolen_vehicles
GROUP BY 
    vehicle_type
ORDER BY 
    avg_vehicle_age DESC;

-- The average age of stolen vehicle is around 19-20 yrs old. And yes, this does vary depending on the type of vehicle.


-- (4) Which regions have the most and least number of stolen vehicles? What are the characteristics of the regions?

SELECT 
    l.region,
    l.population,
    l.density,
    COUNT(sv.vehicle_id) AS total_stolen
FROM 
    locations l
LEFT JOIN 
    stolen_vehicles sv ON l.location_id = sv.location_id
GROUP BY 
    l.region, l.country, l.population, l.density
ORDER BY 
    total_stolen DESC;
    
-- Auckland has the most number of stolen vehicle, while tasman, Marlborough, and west coast have the lowest . Population and density of the region directly corelates to crime/total stolen vehicles.


-- (5) What are the most common vehicle colors among stolen vehicles?

SELECT 
    color,
    COUNT(*) AS total_stolen
FROM 
    stolen_vehicles
GROUP BY 
    color
ORDER BY 
    total_stolen DESC;
    
-- They seem to love silver and white, being the highest to be stolen, or they are catchy colours and stand out.

-- (6) Are newer vehicles (recent model years) stolen more often than older ones?

SELECT 
    model_year,
    COUNT(*) AS total_stolen
FROM 
    stolen_vehicles
GROUP BY 
    model_year
ORDER BY 
    model_year DESC;

-- No, there is no direct corelation to the newer model being stolen more or less and vice versa.

-- (7) Which vehicle makes (brands) are stolen most often?

SELECT 
    md.make_name,
    COUNT(*) AS total_stolen
FROM 
    stolen_vehicles sv
JOIN 
    make_details md ON sv.make_id = md.make_id
GROUP BY 
    md.make_name
ORDER BY 
    total_stolen DESC;


-- Toyotas are stolen more often, even the thiefs know they are worth stealing, very reliable vehicles they are indeed.




