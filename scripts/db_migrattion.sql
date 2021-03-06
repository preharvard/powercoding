--/** users table creation **/
--CREATE TABLE users (
--  id int(11) NOT NULL AUTO_INCREMENT,
--  email varchar(250) NOT NULL,
--  hashed_password varchar(250) NOT NULL,
--  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  confirmed tinyint(1) NOT NULL DEFAULT 0,
--  PRIMARY KEY (id)
--);
--
--/** user_email_confirmations table creation **/
--CREATE TABLE user_email_confirmations (
--  id int(11) NOT NULL AUTO_INCREMENT,
--  email varchar(250) NOT NULL,
--  uuid varchar(100) NOT NULL,
--  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  PRIMARY KEY (id)
--);
--
--/** loan_requests table creation **/
--create table loan_requests (
--  id INT NOT NULL AUTO_INCREMENT,
--  name VARCHAR(250) NOT NULL,
--  email VARCHAR(255) NOT NULL,
--  phone_number VARCHAR(100) NOT NULL,
--  loan_type_id INT NOT NULL,
--  post_code VARCHAR(25) NOT NULL,
--  address VARCHAR(100) NOT NULL,
--  detailed_address VARCHAR(100) NOT NULL,
--  loan_amount DECIMAL(25,4) NOT NULL,
--  loan_period INT NOT NULL,
--  approved tinyint(1) NOT NULL DEFAULT 0,
--  deposited tinyint(1) NOT NULL DEFAULT 0,
--  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  PRIMARY KEY(id)
--);
--
--/** products table creation **/
--create table products (
--  id INT NOT NULL AUTO_INCREMENT,
--  loan_request_id INT NOT NULL,
--  title VARCHAR(250) NOT NULL,
--  interest_rate DECIMAL(5,4) NOT NULL,
--  duration_in_month INT NOT NULL,
--  loan_amount DECIMAL(25,4) NOT NULL,
--  pic_url VARCHAR(2500) NOT NULL,
--  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  PRIMARY KEY(id)
--);
--
--/** loan_types table creation **/
--create table loan_types (
--  id INT NOT NULL AUTO_INCREMENT,
--  loan_type VARCHAR(100) NOT NULL,
--  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  PRIMARY KEY(id)
--);
--
--/** investments table creation **/
--create table investments (
--  id INT NOT NULL AUTO_INCREMENT,
--  email varchar(250) NOT NULL,
--  product_id INT NOT NULL,
--  amount DECIMAL(25, 4) NOT NULL,
--  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  PRIMARY KEY(id)
--);
--
--/** Populate loan_types table **/
--INSERT INTO id = 1, loan_types SET loan_type = '부동산 담보대출';
--
--/** Populate loan_requests table **/
--INSERT INTO loan_requests SET id = 1, name='TEST', email='test@test.com', phone_number='01000000000', loan_type_id=1, post_code='11111', detailed_address='test detailed address', address='test address', loan_amount=60000000, loan_period=12, approved=1, deposited=1;
--INSERT INTO loan_requests SET id = 2, name='TEST', email='test2@test.com', phone_number='01000000000', loan_type_id=1, post_code='11111', detailed_address='test detailed address', address='test address', loan_amount=50000000, loan_period=18, approved=1, deposited=1;
--INSERT INTO loan_requests SET id = 3, name='TEST', email='test3@test.com', phone_number='01000000000', loan_type_id=1, post_code='11111', detailed_address='test detailed address', address='test address', loan_amount=55000000, loan_period=12, approved=1, deposited=1;
--INSERT INTO loan_requests SET id = 4, name='TEST', email='test4@test.com', phone_number='01000000000', loan_type_id=1, post_code='11111', detailed_address='test detailed address', address='test address', loan_amount=50000000, loan_period=18, approved=1, deposited=1;
--INSERT INTO loan_requests SET id = 5, name='TEST', email='test5@test.com', phone_number='01000000000', loan_type_id=1, post_code='11111', detailed_address='test detailed address', address='test address', loan_amount=55000000, loan_period=12, approved=1, deposited=1;
--INSERT INTO loan_requests SET id = 6, name='TEST', email='test6@test.com', phone_number='01000000000', loan_type_id=1, post_code='11111', detailed_address='test detailed address', address='test address', loan_amount=55000000, loan_period=12, approved=1, deposited=1;
--
--/** Populate products table **/
--INSERT INTO products SET id = 1, loan_request_id = 1, title = 'A 아파트TEST 35평', interest_rate = 0.095, duration_in_month = 12, loan_amount = 60000000, pic_url='http://d1r0aupzpn4lbi.cloudfront.net/img/product_a.jpg';
--INSERT INTO products SET id = 2, loan_request_id = 2, title = 'B 아파트TEST 32평', interest_rate = 0.105, duration_in_month = 18, loan_amount = 50000000, pic_url='http://d1r0aupzpn4lbi.cloudfront.net/img/product_b.jpg';
--INSERT INTO products SET id = 3, loan_request_id = 3, title = 'C 아파트TEST 31평', interest_rate = 0.12, duration_in_month = 12, loan_amount = 55000000, pic_url='http://d1r0aupzpn4lbi.cloudfront.net/img/product_c.jpg';
--INSERT INTO products SET id = 4, loan_request_id = 4, title = 'D 아파트TEST 90평', interest_rate = 0.105, duration_in_month = 18, loan_amount = 90000000, pic_url='http://d1r0aupzpn4lbi.cloudfront.net/img/product_b.jpg';
--INSERT INTO products SET id = 5, loan_request_id = 5, title = 'E 아파트TEST 57평', interest_rate = 0.12, duration_in_month = 12, loan_amount = 81000000, pic_url='http://d1r0aupzpn4lbi.cloudfront.net/img/product_c.jpg';
--INSERT INTO products SET id = 6, loan_request_id = 6, title = 'F 아파트TEST 88평', interest_rate = 0.07, duration_in_month = 24, loan_amount = 77000000, pic_url='http://d1r0aupzpn4lbi.cloudfront.net/img/product_a.jpg';
--
--
--/** And foreign keys **/
--ALTER TABLE products ADD CONSTRAINT fk_loan_request_id FOREIGN KEY (loan_request_id) REFERENCES loan_requests(id);
--ALTER TABLE loan_requests ADD CONSTRAINT fk_loan_type_id FOREIGN KEY (loan_type_id) REFERENCES loan_types(id);
--ALTER TABLE loan_requests ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id);
--ALTER TABLE investments ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(id);
--
--/** Add unique key constrain on the user email  **/
--ALTER TABLE users ADD UNIQUE (email)
