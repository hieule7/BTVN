SELECT *
FROM DimEmployee
WHERE 
(DepartmentName = 'Engineering')
AND
BaseRate BETWEEN '30' AND '40'
SELECT *
FROM DimReseller
WHERE 
(YearOpened >= '2001' AND AnnualSales >= '3000000')
OR
YearOpened < '2001' AND AnnualSales <= '800000'
SELECT *
FROM DimProduct
WHERE EnglishProductName LIKE 'HL%'