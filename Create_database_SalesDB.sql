-- Create database SalesDB
create database SalesDB;
-- Create schema sales
create schema sales;
-- Create table customers and columns
create table sales.customers(
	customer_id bigserial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(200) not null unique,
	phone varchar(15) null
);
-- Create table products ans columns
create table sales.products(
	product_id bigserial primary key,
	product_name varchar(100) not null,
	price numeric(15,2) not null,
	stock_quantity int not null
);
-- Create table orders and columns
create table sales.orders(
	order_id bigserial primary key,
	customer_id bigint not null references sales.customers(customer_id),
	order_date timestamp not null
);
-- Create table orderItems and columns
create table sales.orderitems(
	order_item_id bigserial primary key,
	order_id bigint not null references sales.orders(order_id),
	product_id bigint not null references sales.products(product_id),
	quantity int check(quantity >= 1)
);