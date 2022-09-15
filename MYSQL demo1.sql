CREATE DATABASE sql_df;
SHOW DATABASES;

USE sql_df;
DROP TABLE student;

-- Create table--
CREATE TABLE student(
id INT AUTO_INCREMENT,
name VARCHAR (20) NOT NULL,
major VARCHAR (20) DEFAULT "历史",
PRIMARY KEY (id)
);

-- ADD Column--
ALTER TABLE student ADD gpa DECIMAL(3,2);
-- ALTER TABLE student DROP COLUMN gpa;

-- ADD detailes information--
INSERT INTO student VALUES(1, "小白", "英语", 8);
INSERT INTO student VALUES(2, "小黑", "化学", 9);
INSERT INTO student VALUES(3, "小红", "物理", 9.9);
INSERT INTO student VALUES(4, "小黄", "数学",8);

INSERT INTO student VALUES(1, "小花", "语文", 9.0);

INSERT INTO student(name, gpa) VALUES("狗子",8);
DESCRIBE student;
SELECT * FROM student;

-- Update and delete information --  

UPDATE student
SET name = "小红", major = "英语"
WHERE id = 1;

DELETE FROM student
WHERE name = "小红" and major = "英语";

-- Select information --
SELECT *  FROM student
WHERE major IN ("物化","语文");


-- 创建公司资料库--
-- employee--
CREATE TABLE employee(
employee_id INT PRIMARY KEY,
name VARCHAR(20),
birthdate DATE,
sex VARCHAR(1),
salary INT,
branch_id INT,
sup_id INT
);
-- branch--
CREATE TABLE branch(
PRIMARY KEY(branch_id),
branch_id INT,
branch_name VARCHAR(20),
manager_id INT,
FOREIGN KEY(manager_id) REFERENCES employee(employee_id)  ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
ON DELETE SET NULL;
ALTER TABLE employee
ADD FOREIGN KEY(sup_id) REFERENCES employee(employee_id)
ON DELETE SET NULL;

-- client--
CREATE TABLE clients(
client_id INT,
PRIMARY KEY (client_id),
client_name VARCHAR(20),
phone VARCHAR(20)
);
CREATE TABLE work_with(
employee_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(employee_id,client_id),
FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);

-- ADD branch data--
INSERT INTO branch VALUES (1, '研发', NUll);
INSERT INTO branch VALUES (2, '行政', NULL);
INSERT INTO branch VALUES (3, '资讯', NULL);

-- ADD employee data--
INSERT INTO employee VALUES (206, '小黄','1998-10-08','F',50000, 1, NULL);
INSERT INTO employee VALUES (207, '小绿','1985-09-16','M',29000, 2, 206);
INSERT INTO employee VALUES (208, '小黑','2000-12-19','M',35000, 3, 206);
INSERT INTO employee VALUES (209, '小白','1997-01-28','F',39000, 3, 207);
INSERT INTO employee VALUES (210, '小蓝','1925-11-10','F',84000, 1, 207);

-- Upate branch--
UPDATE branch 
SET manager_id=206
WHERE branch_id =1;

UPDATE branch 
SET manager_id=207
WHERE branch_id =2;

UPDATE branch 
SET manager_id=208
WHERE branch_id =3;
-- WHERE branch_id<>3; WHERE branch_id BETWEEN 3 AND 5; WHERE manager_id IS NULL 

-- add client data-- 
INSERT INTO clients VALUES (400, '阿狗', '25334453');
INSERT INTO clients VALUES (401, '阿喵', '45346363');
INSERT INTO clients VALUES (402, '旺财', '34345894');
INSERT INTO clients VALUES (403, '露西', '2453364');
INSERT INTO clients VALUES (404, '艾瑞儿', '4564757');

-- add sales data
INSERT INTO work_with VALUES (206, 400, '70000');
INSERT INTO work_with VALUES (207, 401, '24000');
INSERT INTO work_with VALUES (208, 402, '98000');
INSERT INTO work_with VALUES (208, 403, '24000');
INSERT INTO work_with VALUES (210, 404, '983948');

DESCRIBE work_with;

SELECT * FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 4;  -- 从第4行起的一行数据，也就是检索的第5行--

SELECT COUNT(*) FROM employee;

SELECT COUNT(*) FROM employee
WHERE sex='F' AND birthdate > '1970-01-01';

SELECT AVG(salary) FROM employee;
SELECT SUM(salary) FROM employee;
SELECT MAX(salary) FROM employee;
SELECT MIN(salary) FROM employee;

-- match if there is something include in it--
SELECT * FROM clients
WHERE phone LIKE '%458%';

SELECT * FROM clients
WHERE client_name LIKE '艾%';

SELECT * FROM employee
WHERE birthdate LIKE '%-12-%';

-- union -- 
SELECT name, employee_id FROM employee
UNION
SELECT client_name, client_id FROM clients
UNION 
SELECT branch_name, branch_id FROM branch;

SELECT salary AS totalmoney FROM employee
UNION 
SELECT total_sales FROM work_with;


INSERT INTO branch VALUES(4, '偷懒', NULL);

-- join -- 
SELECT employee_id,name,branch_name
FROM employee RIGHT JOIN branch
ON employee.employee_id = branch.manager_id
WHERE employee.name is NULL;

-- subquery --

SELECT name 
FROM employee
WHERE employee_id IN (
	SELECT manager_id 
    FROM branch
	WHERE branch_name = '研发');

SELECT name
FROM employee
WHERE employee_id IN (
	SELECT employee_id
    FROM work_with
    WHERE total_sales > 50000);


-- on delete set null (set null) -- 
-- on delete cascade  (delete the case) --













