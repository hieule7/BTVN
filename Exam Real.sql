---C1 (C�u na�y du�ng EXCEPT ����c kh�ng a� ta�i em kh�ng bi��t code theo ca�i �o�)
SELECT SalesTerritoryKey,
SalesTerritoryRegion,
SalesTerritoryGroup,
SalesTerritoryCountry
FROM DimSalesTerritory
---C2
SELECT
PromotionKey ,
EnglishPromotionName
FROM DimPromotion
---C3
SELECT *
FROM FactSalesQuota
ORDER BY SalesAmountQuota DESC
---C4
SELECT *
FROM FactSalesQuota
WHERE CalendarYear='2013' AND SalesAmountQuota > '1000000'
ORDER BY SalesAmountQuota DESC,EmployeeKey ASC
---C5
SELECT
ProductKey,
Color,
StartDate
FROM DimProduct
WHERE (YEAR(StartDate)='2012' AND Class='M')
OR (YEAR(StartDate)='2013 ' AND Color='Black')
---C6
SELECT 
ResellerKey,
AnnualRevenue,
YearOpened
FROM DimReseller
WHERE ((AnnualRevenue BETWEEN 20000 AND 90000) AND (YearOpened BETWEEN 1972 AND 1978))
OR ((AnnualRevenue BETWEEN 100000  AND 500000 ) AND (YearOpened BETWEEN 1989  AND 2000))
ORDER BY AnnualRevenue DESC,YearOpened DESC
---C7
SELECT *
FROM DimReseller
WHERE (AnnualSales > '1000000') AND (MinPaymentAmount IS NOT NULL) AND (BankName IN ('International Security', 'Primary International', 'United Security', 'Primary Bank & Reserve'))
---C8
SELECT TOP 3 *
FROM DimReseller
WHERE YearOpened >='2001' AND ProductLine='Road'
ORDER BY AnnualSales DESC
---C9
SELECT TOP 5
CONCAT_WS(' ',FirstName,MiddleName,LastName) 'FullName',
BaseRate,
F.SalesAmountQuota
FROM DimEmployee AS D
LEFT JOIN FactSalesQuota AS F ON F.EmployeeKey=D.EmployeeKey
ORDER BY F.SalesAmountQuota DESC
SELECT *
FROM DimEmployee
---C10
WITH CTE AS(
SELECT 
ProductSubcategoryKey
FROM DimProductSubcategory
WHERE EnglishProductSubcategoryName = 'S%')
SELECT
EnglishProductName,
ProductKey 
FROM DimProduct AS P
LEFT JOIN CTE AS CTE ON P.ProductSubcategoryKey=CTE.ProductSubcategoryKey
---C11
SELECT D.*,
CASE
WHEN G.EnglishCountryRegionName  IN ('United States', 'Canada') THEN America
ELSE Europe
END AS PhanLoai
FROM DimCustomer AS D
LEFT JOIN DimGeography AS G ON D.GeographyKey=G.GeographyKey
ORDER BY D.YearlyIncome ASC
---C12
SELECT
G.EnglishCountryRegionName,
SUM(YearlyIncome ) 'Total'
FROM DimCustomer AS D
LEFT JOIN DimGeography AS G ON D.GeographyKey=G.GeographyKey
WHERE D.EnglishEducation = 'Bachelors'
GROUP BY G.EnglishCountryRegionName 
---C13
SELECT
MAX(OrderDate) 'NgayMuaGanNhat',
DPC.EnglishProductCategoryName
FROM FactInternetSales AS FIS
LEFT JOIN DimProduct AS DP ON DP.ProductKey=FIS.ProductKey
LEFT JOIN DimProductSubcategory AS DPSC ON DPSC.ProductSubcategoryKey=DP.ProductSubcategoryKey
LEFT JOIN DimProductCategory AS DPC ON DPC.ProductCategoryKey=DPSC.ProductCategoryKey
GROUP BY DPC.EnglishProductCategoryName
---C15
	SELECT
    ff.FinanceKey,
    ff.Amount,
    do.OrganizationName,
    dg.DepartmentGroupName,
    ds.ScenarioName,
    da.AccountDescription,
    da.AccountType
FROM FactFinance ff
JOIN DimOrganization do ON ff.OrganizationKey = do.OrganizationKey
JOIN DimDepartmentGroup dg ON ff.DepartmentGroupKey = dg.DepartmentGroupKey
JOIN DimScenario ds ON ff.ScenarioKey = ds.ScenarioKey
JOIN DimAccount da ON ff.AccountKey = da.AccountKey;