INSERT INTO dbo.mview_weekly_sales
SELECT 
    CityID AS pos_site_id,  
    SaleID AS sku_id,       
    NULL AS fsclwk_id,      
    NULL AS price_substate_id, 
    NULL AS type,           
    COUNT(*) AS sales_units, 
    SUM(SaleAmount) AS sales_dollars,
    0 AS discount_dollars   
FROM Staging.FactSales  
GROUP BY CityID, SaleID;
