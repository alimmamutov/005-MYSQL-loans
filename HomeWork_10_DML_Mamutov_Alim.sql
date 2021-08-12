-- DML
-- Кредитные продукты
INSERT INTO products VALUES 
(NULL, 'Первый займ', 'Займ предоставляется если клиент является новым', 1.00, 16, 0),
(NULL, 'Базовый', 'Займ по базовому тарифу', 0.95, 32, 0),
(NULL, 'Комфортный', 'Займ с графиком платежей', 1, 56, 1);

-- Типы файлов
INSERT INTO file_types (name) VALUES 
('Фото'),
('Паспорт'),
('Снилс');

-- 1 клиент
INSERT INTO clients (firstname, lastname, email, phone) VALUES ('Иван', 'Иванов','1@dsfds.ru','89887474789');
SET @cl_id =last_insert_id();

INSERT INTO addresses (region, city, address, client_id) VALUES('Краснодарский край', 'Краснодар', 'Красная 25', @cl_id);
SET @actual_address = last_insert_id(); 
SET @reg_address = @actual_address;

INSERT INTO files VALUES (NULL,@cl_id,1,'0001',89,NULL,NULL,NULL);
SET @ph_id = last_insert_id();

INSERT INTO contact_information VALUES (NULL, @cl_id, 89991487543,'Иванова Ксения Александровна', 'Мать',Null);
INSERT INTO contact_information VALUES (NULL, @cl_id, 89299867441,'Денисов Алексей Дмитриевич', 'Директор',Null);

INSERT INTO profiles VALUES (@cl_id, 'm','1995-05-06',@actual_address, @reg_address,@ph_id,NOW(),NOW());

-- ****************************************************************************************************************
-- 2 клиент
-- ****************************************************************************************************************
INSERT INTO clients (firstname, lastname, email, phone) VALUES ('Антонина', 'Лынова','2@ds.ru','89887984789');
SET @cl_id =last_insert_id(); 

INSERT INTO addresses (region, city, address, client_id) VALUES('Краснодарский край', 'Краснодар', 'Северная 150', @cl_id);
SET @actual_address = last_insert_id(); 
INSERT INTO addresses (region, city, address, client_id) VALUES('Ростовская область', 'Ростов На Дону', 'Ленина 25', @cl_id);
SET @reg_address = last_insert_id();

INSERT INTO files VALUES (NULL,@cl_id,1,'0002',150,NULL,NULL,NULL);
SET @ph_id =last_insert_id(); 

INSERT INTO contact_information VALUES (NULL, @cl_id, 89289847866,'Игоренко Семен Игоревич', 'Коллега',Null);
INSERT INTO contact_information VALUES (NULL, @cl_id, 89796782698,'Денисова Ирина Александровна', 'Сестра',Null);
INSERT INTO contact_information VALUES (NULL, @cl_id, 89796782698,'Смутин Юрий Николаевич', 'Отец',Null);

INSERT INTO profiles VALUES (@cl_id, 'f','1983-07-10',@actual_address, @reg_address,@ph_id,NOW(),NOW());

-- *****************************************************************************************************************
-- Выдаем займы
-- 1 клиент
INSERT INTO doc_contract VALUES (NULL, 'мкк-000001', '2021-01-21', 1, 1, 10000, '2021-02-06',0); -- Выдаем не подписанный займ (не активный)
INSERT INTO doc_contract VALUES (NULL, 'мкк-000002', '2021-01-25', 1, 1, 12000, '2021-02-10',1); -- Выдаем подписанный займ

SET @contr_id = LAST_INSERT_ID(); 
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 120, '2021-01-26 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 120, '2021-01-27 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 120, '2021-01-28 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000001', '2021-01-28 15:00:00', 1, @contr_id, 6000,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 63.6, '2021-01-29 01:00:00'); -- начисляем проценты 

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000002', '2021-01-29 10:00:00', 1, @contr_id, 4000,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 24.24, '2021-01-30 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 24.24, '2021-01-31 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 24.24, '2021-02-01 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 24.24, '2021-02-02 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 1, 1, 0, 24.24, '2021-02-03 01:00:00');
-- 2 клиент
INSERT INTO doc_contract VALUES (NULL, 'мкк-000003', '2021-01-15', 2, 1, 8000, '2021-01-31',1); -- Выдаем займ
SET @contr_id = LAST_INSERT_ID(); 

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-01 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-02 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-03 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-04 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-05 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-06 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-07 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-08 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-09 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-10 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-11 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-12 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-13 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 80, '2021-02-14 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000003', '2021-02-14 11:00:00', 2, @contr_id, 4000,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 51.20, '2021-02-15 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000004', '2021-02-15 17:00:00', 2, @contr_id, 500,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 46.71, '2021-02-16 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, 2, 1, 0, 46.71, '2021-02-17 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000005', '2021-02-17 11:00:00', 2, @contr_id, 4764.62,1); -- гасим весь займ
