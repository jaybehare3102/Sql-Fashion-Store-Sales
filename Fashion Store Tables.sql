CREATE DATABASE fashion_store;


USE fashion_store;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    country VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10,2),
    channel VARCHAR(50),
    discounted BOOLEAN,
    country VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



CREATE TABLE salesitems (
    sale_item_id INT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT,
    item_total DECIMAL(10,2),
    channel_campaigns INT,
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    campaign_type VARCHAR(50)
);


CREATE TABLE channels (
    channel_id INT PRIMARY KEY,
    channel_name VARCHAR(50)
);


CREATE TABLE stock (
    stock_id INT PRIMARY KEY,
    product_id INT,
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



---------------------------------------------------------------------------------------------------------

INSERT INTO customers VALUES
(1, 'Amit', 'Sharma', 'Male', 28, 'India'),
(2, 'Priya', 'Verma', 'Female', 24, 'India'),
(3, 'Rahul', 'Mehta', 'Male', 32, 'India'),
(4, 'Sneha', 'Patil', 'Female', 29, 'India'),
(5, 'John', 'Doe', 'Male', 35, 'USA'),
(6, 'Emma', 'Watson', 'Female', 30, 'UK'),
(7, 'Liam', 'Smith', 'Male', 27, 'Canada'),
(8, 'Olivia', 'Brown', 'Female', 26, 'Australia'),
(9, 'Noah', 'Wilson', 'Male', 31, 'USA'),
(10, 'Ava', 'Taylor', 'Female', 22, 'UK'),
(11, 'Arjun', 'Reddy', 'Male', 27, 'India'),
(12, 'Neha', 'Kapoor', 'Female', 23, 'India'),
(13, 'Karan', 'Malhotra', 'Male', 34, 'India'),
(14, 'Pooja', 'Singh', 'Female', 28, 'India'),
(15, 'Rohit', 'Joshi', 'Male', 31, 'India'),
(16, 'Sophia', 'Miller', 'Female', 29, 'USA'),
(17, 'James', 'Anderson', 'Male', 36, 'USA'),
(18, 'Isabella', 'Thomas', 'Female', 25, 'UK'),
(19, 'William', 'Martin', 'Male', 33, 'Canada'),
(20, 'Mia', 'White', 'Female', 26, 'Australia'),
(21, 'David', 'Clark', 'Male', 38, 'USA'),
(22, 'Ella', 'Hall', 'Female', 24, 'UK'),
(23, 'Daniel', 'Allen', 'Male', 30, 'Canada'),
(24, 'Grace', 'Young', 'Female', 27, 'Australia'),
(25, 'Aryan', 'Deshmukh', 'Male', 22, 'India'),
(26, 'Ananya', 'Iyer', 'Female', 21, 'India'),
(27, 'Kabir', 'Khan', 'Male', 29, 'India'),
(28, 'Meera', 'Nair', 'Female', 32, 'India'),
(29, 'Lucas', 'Scott', 'Male', 35, 'USA'),
(30, 'Chloe', 'Adams', 'Female', 28, 'UK');


INSERT INTO products VALUES
(101, 'T-Shirt', 'Clothing', 799.00),
(102, 'Jeans', 'Clothing', 1999.00),
(103, 'Sneakers', 'Footwear', 2999.00),
(104, 'Jacket', 'Clothing', 3499.00),
(105, 'Dress', 'Clothing', 2499.00),
(106, 'Sandals', 'Footwear', 999.00),
(107, 'Cap', 'Accessories', 499.00),
(108, 'Backpack', 'Accessories', 1499.00),
(109, 'Watch', 'Accessories', 4999.00),
(110, 'Sunglasses', 'Accessories', 1299.00),
(111, 'Hoodie', 'Clothing', 2199.00),
(112, 'Formal Shirt', 'Clothing', 1599.00),
(113, 'Leather Shoes', 'Footwear', 3999.00),
(114, 'Running Shoes', 'Footwear', 2799.00),
(115, 'Handbag', 'Accessories', 3499.00),
(116, 'Wallet', 'Accessories', 899.00),
(117, 'Belt', 'Accessories', 699.00),
(118, 'Kurta', 'Ethnic Wear', 1299.00),
(119, 'Saree', 'Ethnic Wear', 2999.00),
(120, 'Blazer', 'Clothing', 4599.00);



INSERT INTO campaigns VALUES
(1, 'Summer Sale', 'Seasonal'),
(2, 'Black Friday', 'Discount'),
(3, 'New Arrival', 'Launch'),
(4, 'Festive Offer', 'Holiday'),
(5, 'Clearance Sale', 'Stock Clearance');



INSERT INTO channels VALUES
(1, 'Online'),
(2, 'Store'),
(3, 'Mobile App'),
(4, 'Social Media');



INSERT INTO sales VALUES
(1001, 1, '2024-01-10', 2598.00, 'Online', TRUE, 'India'),
(1002, 2, '2024-01-12', 1999.00, 'Store', FALSE, 'India'),
(1003, 3, '2024-01-15', 3499.00, 'Mobile App', TRUE, 'India'),
(1004, 4, '2024-01-18', 4498.00, 'Online', FALSE, 'India'),
(1005, 5, '2024-01-20', 2999.00, 'Store', TRUE, 'USA'),
(1006, 6, '2024-01-22', 4999.00, 'Online', FALSE, 'UK'),
(1007, 7, '2024-01-25', 1499.00, 'Mobile App', TRUE, 'Canada'),
(1008, 8, '2024-01-27', 999.00, 'Store', FALSE, 'Australia'),
(1009, 9, '2024-01-29', 1299.00, 'Online', TRUE, 'USA'),
(1010, 10, '2024-01-30', 3798.00, 'Social Media', TRUE, 'UK'),
(1011, 11, '2024-02-01', 2199.00, 'Online', TRUE, 'India'),
(1012, 12, '2024-02-02', 1599.00, 'Store', FALSE, 'India'),
(1013, 13, '2024-02-03', 3999.00, 'Online', TRUE, 'India'),
(1014, 14, '2024-02-04', 2799.00, 'Mobile App', TRUE, 'India'),
(1015, 15, '2024-02-05', 3499.00, 'Store', FALSE, 'India'),
(1016, 16, '2024-02-06', 899.00, 'Online', TRUE, 'USA'),
(1017, 17, '2024-02-07', 699.00, 'Mobile App', FALSE, 'USA'),
(1018, 18, '2024-02-08', 1299.00, 'Online', TRUE, 'UK'),
(1019, 19, '2024-02-09', 2999.00, 'Store', FALSE, 'Canada'),
(1020, 20, '2024-02-10', 4599.00, 'Social Media', TRUE, 'Australia'),
(1021, 21, '2024-02-11', 799.00, 'Online', TRUE, 'USA'),
(1022, 22, '2024-02-12', 1999.00, 'Store', FALSE, 'UK'),
(1023, 23, '2024-02-13', 2999.00, 'Online', TRUE, 'Canada'),
(1024, 24, '2024-02-14', 1499.00, 'Mobile App', FALSE, 'Australia'),
(1025, 25, '2024-02-15', 1299.00, 'Online', TRUE, 'India'),
(1026, 26, '2024-02-16', 999.00, 'Store', FALSE, 'India'),
(1027, 27, '2024-02-17', 3499.00, 'Online', TRUE, 'India'),
(1028, 28, '2024-02-18', 2499.00, 'Mobile App', TRUE, 'India'),
(1029, 29, '2024-02-19', 4999.00, 'Online', FALSE, 'USA'),
(1030, 30, '2024-02-20', 2799.00, 'Store', TRUE, 'UK');




INSERT INTO salesitems VALUES
(1, 1001, 101, 2, 1598.00, 1),
(2, 1001, 107, 2, 1000.00, 1),
(3, 1002, 102, 1, 1999.00, 2),
(4, 1003, 104, 1, 3499.00, 3),
(5, 1004, 103, 1, 2999.00, 1),
(6, 1004, 106, 1, 1499.00, 1),
(7, 1005, 103, 1, 2999.00, 2),
(8, 1006, 109, 1, 4999.00, 3),
(9, 1007, 108, 1, 1499.00, 4),
(10, 1008, 106, 1, 999.00, 2),
(11, 1009, 110, 1, 1299.00, 1),
(12, 1010, 101, 2, 1598.00, 4),
(13, 1010, 105, 1, 2200.00, 4),
(14, 1011, 111, 1, 2199.00, 1),
(15, 1012, 112, 1, 1599.00, 2),
(16, 1013, 113, 1, 3999.00, 1),
(17, 1014, 114, 1, 2799.00, 3),
(18, 1015, 115, 1, 3499.00, 2),
(19, 1016, 116, 1, 899.00, 1),
(20, 1017, 117, 1, 699.00, 3),
(21, 1018, 118, 1, 1299.00, 1),
(22, 1019, 119, 1, 2999.00, 2),
(23, 1020, 120, 1, 4599.00, 4),
(24, 1021, 101, 1, 799.00, 1),
(25, 1022, 102, 1, 1999.00, 2),
(26, 1023, 103, 1, 2999.00, 1),
(27, 1024, 108, 1, 1499.00, 3),
(28, 1025, 110, 1, 1299.00, 1),
(29, 1026, 106, 1, 999.00, 2),
(30, 1027, 104, 1, 3499.00, 1),
(31, 1028, 105, 1, 2499.00, 3),
(32, 1029, 109, 1, 4999.00, 1),
(33, 1030, 114, 1, 2799.00, 2);



INSERT INTO stock VALUES
(1, 101, 100),
(2, 102, 80),
(3, 103, 60),
(4, 104, 50),
(5, 105, 70),
(6, 106, 90),
(7, 107, 120),
(8, 108, 40),
(9, 109, 30),
(10, 110, 75),
(11, 111, 60),
(12, 112, 75),
(13, 113, 40),
(14, 114, 55),
(15, 115, 30),
(16, 116, 90),
(17, 117, 100),
(18, 118, 70),
(19, 119, 45),
(20, 120, 25);