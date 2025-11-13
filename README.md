# 📚 Bookstore SQL Data Analysis Project

This project contains 20 SQL queries designed to analyze a **bookstore database**.  
It demonstrates various SQL concepts like filtering, joins, aggregation, grouping, subqueries, and ordering.

---

## 🧠 Project Overview
The goal of this project is to explore and analyze a fictional bookstore database consisting of three main tables:

- **books** — contains information about each book (title, author, genre, price, and stock)
- **customers** — stores customer details (name, city, country)
- **orders** — records order details such as quantity, total amount, and order date

The queries help answer real-world business questions such as:
- Which book is the most frequently ordered?
- Which customers spent the most money?
- How much stock remains after all orders?
- What’s the total revenue and average prices by genre?

---

## 🗂️ Database Schema (Overview)
**Tables:**
- `project.books(Book_ID, Title, Author, Genre, Price, Published_Year, Stock)`
- `project.customers(Customer_ID, Name, City, Country)`
- `project.orders(Order_ID, Customer_ID, Book_ID, Quantity, Total_Amount, Order_Date)`

---

## 🧩 Query Highlights
| No | Query Objective | SQL Concept Used |
|----|------------------|------------------|
| Q1 | Retrieve all books in the 'Fiction' genre | WHERE clause |
| Q5 | Calculate total stock of books | Aggregation (SUM) |
| Q11 | Calculate total revenue | SUM() |
| Q12 | Find total books sold per genre | JOIN + GROUP BY |
| Q14 | List customers with ≥ 2 orders | HAVING + COUNT() |
| Q15 | Find the most frequently ordered book | Aggregation + ORDER BY + LIMIT |
| Q18 | Find cities with customers who spent > $30 | GROUP BY + HAVING |
| Q20 | Calculate remaining stock after all orders | LEFT JOIN + COALESCE |

---

## ⚙️ Tools Used
- **Database:** MySQL  
- **Language:** SQL  
- **IDE:** MySQL Workbench / VS Code

---

## 🚀 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/MdShahAlamDA/Bookstore-SQL-Data-Analysis-Project.git

---

## 👨‍💻 Author

**Md Shah Alam**  
Data Analyst | SQL • Python • Power BI • Excel  

📧 Email: mdshahalam906565@gmail.com  
🔗 GitHub: [MdShahAlamDA](https://github.com/MdShahAlamDA)  
🔗 LinkedIn: [linkedin.com/in/md-shah-alam-671602343](https://www.linkedin.com/in/md-shah-alam-671602343/)

> Passionate about transforming raw data into actionable insights through SQL and data analytics.

---

⭐ If you find this project helpful, give it a star on GitHub!
