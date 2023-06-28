#Q1
-- 1. Create new schema as alumni
create database alumni;

-- 2. Import all .csv files into MySQL
 -- imported --

-- 3. Run SQL command to see the structure of six tables
USE alumni
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;

-- 4. Display first 1000 rows of tables
-- (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python. */

SELECT * FROM college_a_hs limit 1000;

-- 5.Import first 1500 rows of tables
-- (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.

-- 6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values.

SELECT count(*) FROM college_a_hs;

CREATE VIEW college_a_hs_v AS
SELECT
*
FROM
college_a_hs
WHERE
RollNo IS NOT NULL
AND LastUpdate IS NOT NULL
AND NAME IS NOT NULL
AND FatherName IS NOT NULL
AND MotherName IS NOT NULL
AND Batch IS NOT NULL
AND Degree IS NOT NULL
AND PresentStatus IS NOT NULL
AND HSDegree IS NOT NULL
AND EntranceExam IS NOT NULL
AND Institute IS NOT NULL
AND Location IS NOT NULL;

SELECT * FROM college_a_hs_v;

-- 7.Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.

SELECT * FROM college_a_se;

SELECT COUNT(*) FROM college_a_se;

CREATE VIEW college_a_se_v AS
SELECT
*
FROM
college_a_se
WHERE
RollNo IS NOT NULL
AND LastUpdate IS NOT NULL
AND NAME IS NOT NULL
AND FatherName IS NOT NULL
AND MotherName IS NOT NULL
AND Batch IS NOT NULL
AND Degree IS NOT NULL
AND PresentStatus IS NOT NULL
AND Organization IS NOT NULL
AND Location IS NOT NULL;

SELECT * FROM college_a_se_v;

-- 8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.

SELECT * FROM college_a_sj;

CREATE VIEW college_a_sj_v AS
SELECT
*
FROM
college_a_sj
WHERE
RollNo IS NOT NULL
AND LastUpdate IS NOT NULL
AND NAME IS NOT NULL
AND FatherName IS NOT NULL
AND MotherName IS NOT NULL
AND Batch IS NOT NULL
AND Degree IS NOT NULL
AND PresentStatus IS NOT NULL
AND Organization IS NOT NULL
AND Designation IS NOT NULL
AND Location IS NOT NULL;

SELECT * FROM college_a_sj_v;

-- 9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.

SELECT * FROM college_b_hs;

SELECT COUNT(*) FROM college_b_hs;

CREATE VIEW college_b_hs_v AS
SELECT
*
FROM
college_b_hs
WHERE
RollNo IS NOT NULL
AND LastUpdate IS NOT NULL
AND NAME IS NOT NULL
AND FatherName IS NOT NULL
AND MotherName IS NOT NULL
AND Branch IS NOT NULL
AND Batch IS NOT NULL
AND Degree IS NOT NULL
AND PresentStatus IS NOT NULL
AND HSDegree IS NOT NULL
AND EntranceExam IS NOT NULL
AND Institute IS NOT NULL
AND Location IS NOT NULL;

SELECT * FROM college_b_hs_v;

-- 10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.

SELECT COUNT(*) FROM college_b_se;

SELECT * FROM college_b_se;

CREATE VIEW college_b_se_v AS
SELECT
*
FROM
college_b_se
WHERE
RollNo IS NOT NULL
AND LastUpdate IS NOT NULL
AND NAME IS NOT NULL
AND FatherName IS NOT NULL
AND MotherName IS NOT NULL
AND Branch IS NOT NULL
AND Batch IS NOT NULL
AND Degree IS NOT NULL
AND PresentStatus IS NOT NULL
AND Organization IS NOT NULL
AND Location IS NOT NULL;

SELECT * FROM college_b_se_v;

-- 11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.

SELECT COUNT(*) FROM college_b_sj;

SELECT * FROM college_b_sj;

CREATE VIEW college_b_sj_v AS
SELECT
*
FROM
college_b_sj
WHERE
RollNo IS NOT NULL
AND LastUpdate IS NOT NULL
AND NAME IS NOT NULL
AND FatherName IS NOT NULL
AND MotherName IS NOT NULL
AND Branch IS NOT NULL
AND Batch IS NOT NULL
AND Degree IS NOT NULL
AND PresentStatus IS NOT NULL
AND Organization IS NOT NULL
AND Designation IS NOT NULL
AND Location IS NOT NULL;

SELECT * FROM college_b_sj_v;

-- 12. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views
-- (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V)

SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_A_HS_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_A_Se_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_A_Sj_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_B_HS_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_B_Se_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_B_Sj_V;

-- 13. Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V)
-- into MS Excel and make pivot chart for location of Alumni.
-- Screenshot attached

-- 14. Write a query to create procedure get_name_collegeA using the cursor to
  -- fetch names of all students from college A.
   
   SELECT 
    *
FROM
    college_a_hs;

delimiter //
create procedure collegeA
(            
             inout n mediumtext
) 
begin 
  declare finished int default 0;  
  declare namelist varchar(400) default '';    
  declare namedetails cursor for  select Name from college_a_hs  union 
  select Name from college_a_se  union  select Name from college_a_sj;   

 declare continue handler for not found set finished = 1;   
 open namedetails;  
 getname:  loop 
 fetch namedetails into namelist;  
       if finished = 1 then   
       leave getname; 
	end if;   
 set n = concat(namelist,';',n);  
 end loop getname;  
 close namedetails;
 end //

delimiter ;

set @n=' ';
call collegeA(@n);
select @n;

SELECT COUNT(Name) FROM college_a_hs;
SELECT COUNT(Name) FROM college_a_se;
SELECT COUNT(Name) FROM college_a_sj;
   
 --15. Write a query to create procedure get_name_collegeB
   using the cursor to fetch names of all students from college B. 
   
   delimiter //
create procedure collegeB
( 
	inout n mediumtext
) 
begin  
    declare finished int default 0;  
    declare namelist varchar(400) default '';    
    declare namedetails cursor for  select Name from college_b_hs  union  select Name from college_b_se  union  select Name from college_b_sj;    
    declare continue handler for not found set finished =1;   
    open namedetails;  getname:  
    loop  fetch namedetails into namelist; 
    if finished = 1 then   leave getname;  
    end if;  
    set n = concat(namelist,';',n); 
    end loop getname;  
    close namedetails;
    end//

delimiter ;

set @n=' ';
call collegeB(@n);
select @n ;


SELECT COUNT(Name) FROM college_b_hs;
SELECT COUNT(Name) FROM college_b_se;
SELECT COUNT(Name) FROM college_b_sj;

   

-- 16. Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
  -- Note: Approximate percentages are considered for career choices.
  
SELECT COUNT(*) FROM college_a_hs;
SELECT COUNT(*) FROM college_a_se;
SELECT COUNT(*) FROM college_a_sj;

SELECT((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+(SELECT COUNT(*) FROM college_a_sj)) TOTALA;
 
 -- ANS 5887 --
 
SELECT COUNT(*) FROM college_b_hs;
SELECT COUNT(*) FROM college_b_se;
SELECT COUNT(*) FROM college_b_sj;

SELECT((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj)) TOTALB;

 -- ANS 2259 --
 
 
SELECT 'Higher Studies',(SELECT COUNT(*) / 5887 * 100 FROM college_a_hs)'College A Percentage',
(SELECT COUNT(*) / 2259 * 100 FROM college_b_hs) 'College B Percentage'
UNION
SELECT 'Self Employed',(SELECT COUNT(*) / 5887 * 100 FROM college_a_se)'College A Percentage',
(SELECT COUNT(*) / 2259 * 100 FROM college_b_se) 'College B Percentage'
UNION
SELECT 'Service Job',(SELECT COUNT(*) / 5887 * 100 FROM college_a_sj)'College A Percentage',
(SELECT COUNT(*) / 2259 * 100 FROM college_b_sj) 'College B Percentage';