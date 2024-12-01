-- 1
SELECT t1.first_name, t1.surname, t2.bill_date, COUNT(*) 
FROM restBill t2 
JOIN restStaff t1 ON t2.waiter_no = t1.staff_no
GROUP BY t1.first_name, t1.surname, t2.bill_date
HAVING COUNT(*) >= 2;

-- 2
SELECT room_name, COUNT(*)
FROM restRest_table 
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT t1.room_name, SUM(t3.bill_total)
FROM restBill t3
JOIN restRest_table t1 ON t3.table_no = t1.table_no
JOIN restRoom_management t2 ON t1.room_name = t2.room_name
GROUP BY t1.room_name;

-- 4
SELECT t1.first_name, t1.surname, SUM(t3.bill_total)
FROM restBill t3
JOIN restStaff t1 ON t1.staff_no = t3.waiter_no
JOIN restStaff t2 ON t1.headwaiter = t2.staff_no
GROUP BY t1.first_name, t1.surname
ORDER BY bill_amount DESC;

-- 5
SELECT cust_name, AVG(bill_total)
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6
SELECT t1.first_name, t1.surname, t2.bill_date, COUNT(*) AS number_of_bills
FROM restBill t2
JOIN restStaff t1 ON t2.waiter_no = t1.staff_no
GROUP BY t1.first_name, t1.surname, t2.bill_date
HAVING COUNT(*) >= 3;
