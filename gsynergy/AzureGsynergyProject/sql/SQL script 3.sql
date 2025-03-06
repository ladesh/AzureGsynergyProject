CREATE TABLE Staging.DimRegion (
    RegionID INT not NULL,
    RegionName NVARCHAR(100)
);

CREATE TABLE Staging.DimCountry (
    CountryID INT not NULL,
    CountryName NVARCHAR(100),
    RegionID INT
);

CREATE TABLE Staging.DimState (
    StateID INT not NULL,
    StateName NVARCHAR(100),
    CountryID INT
);

CREATE TABLE Staging.DimCity (
    CityID INT not NULL,
    CityName NVARCHAR(100),
    StateID INT
);
