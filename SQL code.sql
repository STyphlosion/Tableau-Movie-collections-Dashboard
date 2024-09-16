create database movie;
use movie;
show tables;

create table zeros
(Ranks int,
Release_group text,
Worldwide text,
Domestic text,
Domestic_percent text,
Foreigns text,
Foreign_percent text,
Year int);

create table tens
(Ranks int,
Release_group text,
Worldwide text,
Domestic text,
Domestic_percent text,
Foreigns text,
Foreign_percent text,
Year int);

create table twenties
(Ranks int,
Release_group text,
Worldwide text,
Domestic text,
Domestic_percent text,
Foreigns text,
Foreign_percent text,
Year int);

-- LOAD TABLES USING TABLE DATA IMPORT WIZARD
-- 2000-2009 = zeros
-- 2010 -2024 = tens
-- 2024 = twenties

SET SQL_SAFE_UPDATES = 0;

update zeros
set Worldwide = cast(replace(Worldwide,',','') as unsigned);
update zeros
set Domestic = cast(replace(Domestic,',','') as unsigned);
update zeros
set Foreigns = cast(replace(Foreigns,',','') as unsigned);
update zeros
set Domestic_percent = replace(Domestic_percent,'%','');
update zeros
set Foreign_percent = replace(Foreign_percent,'%','');
alter table zeros
modify Worldwide bigint;
alter table zeros
modify Domestic bigint;
alter table zeros
modify Foreigns bigint;
alter table zeros
modify Domestic_percent decimal(5,2);
alter table zeros
modify Foreign_percent decimal(5,2);

select * from zeros;

update tens
set Worldwide = cast(replace(Worldwide,',','') as unsigned);
update tens
set Domestic = cast(replace(Domestic,',','') as unsigned);
update tens
set Foreigns = cast(replace(Foreigns,',','') as unsigned);
update tens
set Domestic_percent = replace(Domestic_percent,'%','');
update tens
set Foreign_percent = replace(Foreign_percent,'%','');
alter table tens
modify Worldwide bigint;
alter table tens
modify Domestic bigint;
alter table tens
modify Foreigns bigint;
alter table tens
modify Domestic_percent decimal(5,2);
alter table tens
modify Foreign_percent decimal(5,2);

select * from tens;

update twenties
set Worldwide = cast(replace(Worldwide,',','') as unsigned);
update twenties
set Domestic = cast(replace(Domestic,',','') as unsigned);
update twenties
set Foreigns = cast(replace(Foreigns,',','') as unsigned);
update twenties
set Domestic_percent = replace(Domestic_percent,'%','');
update twenties
set Foreign_percent = replace(Foreign_percent,'%','');
alter table twenties
modify Worldwide bigint;
alter table twenties
modify Domestic bigint;
alter table twenties
modify Foreigns bigint;
alter table twenties
modify Domestic_percent decimal(5,2);
alter table twenties
modify Foreign_percent decimal(5,2);

select * from twenties;

create table dataset as
SELECT Ranks, Release_group, Worldwide, Domestic, Domestic_percent, Foreigns, Foreign_percent, Year
FROM zeros
UNION ALL
SELECT Ranks, Release_group, Worldwide, Domestic, Domestic_percent, Foreigns, Foreign_percent, Year
FROM tens
UNION ALL
SELECT Ranks, Release_group, Worldwide, Domestic, Domestic_percent, Foreigns, Foreign_percent, Year
FROM twenties;

select * from dataset;
desc dataset;