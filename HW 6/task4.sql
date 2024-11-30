-- 1
SELECT DISTINCT t1.cust_name
FROM restBill t1
JOIN restStaff t2 ON t1.waiter_no = t2.staff_no
WHERE t1.bill_total > 450.00
AND t2.headwaiter = (
	SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Charles');
    
-- 2
SELECT t1.first_name, t1.surname
FROM restStaff t1
WHERE t1.staff_no = (
	SELECT t3.headwaiter
    FROM restRoom_management t3
    JOIN restBill t2 ON t2.table_no = t3.table_no
    WHERE t2.cust_name = 'Nerida'
	AND t2.bill_date = 160111);
    
-- 3
SELECT cust_name
FROM restBill 
WHERE bill_total = (
	SELECT MIN(bill_total)
    FROM restBill);
    
-- 4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
	SELECT DISTINCT waiter_no
    FROM restBill);
    
-- 5
SELECT t1.bill_total, t1.cust_name, t2.first_name, t2.surname, t3.room_name
FROM restBill t1
JOIN restRest_table t3 ON t1.table_no = t3.table_no
JOIN restRoom_management t4 ON t3.room_name = t4.room_name 
AND t1.bill_date = t4.room_date
JOIN restStaff t2 ON t4.headwaiter = t2.staff_no
WHERE t1.bill_total = (
	SELECT MAX(bill_total)
    FROM restBill);
    