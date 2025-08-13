CREATE OR REPLACE TABLE `dogs-468706.dogs_data.dogs_breed_cleaned_final` AS
SELECT
 `Dog breed` AS dog_breed,
 `category`,
 SAFE_CAST(NULLIF(TRIM(CAST(`popularity ranking` AS STRING)), 'no data') AS
FLOAT64) AS popularity_ranking,
 SAFE_CAST(NULLIF(TRIM(`Intelligence ranking`), 'no data') AS FLOAT64) AS
intelligence_ranking,
 NULLIF(TRIM(CAST(`Intelligence category` AS STRING)), 'no data') AS
intelligence_category,
 SAFE_CAST(NULLIF(TRIM(`Life expectancy`), 'no data') AS FLOAT64) AS
life_expectancy,
 SAFE_CAST(NULLIF(TRIM(`Average price`), 'no data') AS FLOAT64) AS average_price,
 `Price bracket` AS price_bracket,
 SAFE_CAST(NULLIF(TRIM(`Food per lifetime`), 'no data') AS FLOAT64) AS
food_per_lifetime,
 `Size category` AS size_category,
 SAFE_CAST(NULLIF(TRIM(CAST(`Cuteness rating ` AS STRING)), 'no data') AS
FLOAT64) AS cuteness_rating
FROM
 `dogs-468706.dogs_data.dogs_breed`
WHERE
 `Dog breed` IS NOT NULL AND `Dog breed` <> ''
 ORDER BY
 dog_breed ASC
