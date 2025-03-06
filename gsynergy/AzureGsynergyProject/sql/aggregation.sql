CREATE TABLE dbo.mview_weekly_sales (
    pos_site_id INT,
    sku_id INT,
    fsclwk_id INT,
    price_substate_id INT,
    type NVARCHAR(50),
    sales_units INT,
    sales_dollars DECIMAL(18,2),
    discount_dollars DECIMAL(18,2)
) WITH (DISTRIBUTION = ROUND_ROBIN);

CREATE INDEX IDX_mview_weekly_sales 
ON dbo.mview_weekly_sales (pos_site_id, sku_id, fsclwk_id, price_substate_id, type);
