-- Read data
SELECT  Country, City, CustomerName
FROM Customers
ORDER BY Country;

-- the list of all supliers from teh USA
SELECT  Country, City, SupplierName
FROM Suppliers
WHERE Country = 'USA';

-- all the customers living in the USA
SELECT  *
FROM Customers
WHERE Country = 'USA';

-- all the customer from the USA or Paris
SELECT  *
FROM Customers
WHERE Country = 'USA' or City = 'Paris';

-- ordered w/ USA first 
SELECT  Country, City, CustomerName, ContactName
FROM Customers
WHERE Country = 'USA' or City = 'Paris'
ORDER BY Country DESC;

-- all the customer from the USA or Paris sorted by Country ASC and city DESC
SELECT  Country, City, CustomerName, ContactName
FROM Customers
WHERE Country = 'USA' or City = 'Paris'
ORDER BY Country, City DESC;

-- all products where price is higher than 25
SELECT  *
FROM Products
WHERE Price > '25'
ORDER BY Price;

-- the 5 most expensive products 
SELECT *
FROM [Products]
WHERE Price > 25
ORDER BY Price DESC
LIMIT 5;

-- Add data
insert into [Shippers] (ShipperName, Phone)
values('Lamda Shipping', '(555) 555-1234');

-- Update data 
UPDATE [Shippers]
SET Phone = '(505) 555-2345'; -- DANGER WILL UPDATE ALL THE ROWS

--SELECT * FROM [Shippers] -- run the select from to make sure you're targeting the right data 
UPDATE Shippers SET Phone = '(202) 555-6789'
WHERE ShipperID = 4;

-- Delete data
--SELECT * FROM [Shippers]  -- run the select from to make sure you're targeting the right data 
DELETE FROM Shippers
WHERE ShipperID = 4;