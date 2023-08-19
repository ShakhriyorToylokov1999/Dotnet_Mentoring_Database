CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[AddressId] INT NOT NULL,
	[PersonId] INT NOT NULL,
	[CompanyName] NVARCHAR(100) NOT NULL,
	[Position] NVARCHAR(30) NULL,
	[EmployeeName] NVARCHAR(100) NULL,
	CONSTRAINT FK_Employee_Person FOREIGN KEY (PersonId) REFERENCES Person(Id),
	CONSTRAINT FK_Employee_Address FOREIGN KEY (AddressId) REFERENCES Address(Id),
	CONSTRAINT FK_Employee_Company FOREIGN KEY (CompanyName) REFERENCES Company(Name)
);
