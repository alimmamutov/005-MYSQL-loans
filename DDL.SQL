DROP DATABASE IF EXISTS mkk;
CREATE DATABASE mkk;
USE mkk;

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
	phone BIGINT UNSIGNED UNIQUE,
    INDEX users_firstname_lastname_idx(firstname,
lastname)
) COMMENT 'Таблица Клиенты';

DROP TABLE IF EXISTS file_types;
CREATE TABLE file_types(
	id SERIAL,
    name VARCHAR(255), -- записей мало, поэтому в индексе нет необходимости
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
)COMMENT 'Таблица виды файлов';

DROP TABLE IF EXISTS files;
CREATE TABLE  files(
	id SERIAL PRIMARY KEY,
	client_id BIGINT UNSIGNED NOT NULL,
	file_type_id BIGINT UNSIGNED NOT NULL,
	file_name VARCHAR(255),
	size int,
	metadata JSON,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX client_id_idx(client_id)
) COMMENT 'Таблица прикрепленные файлы';
ALTER TABLE files ADD CONSTRAINT fk_fclient_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE files ADD CONSTRAINT fk_file_type_id FOREIGN KEY (file_type_id) REFERENCES file_types(id) ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	region VARCHAR(100),
	city VARCHAR(100),
	address TEXT,
	client_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT 'отдельная таблица адресов для хранения истории смены адресов клиентов';
ALTER TABLE addresses ADD CONSTRAINT fk_aclient_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS contact_information;
CREATE TABLE contact_information (
	id SERIAL PRIMARY KEY,
	client_id BIGINT UNSIGNED,
	phone BIGINT UNSIGNED,
	person TINYTEXT COMMENT 'Контактное лицо',
	description TEXT COMMENT 'Кем приходится',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT 'Таблица дополнительных контактных лиц';
ALTER TABLE contact_information ADD CONSTRAINT fk_ciclient_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	client_id BIGINT UNSIGNED,
    gender ENUM('m','f'),
    birthday DATE,
    address_actual_id BIGINT UNSIGNED NULL COMMENT 'Ссылка на текущий фактический адрес клиента',
    address_registration_id BIGINT UNSIGNED NULL COMMENT 'Ссылка на текущий адрес по прописке клиента',
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
) COMMENT 'Таблица для хранения личной информации пользователей';
ALTER TABLE profiles ADD CONSTRAINT fk_pclient_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE profiles ADD CONSTRAINT fk_paddress_actual_id FOREIGN KEY (address_actual_id ) REFERENCES addresses(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE profiles ADD CONSTRAINT fk_paddress_registration_id FOREIGN KEY (address_registration_id ) REFERENCES addresses(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE profiles ADD CONSTRAINT fk_pphoto_id FOREIGN KEY (photo_id) REFERENCES files(id) ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name varchar (100),
	decription TEXT,
	interest float(15,2),
	limit_days int(3),
	annuity BIT DEFAULT 0 COMMENT "Аннуитетные платежи"
) COMMENT 'Таблица с кредитными продуктами';

DROP TABLE IF EXISTS doc_contract;
CREATE TABLE doc_contract (
	id SERIAL PRIMARY KEY,
	contract_number varchar (20) COMMENT 'Номер договора',
	contract_date DATETIME DEFAULT NOW() COMMENT 'Дата договора',
	client_id BIGINT UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	sum_loan DECIMAL(15,2) NOT NULL COMMENT 'Сумма займа',
	finish_date DATETIME COMMENT 'Дата окончания договора',
	signed BIT,
	INDEX contract_number_idx(contract_number)
) COMMENT 'Таблица оформленных выдач займов';
ALTER TABLE doc_contract ADD CONSTRAINT fk_contract_client_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE doc_contract ADD CONSTRAINT fk_contract_product_id FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS doc_repayment;
CREATE TABLE doc_repayment(
	id SERIAL PRIMARY KEY,
	repayment_number varchar (20) COMMENT 'Номер погашения',
	repayment_date DATETIME DEFAULT NOW() COMMENT 'Дата погашения',
	client_id BIGINT UNSIGNED NOT NULL,
	contract_id BIGINT UNSIGNED NOT NULL,
	sum_repayment DECIMAL(15,2) NOT NULL COMMENT 'Сумма погашения',
	signed BIT,
	INDEX repayment_number_idx(repayment_number)
) COMMENT 'Таблица погашений займов';
ALTER TABLE doc_repayment ADD CONSTRAINT fk_repayment_client_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE doc_repayment ADD CONSTRAINT fk_repayment_contract_id FOREIGN KEY (contract_id) REFERENCES doc_contract(id) ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS reg_loans;
CREATE TABLE reg_loans(
	contract_id BIGINT UNSIGNED NOT NULL,
	client_id BIGINT UNSIGNED NOT NULL,
	record_kind BIT COMMENT 'Вид движения: 0 - расход, 1 - приход',
	principal DECIMAL(15,2) COMMENT 'Основной долг',
	interest DECIMAL(15,2) COMMENT 'Проценты',
	period DATETIME NOT NULL,
	INDEX contract_idx(contract_id)
) COMMENT 'Таблица для начислений основного долга и процентов по займу';
ALTER TABLE reg_loans ADD CONSTRAINT fk_reg_loans_contract_id FOREIGN KEY (contract_id) REFERENCES doc_contract(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE reg_loans ADD CONSTRAINT fk_reg_loans_client_id FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE CASCADE;

-- объявляю триггер для проведения документа выдачи займа
Delimiter //
DROP TRIGGER IF EXISTS check_insert_create_contract//
CREATE TRIGGER check_insert_create_contract AFTER INSERT ON doc_contract
FOR EACH ROW
BEGIN
	IF  NEW.signed = 1  THEN -- если док-т подписан - делаем запись в регистр выдачи займа
		INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(NEW.id, NEW.client_id, 1, NEW.sum_loan, 0, NEW.contract_date);
	END IF;
END //
Delimiter ;

-- объявляю процедуру для начисления процента
/*
 * Процедура будет вызываться ежедневно по регламентному заданию
 */
Delimiter //
DROP PROCEDURE IF EXISTS interest_charges //
CREATE PROCEDURE interest_charges (IN operation_date DATETIME)
BEGIN
DECLARE contract, client INT;
DECLARE is_end INT DEFAULT 0;
DECLARE principal DECIMAL(15,2);
DECLARE interest_rate double;
DECLARE curcat CURSOR FOR
SELECT
	rl.contract_id,
	rl.client_id,
	SUM(IF (rl.record_kind = 1,rl.principal,rl.principal * (-1) )),
	MAX(COALESCE(p.interest,0)/100) AS interest_rate
FROM
	reg_loans rl JOIN doc_contract dc ON rl.contract_id = dc.id
	JOIN products p ON dc.product_id = p.id
WHERE
	rl.period < operation_date
GROUP BY
	rl.contract_id, rl.client_id
HAVING (SUM(IF (rl.record_kind = 1,rl.principal,rl.principal * (-1) ))>0);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
OPEN curcat;
cycle : LOOP
FETCH curcat INTO contract, client, principal, interest_rate;
IF is_end THEN
LEAVE cycle;
END IF;
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(contract, client, 1, 0, principal*interest_rate, operation_date);
END LOOP cycle;
CLOSE curcat;
END //
Delimiter ;

-- Создаю события для ежедневного начисления процента по выданным займам
/*
 * Вызывается каждый день в 00:00 часов
 */
DELIMITER |
DROP EVENT IF EXISTS e_daily|
CREATE EVENT e_daily ON SCHEDULE
       EVERY 1 DAY STARTS '2021-08-05 21:00:00'
       DISABLE
       COMMENT 'Регламентное начисление процента по займу'
       DO BEGIN
   call interest_charges(NOW());
END |
DELIMITER ;

-- Объявляю процедуру для обработки проведения документа погашения займа
/*
 * Триггер смотрит сколько надо погасить всего на данный момент процентов и основного долга
 * и в зависимости от того, сколько по факту внесено денег, распределяет проценты и основной долг
 */
Delimiter //
DROP PROCEDURE IF EXISTS create_repayment //
CREATE PROCEDURE create_repayment (IN repayment_sum DECIMAL(15,2), IN repayment_contr_id INT, IN period DATETIME)
BEGIN
DECLARE contract, client INT;
DECLARE is_end INT DEFAULT 0;
DECLARE principal, interest, sp_principal, sp_interest DECIMAL(15,2) DEFAULT 0;
DECLARE curcat CURSOR FOR
SELECT
	rl.contract_id,
	rl.client_id,
SUM(IF (rl.record_kind = 1, COALESCE(rl.principal,0), COALESCE(rl.principal,0) * (-1) )) as principal ,
SUM(IF (rl.record_kind = 1, COALESCE(rl.interest,0), COALESCE(rl.interest,0) * (-1) )) as interest
FROM
	reg_loans rl
WHERE
	rl.contract_id = repayment_contr_id and rl.period < period
GROUP BY
	contract_id, client_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
OPEN curcat;
cycle : LOOP
FETCH curcat INTO contract, client, principal, interest;
IF is_end THEN
LEAVE cycle;
END IF;
IF repayment_sum > (principal + interest) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Погашение не может быть больше суммы основного долга и процентов: ';
ELSE
	IF repayment_sum < interest THEN
		SET sp_interest = repayment_sum;
	ELSEIF repayment_sum = interest THEN
		SET sp_interest = interest;
	ELSE
		SET sp_interest = interest;
		SET sp_principal = repayment_sum - interest;
	END IF;
	INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(contract, client, 0, sp_principal, sp_interest, period);
END IF;
END LOOP cycle;
CLOSE curcat;
END //
Delimiter ;

-- объявляю триггер для проведения документа погашение займа
Delimiter //
DROP TRIGGER IF EXISTS check_insert_create_repayment//
CREATE TRIGGER check_insert_create_repayment AFTER INSERT ON doc_repayment
FOR EACH ROW
BEGIN
	IF  NEW.signed = 1  THEN -- если док-т подписан - делаем запись в регистр займа
		CALL create_repayment (NEW.sum_repayment, NEW.contract_id, NEW.repayment_date);
	END IF;
END//
Delimiter ;


-- Объявляю представление для просмотра среза по взятым займам и начисленным процентам
CREATE OR REPLACE VIEW current_loans AS
SELECT
	dc.contract_number as doc_number,
	CONCAT(c.firstname,' ', c.lastname) AS client,
SUM(IF (rl.record_kind = 1, COALESCE(rl.principal,0), COALESCE(rl.principal,0) * (-1) )) as principal ,
SUM(IF (rl.record_kind = 1, COALESCE(rl.interest,0), COALESCE(rl.interest,0) * (-1) )) as interest
FROM
	reg_loans rl
	join clients c on rl.client_id = c.id
	left join doc_contract dc on rl.contract_id = dc.id
GROUP BY
	rl.contract_id, rl.client_id
HAVING
	(SUM(IF (rl.record_kind = 1, COALESCE(rl.principal,0), COALESCE(rl.principal,0) * (-1) ))+SUM(IF (rl.record_kind = 1, COALESCE(rl.interest,0), COALESCE(rl.interest,0) * (-1) )))>0;

-- Объявляю представление для просмотра клиентов с просроченными договорами
CREATE OR REPLACE VIEW bad_loans AS
SELECT
	dc.contract_number as doc_number,
	CONCAT(c.firstname,' ', c.lastname) AS client,
	SUM(IF (rl.record_kind = 1, COALESCE(rl.principal,0), COALESCE(rl.principal,0) * (-1) )) as principal ,
	SUM(IF (rl.record_kind = 1, COALESCE(rl.interest,0), COALESCE(rl.interest,0) * (-1) )) as interest,
	MAX(dc.finish_date) as finish_date,
	MAX(TIMESTAMPDIFF(DAY,dc.finish_date,CURRENT_TIMESTAMP)) as DAYS
FROM
	reg_loans rl
	join clients c on rl.client_id = c.id
	left join doc_contract dc on rl.contract_id = dc.id
GROUP BY
	rl.contract_id, rl.client_id
HAVING
	(SUM(IF (rl.record_kind = 1, COALESCE(rl.principal,0), COALESCE(rl.principal,0) * (-1) ))+SUM(IF (rl.record_kind = 1, COALESCE(rl.interest,0), COALESCE(rl.interest,0) * (-1) )))>0;

-- Объявляю представление для отчета по начисленным и выплаченным процентам за весь период
CREATE OR REPLACE VIEW interest_client AS
SELECT CONCAT(c.firstname,' ',c.lastname) , IF(rl1.record_kind =1,'Начислено процентов','Выплачено процентов') AS 'Показатель' ,SUM(rl1.interest) AS 'Значение'
FROM reg_loans rl1 join clients c ON rl1.client_id = c.id
GROUP BY rl1.client_id,rl1.record_kind ;