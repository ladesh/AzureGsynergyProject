CREATE TABLE Staging.FactSales (
    SaleID INT NOT NULL,  
    CityID INT NOT NULL,  
    SaleAmount DECIMAL(18,2),
    SaleDate DATE
) WITH (DISTRIBUTION = ROUND_ROBIN);


CREATE INDEX IDX_FactSales_CityID 
ON Staging.FactSales (CityID);
