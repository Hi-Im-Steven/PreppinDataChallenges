ALTER TABLE dsbank
ADD BANK VARCHAR(50);

UPDATE dsbank
SET Bank = LEFT(Transaction_Code, CHARINDEX('-', Transaction_Code) -1);

UPDATE listings
SET minimum_nights = REPLACE(minimum_nights, '.', '')

ALTER TABLE dsbank
ALTER COLUMN Online_or_In_Person VARCHAR(50);

UPDATE dsbank
SET Online_or_In_Person = REPLACE(Online_or_In_Person, '1', 'Online')
UPDATE dsbank
SET Online_or_In_Person = REPLACE(Online_or_In_Person, '2', 'In-Person')]

UPDATE dsbank
SET Transaction_Date = LEFT(Transaction_Date, 10);

ALTER TABLE dsbank
ALTER COLUMN Transaction_Date VARCHAR(50);

UPDATE dsbank
SET Transaction_Date = DATENAME(WEEKDAY, Transaction_Date);

CREATE VIEW BankValueSum AS
SELECT BANK, SUM(Value) AS Value
FROM dsbank
GROUP By BANK;

CREATE VIEW ValuesBankDayTrans AS
SELECT BANK AS Bank, Online_or_In_Person, Transaction_Date, SUM(Value) AS Value
FROM dsbank
GROUP BY Bank, Online_or_In_Person, Transaction_Date;

CREATE VIEW ValuesBankCust AS
SELECT BANK As Bank, Customer_Code, SUM(Value) AS Value
FROM dsbank
GROUP BY Bank, Customer_Code;

SELECT *
FROM BankValueSum
SELECT * 
FROM ValuesBankDayTrans
SELECT * 
FROM ValuesBankCust