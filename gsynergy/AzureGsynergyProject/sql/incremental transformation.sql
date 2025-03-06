MERGE INTO dbo.mview_weekly_sales AS Target
USING (
    SELECT 
        CityID AS pos_site_id,  
        SaleID AS sku_id,
        SUM(SaleAmount) AS Total_SaleAmount,
        COUNT(*) AS Total_Sales,  
        MAX(SaleDate) AS LastSaleDate
    FROM Staging.FactSales  
    WHERE SaleDate > (SELECT MAX(SaleDate) FROM dbo.mview_weekly_sales) 
    GROUP BY CityID, SaleID
) AS Source
ON 
    Target.CityID = Source.CityID
    AND Target.SaleID = Source.SaleID
WHEN MATCHED THEN
    UPDATE SET 
        Target.Total_SaleAmount = Source.Total_SaleAmount,
        Target.Total_Sales = Source.Total_Sales,
        Target.LastSaleDate = Source.LastSaleDate
WHEN NOT MATCHED THEN
    INSERT (CityID, SaleID, Total_SaleAmount, Total_Sales, LastSaleDate)
    VALUES (Source.CityID, Source.SaleID, Source.Total_SaleAmount, Source.Total_Sales, Source.LastSaleDate);
