CREATE EXTERNAL DATA SOURCE MyBlobStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'wasbs://raw_data@gsdataengineer.blob.core.windows.net/',
    CREDENTIAL = ManagedIdentityCredential
);