CREATE SCHEMA [PolicyEn];

CREATE TABLE [PolicyEn].[Customers](
CustId INT CONSTRAINT pk PRIMARY KEY IDENTITY (1000,1),
CustName VARCHAR(50),
CustAddress VARCHAR(50),
CustPhoneNo VARCHAR(50),
CustGender VARCHAR(50),
DOB DATE,
Smoker VARCHAR(50),
Hobbies VARCHAR(50)
)

SELECT * FROM [PolicyEn].[Customers];

CREATE TABLE [PolicyEn].[Products](
ProdId INT CONSTRAINT pk_prod PRIMARY KEY IDENTITY (1,1),
ProdName VARCHAR(50),
ProdDescription VARCHAR(50),
ProdCategory VARCHAR(50)
)

SELECT * FROM  [PolicyEn].[Products];

CREATE TABLE [PolicyEn].[Policy]
(
PolicyId INT CONSTRAINT pk_pol PRIMARY KEY IDENTITY(10,1),
PolicyNumber INT,
CustId INT,
ProdId INT,
FOREIGN KEY(CustId) REFERENCES [PolicyEn].[Customers](CustId),
FOREIGN KEY(Prodid) REFERENCES [PolicyEn].[Products]
)


SELECT * FROM  [PolicyEn].[Policy];

CREATE TABLE [PolicyEn].[Login]
(
LoginId INT CONSTRAINT pk_Log PRIMARY KEY,
Passwd VARCHAR(50) CHECK (Passwd>8),
CustId INT,
FOREIGN KEY(CustId) REFERENCES [PolicyEn].[Customers](CustId)
)

SELECT * FROM  [PolicyEn].[Login];

CREATE TABLE  [PolicyEn].[Endorsement]
(
EndmtId INT CONSTRAINT pk_en PRIMARY KEY,
EndmtType VARCHAR(50),
ExpDate DATE
)

SELECT * FROM  [PolicyEn].[Endorsement];

CREATE TABLE [PolicyEn].[Documents]
(
DocId INT,
DocName VARCHAR(50),
EndmtId INT,
FOREIGN KEY (EndmtId) REFERENCES [PolicyEn].[Endorsement](EndmtId)
)

SELECT * FROM  [PolicyEn].[Documents];

CREATE PROCEDURE addCustomer
@cName VARCHAR,
@cAdd VARCHAR,
@cPno VARCHAR,
@cGen VARCHAR,
@cDate DATETIME,
@cSmoker VARCHAR,
@cHob VARCHAR
AS
        INSERT INTO [PolicyEn].[Customers] VALUES(@cName,@cAdd,@cPno,@cGen,@cDate,@cSmoker,@cHob);

CREATE PROCEDURE updCustomer
@cid INT,
@EnId INT,
@DName VARCHAR, 
@DocName VARCHAR,
@EndmtId INT,
@CustId INT
AS
      UPDATE [PolicyEn].[Documents] SET @DocName= @DName WHERE @EndmtId= @EnId AND @CustId=@cid;

CREATE PROCEDURE delCustomer
@pnum INT,
@PolicyNumber INT
AS
       DELETE FROM [PolicyEn].[Policy] WHERE @PolicyNumber=  @pnum; 