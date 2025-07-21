-- This script initializes the DataWareholder database for a data warehouse project.
-- It deletes the database if it already exists, creates a new one,
-- and sets up the standard schemas: bronze, silver and gold.

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWareholder')
BEGIN 
  ALTER DATABASE DataWareholder SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWareholder;
END;
GO

CREATE DATABASE DataWareholder;
GO

USE  DataWareholder;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO
