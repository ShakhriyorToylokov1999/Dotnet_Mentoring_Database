CREATE PROCEDURE InsertEmployeeInfo
    @EmployeeName nvarchar(100) = NULL,
    @FirstName nvarchar(50) = NULL,
    @LastName nvarchar(50) = NULL,
    @CompanyName nvarchar(20),
    @Position nvarchar(30) = NULL,
    @Street nvarchar(50),
    @City nvarchar(20) = NULL,
    @State nvarchar(50) = NULL,
    @ZipCode nvarchar(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF (@EmployeeName IS NULL OR LTRIM(RTRIM(@EmployeeName)) = '') AND (@FirstName IS NULL OR LTRIM(RTRIM(@FirstName)) = '') AND (@LastName IS NULL OR LTRIM(RTRIM(@LastName)) = '')
    BEGIN
        RAISERROR('At least one of EmployeeName, FirstName, or LastName must be provided and not empty', 16, 1);
        RETURN;
    END

    IF LEN(@CompanyName) > 20
    BEGIN
        SET @CompanyName = LEFT(@CompanyName, 20);
    END

    DECLARE @AddressId int;
    INSERT INTO Address (Street, City, State, ZipCode)
    VALUES (@Street, @City, @State, @ZipCode);
    SET @AddressId = SCOPE_IDENTITY();

    DECLARE @PersonId int;
    INSERT INTO Person (FirstName, LastName)
    VALUES (@FirstName, @LastName);
    SET @PersonId = SCOPE_IDENTITY();

    INSERT INTO Employee (AddressId, PersonId, CompanyName, Position, EmployeeName)
    VALUES (@AddressId, @PersonId, @CompanyName, @Position, @EmployeeName);
END