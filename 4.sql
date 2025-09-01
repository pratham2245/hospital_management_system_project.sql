-- Find all bills where the payment status is “Pending”.
SELECT 
    bill_id
FROM
    billing
WHERE
    payment_status = 'Pending';