COPY INTO dbo.TargetTable
FROM 'https://gsdataengineer.blob.core.windows.net/raw-data/fact.transactions.dlm'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL = (IDENTITY = 'Managed Identity'),
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);