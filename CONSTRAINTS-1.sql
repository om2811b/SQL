


CREATE DATABASE Assignment1;
use Assignment1;

-- 1.
CREATE TABLE countries (
	country_id INT,
    country_name VARCHAR(50),
    region_id INT
);

-- 2.
CREATE TABLE IF NOT EXISTS countries (
	country_id INT,
    country_name VARCHAR(50),
    region_id INT
);

-- 3.
CREATE TABLE dup_countries LIKE countries;

-- 4
CREATE TABLE dup_countries AS 
SELECT * FROM countries;

-- 5
CREATE TABLE countries (
	country_id INT NULL,
    country_name VARCHAR(50) NULL,
    region_id INT NULL
);

-- 6
CREATE TABLE jobs (
	job_id INT , 
	job_title VARCHAR (50), 
	min_salary DECIMAL(10,2), 
	max_salary DECIMAL(10,2),
    CHECK (max_salary<=25000)
);

-- 7
CREATE TABLE countries2 (
	country_id INT,
    country_name VARCHAR(50),
    region_id INT,
		CHECK (country_name IN ('Italy','India','China'))
);

-- 8
CREATE TABLE job_histry (
	employee_id INT, 
    start_date DATE, 
    end_date DATE, 
    job_id INT,
    department_id INT,
    CHECK (end_date LIKE '__/__/____')
);


-- 9
CREATE TABLE countries (
	country_id INT UNIQUE,
    country_name VARCHAR(50),
    region_id INT
); 


-- 10
CREATE TABLE jobs (
	job_id INT , 
	job_title VARCHAR (50) DEFAULT '', 
	min_salary DECIMAL(10,2) DEFAULT 8000, 
	max_salary DECIMAL(10,2) DEFAULT NULL
);


-- ALTER COMMAND --------------

-- 1
ALTER TABLE countries RENAME TO country_new;

-- 2
ALTER TABLE locations ADD region_id INT;

-- 3
ALTER TABLE locations ADD ID INT FIRST;

-- 4
ALTER TABLE locations 
ADD region_id INT AFTER state_province;

-- 5
ALTER TABLE locations 
MODIFY country_id INT;

-- 6
ALTER TABLE locations 
DROP COLUMN city;

-- 7
ALTER TABLE locations 
RENAME COLUMN state_province TO state;

-- 8
ALTER TABLE locations 
ADD PRIMARY KEY (location_id);

-- 9
ALTER TABLE locations 
ADD PRIMARY KEY (location_id, country_id);

-- 10
ALTER TABLE locations DROP PRIMARY KEY;

-- 11
ALTER TABLE job_history 
ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);

-- 12
ALTER TABLE job_history 
ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);

-- 13
ALTER TABLE job_history 
DROP FOREIGN KEY fk_job_id;

-- 14
CREATE INDEX indx_job_id ON job_history(job_id);

-- 15
ALTER TABLE job_history DROP INDEX indx_job_id;



