
/* Postgres */
CREATE DATABASE "AdventureWorks"
        WITH
        OWNER = postgres
        ENCODING = 'UTF8'
        LC_COLLATE = 'English_United States.1252'
        LC_CTYPE = 'English_United States.1252'
        TABLESPACE = pg_default
        CONNECTION_LIMIT = -1;

CREATE USER etl WITH PASSWORD = 'demopass'
GRANT CONNECT ON DATABASE "AdventureWorks" TO etl;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO etl;

/* SQL Server */

USE [master]
GO
CREATE LOGIN [etl] WITH PASSWORD=N'demopass', DEFAULT_DATABASE=[AdventureWorksDW2019], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [AdventureWorksDW2019]
GO
CREATE USER [etl] FOR LOGIN [etl]
GO
USE [AdventureWorksDW2019]
GO
ALTER ROLE [db_datareader] ADD MEMBER [etl]
GO
use [master]
GO
GRANT CONNECT SQL TO [etl]
GO