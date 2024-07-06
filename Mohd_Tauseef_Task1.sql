create database store;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50),
    Description VARCHAR(255)
);

INSERT INTO Categories (CategoryID, CategoryName, Description)
VALUES
    (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
    (2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
    (3, 'Confections', 'Desserts, candies, and sweet breads');

select * from categories;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products (ProductID, ProductName, CategoryID, Price)
VALUES
    (1, 'Campa', 1, 18.00),
    (2, 'ThumbsUp', 1, 49.00),
    (3, 'Kissan', 2, 60.00);
    
select * from products;

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

