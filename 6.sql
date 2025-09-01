-- Show the average treatment cost per treatment type.
SELECT 
    treatment_type, ROUND(AVG(cost),2) AS AVG_COST
FROM
    treatment
GROUP BY treatment_type;