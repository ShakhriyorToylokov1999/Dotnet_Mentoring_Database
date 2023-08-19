CREATE TRIGGER CreateCompanyOnEmployeeInsert
ON Employee
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AddressId int;
    DECLARE @CompanyId int;

    SELECT @AddressId = i.AddressId
    FROM inserted i;

    INSERT INTO Address (Street, City, State, ZipCode)
    SELECT Street, City, State, ZipCode
    FROM Address
    WHERE Id = @AddressId;

    SET @AddressId = SCOPE_IDENTITY();

    SELECT @CompanyId = i.CompanyId
    FROM inserted i;

    INSERT INTO Company (Name, AddressId)
    SELECT CompanyName, @AddressId
    FROM Employee
    WHERE Id = @CompanyId;
END