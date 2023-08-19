CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Street] NCHAR(50) NOT NULL,
	[City] NCHAR(20) NULL,
	[State] NCHAR(50) NULL,
	[ZipCode] NCHAR(50) NULL
)
