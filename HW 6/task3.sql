-- 1
SELECT DISTINCT first_name, surname
FROM restStaff
WHERE staff_no IN (
	SELECT waiter_no
    FROM restBill
    WHERE cust_name = 'Tanya Singh');
    
-- 2
SELECT room_date
FROM restRoom_management
WHERE headwaiter = (
	SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Charles' AND surname = 'Watson')
AND room_name = 'Green'
AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT first_name AND surname
FROM restStaff
WHERE headwaiter = (
	SELECT headwaiter 
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball')
AND headwaiter IS NOT NULL; -- without this, it would also return NULL values
    
-- 4
SELECT t1.cust_name, t1.bill_total, 
	t2.first_name, t2.surname
FROM restBill t1
JOIN restStaff t2 ON t1.waiter_no = t2.staff_no
ORDER BY t1.bill_total DESC;

-- 5
SELECT DISTINCT t1.first_name, t1.surname
FROM restStaff t1
JOIN restBill t2 ON t1.staff_no = t2.waiter_no
WHERE t2.waiter_no IN (
	SELECT waiter_no
    FROM restBill 
    WHERE bill_no IN (00014, 00017)
    );

-- 6
SELECT DISTINCT t1.first_name, t1.surname
FROM restStaff t1
-- This links the restStaff table (t1) to the restBill table (t2)
-- The condition t1.staff_no = t2.waiter_no ensures that only
-- waiters from restStaff who served bills in restBill is recieved
JOIN restBill t2 ON t1.staff_no = t2.waiter_no
JOIN restRoom_management t3 ON t3.room_name = 'Blue' 
AND t2.bill_date = 160312
AND t3.room_date = t2.bill_date
WHERE t2.table_no IN (
    SELECT table_no 
    FROM restRest_table
    WHERE room_name = 'Blue')
-- Ensure that the selected staff member is 
-- either the waiter for the bill (t2.waiter_no)
-- or the headwaiter responsible for managing the Blue room 
-- on the specific date (t3.headwaiter).
AND (t1.staff_no = t2.waiter_no OR t1.staff_no = t3.headwaiter);
