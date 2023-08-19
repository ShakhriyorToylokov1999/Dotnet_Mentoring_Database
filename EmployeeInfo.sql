CREATE VIEW EmployeeInfo AS
SELECT e.Id AS EmployeeId,
       COALESCE(e.EmployeeName, p.FirstName + ' ' + p.LastName) AS EmployeeFullName,
       a.ZipCode + '_' + COALESCE(a.State, '') + ', ' + COALESCE(a.City, '') + '-' + COALESCE(a.Street, '') AS EmployeeFullAddress,
       c.Name + '(' + COALESCE(e.Position, '') + ')' AS EmployeeCompanyInfo,
       ROW_NUMBER() OVER (ORDER BY c.Name ASC, COALESCE(a.City, '') ASC) AS RowNum
FROM Employee e
JOIN Person p ON e.PersonId = p.Id
JOIN Address a ON e.AddressId = a.Id
JOIN Company c ON e.CompanyName = c.Name;

GO

CREATE VIEW EmployeeInfoSorted AS
SELECT EmployeeId, EmployeeFullName, EmployeeFullAddress, EmployeeCompanyInfo
FROM EmployeeInfo
ORDER BY RowNum;

GO

DROP VIEW EmployeeInfo;