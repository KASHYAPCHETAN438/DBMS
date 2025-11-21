# SQL JOINS — Complete Guide

SQL Joins are used to combine rows from two or more tables based on related columns.  
This guide explains all major SQL joins with simple definitions and examples.

---

## 📌 INNER JOIN
Returns **only matching rows** from both tables.

### Example:
```sql
SELECT c.customerid, c.customername, o.orderid
FROM Customer c
INNER JOIN Orders o
ON c.customerid = o.customerid;
```

---

## 📌 LEFT JOIN (LEFT OUTER JOIN)
Returns **all rows from the left table**, and matching rows from the right table.  
Non-matching rows show `NULL`.

### Example:
```sql
SELECT c.customerid, c.customername, o.orderid
FROM Customer c
LEFT JOIN Orders o
ON c.customerid = o.customerid;
```

---

## 📌 RIGHT JOIN (RIGHT OUTER JOIN)
Returns **all rows from the right table**, and matching rows from the left table.  
Non-matching rows show `NULL`.

### Example:
```sql
SELECT c.customerid, c.customername, o.orderid
FROM Customer c
RIGHT JOIN Orders o
ON c.customerid = o.customerid;
```

---

## 📌 FULL JOIN (MySQL Alternative using UNION)
MySQL does NOT support FULL JOIN directly.  
We combine LEFT JOIN + RIGHT JOIN using UNION.

### Example:
```sql
SELECT c.customerid, c.customername, o.orderid
FROM Customer c
LEFT JOIN Orders o ON c.customerid = o.customerid

UNION

SELECT c.customerid, c.customername, o.orderid
FROM Customer c
RIGHT JOIN Orders o ON c.customerid = o.customerid;
```

---

## 📌 CROSS JOIN
Returns **all possible combinations** of rows from both tables (Cartesian product).

### Example:
```sql
SELECT *
FROM Customer
CROSS JOIN Orders;
```

---

## 📌 SELF JOIN
A table is joined **with itself** — useful for comparing rows inside the same table.

### Example:
```sql
SELECT c1.customername, c2.customername AS other_customer
FROM Customer c1
JOIN Customer c2
ON c1.customerid < c2.customerid;
```

---

## 📌 NATURAL JOIN
Automatically joins tables using **columns with the same name**.

### Example:
```sql
SELECT *
FROM Customer
NATURAL JOIN Orders;
```

---

## 📌 UNION vs UNION ALL

### ✔ UNION  
- Combines results  
- Removes duplicates  

### ✔ UNION ALL  
- Combines results  
- **Keeps duplicates**

### Example:
```sql
SELECT customername FROM Customer
UNION ALL
SELECT CAST(customerid AS CHAR) FROM Orders;
```

---

## 📌 Summary Table

| Join Type     | What It Returns |
|---------------|-----------------|
| INNER JOIN    | Matching rows only |
| LEFT JOIN     | All left + matching right |
| RIGHT JOIN    | All right + matching left |
| FULL JOIN     | All rows from both tables (LEFT + RIGHT) |
| CROSS JOIN    | All row combinations |
| SELF JOIN     | Table joined with itself |
| NATURAL JOIN  | Auto-match same column names |
| UNION         | Combines rows, removes duplicates |
| UNION ALL     | Combines rows, keeps duplicates |


