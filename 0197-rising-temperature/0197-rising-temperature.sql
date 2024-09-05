SELECT id
FROM (
  SELECT id, 
         recordDate, 
         temperature, 
         LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date, 
         LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
  FROM Weather
) temp_data
WHERE temperature > prev_temp
AND DATEDIFF(recordDate, prev_date) = 1;
