CREATE TABLE Work
(
  work_numb int PRIMARY KEY AUTO_INCREMENT,
  author_numb int,
  title char (50),
  CONSTRAINT AuthorWork FOREIGN KEY (author_numb) REFERENCES Author (author_numb)

);

CREATE TABLE Publisher
(
  publisher_id int PRIMARY KEY AUTO_INCREMENT,
  publisher_name char (50)
);

CREATE TABLE Customer
(
  customer_numb int PRIMARY KEY AUTO_INCREMENT,
  first_name varchar (30),
  last_name varchar (30),
  street varchar (50),
  city varchar (30),
  state_province char (2),
  zip_postcode char (10),
  contact_phone char (12)
);

CREATE TABLE Sale
(
  sale_id int PRIMARY KEY AUTO_INCREMENT,
  customer_numb int,
  sale_date date,
  sale_total_amt decimal (8,2),
  credit_card_numb char (20),
  exp_month int,
  exp_year int,
  CONSTRAINT SaleCustomer FOREIGN KEY (customer_numb) REFERENCES Customer (customer_numb)
);

CREATE TABLE Book
(
  ISBN char (17),
  work_numb int,
  publisher_id int,
  edition int,
  binding char (20),
  copyright_year char (4),
  CONSTRAINT pk_book PRIMARY KEY (ISBN),
  CONSTRAINT PublisherBook FOREIGN KEY (publisher_id) REFERENCES Publisher (publisher_id),
  CONSTRAINT workBook FOREIGN KEY (work_numb) REFERENCES Work (work_numb)
);

CREATE TABLE Volume
(
  inventory_id int PRIMARY KEY AUTO_INCREMENT,
  ISBN char (17),
  condition_code int,
  date_acquired date,
  asking_price decimal (7,2),
  selling_price decimal (7,2),
  sale_id int,
  CONSTRAINT BookVolume FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
  CONSTRAINT ConditionVolume FOREIGN KEY (condition_code) REFERENCES Condition_codes (condition_code),
  CONSTRAINT SaleVolume FOREIGN KEY (sale_id) REFERENCES Sale (sale_id)
);