# Retrieving all rows and columns from all tables
SELECT * 
FROM project.books;

SELECT * 
FROM project.customers;

SELECT *
FROM project.orders;

# Q-1  Retrieve all books in the 'Fiction' genre
SELECT *
FROM project.books
WHERE Genre = 'Fiction';

# Q-2 Find books published after the year 1950
SELECT *
FROM project.books
WHERE Published_Year > '1950-12-31';

# Q-3 List all customers from the Canada
SELECT *
FROM project.customers
WHERE Country = 'Canada';

# Q-4 Show orders placed in November 2023
SELECT *
FROM project.orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

# Q-5 Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Available_Books
FROM project.books;

# Q-6 Find the details of the most expensive book
SELECT *
FROM project.books
WHERE Price = (SELECT MAX(Price) FROM project.books);

# Q-7 Show all customers who ordered more than 1 quantity of a book
SELECT c.*,o.Quantity
FROM project.customers c
JOIN project.orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Quantity > 1;

# Q-8 Retrieve all orders where the total amount exceeds $20
SELECT * 
FROM project.orders
WHERE Total_Amount > 20;

# Q-9 List all genres available in the Books table
SELECT DISTINCT Genre
FROM project.books;

# Q-10 Find the book with the lowest stock
SELECT *
FROM project.books
WHERE Stock = (SELECT MIN(Stock) FROM project.books);

# Q-11 Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Total_Revenue
FROM project.orders;

# Q-12 Retrieve the total number of books sold for each genre
SELECT b.Genre, SUM(o.Quantity) AS Total_Books_Sold
FROM project.books b
LEFT JOIN project.orders o
ON b.Book_ID = o.Book_ID
GROUP BY b.Genre;

# Q-13 Find the average price of books in the "Fantasy" genre
SELECT Genre, AVG(Price) AS Avg_Price
FROM project.books
WHERE Genre = 'Fantasy'
GROUP BY Genre;

# Q-14 List customers who have placed at least 2 orders
SELECT c.Customer_ID,c.Name, COUNT(o.Order_ID) AS Total_Orders
FROM project.customers c
JOIN project.orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID,c.Name
HAVING COUNT(o.Order_ID) >= 2;

# Q-15 Find the most frequently ordered book
SELECT b.Book_ID, b.Title,SUM(o.Quantity) AS Total_Ordered_Book
FROM project.books b
JOIN project.orders o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID,b.Title
ORDER  BY Total_Ordered_Book DESC
LIMIT 1;

# Q-16 Show the top 3 most expensive books of "Fantasy" genre
SELECT *
FROM project.books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

# Q-17 Retrieve the total quantity of books sold by each author
SELECT b.Author, COALESCE(SUM(o.Quantity),0) AS Total_Books_Sold
FROM project.books b
LEFT JOIN project.orders o
ON b.Book_ID = o.Book_ID
GROUP BY b.Author;

# Q-18 List the cities where customers who spent over $30 are located
SELECT c.City, SUM(o.Total_Amount) AS Total_Spent
FROM project.customers c
JOIN project.orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
HAVING SUM(o.Total_Amount) > 30;


# Q- 19 Find the customer who spent the most on orders
SELECT c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM project.customers c
JOIN project.orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID,c.Name
ORDER BY Total_Spent DESC
LIMIT 1;

# Q-20 Calculate the stock remaining after fulfilling all orders
SELECT b.Book_ID,b.Title,b.Stock,
COALESCE(SUM(o.Quantity),0) AS Sold_Stock,
b.Stock - COALESCE(SUM(o.Quantity),0) AS Remaining_Stock
FROM project.books b
LEFT JOIN project.orders o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock;