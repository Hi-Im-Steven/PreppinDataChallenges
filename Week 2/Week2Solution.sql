SELECT * FROM transactions
SELECT * FROM SWIFT_Codes

--Removing dashes from Sort_Code column to leave just a 6 digit number
UPDATE transactions
SET Sort_Code = REPLACE(Sort_Code, '-', '')

--Adding a new column and later adding GB values
ALTER TABLE SWIFT_codes
ADD [Country_Code] VARCHAR(2);

UPDATE SWIFT_codes
SET [Country_Code] = 'GB';

--Creating my join to view all columns that need to be concated
SELECT transactions.Transaction_ID, SWIFT_Codes.Country_Code, SWIFT_Codes.Check_Digits, SWIFT_Codes.SWIFT_code, transactions.Sort_Code, transactions.Account_Number    
FROM transactions
INNER JOIN SWIFT_Codes ON SWIFT_Codes.Bank=transactions.Bank;

--Creating a view of those columns being concated into a new column labeled IBAN
CREATE VIEW IBAN
AS SELECT transactions.Transaction_ID, CONCAT(SWIFT_Codes.Country_Code, SWIFT_Codes.Check_Digits, SWIFT_Codes.SWIFT_code, transactions.Sort_Code, transactions.Account_Number) AS IBAN
FROM SWIFT_Codes
INNER JOIN transactions ON SWIFT_Codes.Bank=transactions.Bank;

SELECT * FROM IBAN