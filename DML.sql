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

-- ****************
INSERT INTO `clients` VALUES (1,'Shaniya','Heidenreich','reynolds.laisha@blandabernier.com',89832572563),(2,'Madalyn','Little','oberbrunner.georgianna@hotmail.com',88811712626),(3,'Melba','Bednar','renee52@gmail.com',88533255231),(4,'Darrell','Kohler','udibbert@leffler.net',88679610925),(5,'Leslie','Hagenes','daron.olson@gmail.com',89891293655),(6,'Leo','Purdy','ida51@gmail.com',88923053897),(7,'Ernestine','Roberts','ferry.sonny@gmail.com',88441553474),(8,'Rusty','Eichmann','ischoen@metztorphy.biz',88395642605),(9,'Madelynn','Abernathy','herman.trisha@hotmail.com',88449337513),(10,'Anabel','Fadel','creilly@yahoo.com',89584559956),(11,'Herminio','Kautzer','ondricka.patrick@gmail.com',89284793963),(12,'Yoshiko','Kuvalis','o\'conner.kaitlin@yahoo.com',88459639134),(13,'Danny','Howe','kuphal.william@hotmail.com',89386481290),(14,'Greg','Schmeler','rogahn.bell@kuhlman.com',89936796924),(15,'Ezra','Franecki','matilde.muller@yahoo.com',88520193225),(16,'Sheila','Lakin','alexane.sanford@gmail.com',88336712182),(17,'Joseph','Lockman','jorge.klein@herzogdouglas.com',88986321111),(18,'Daisy','Murray','imelda.mayert@kessler.org',88979743703),(19,'Avery','Hettinger','cormier.eliezer@fadel.info',89189977452),(20,'Jodie','Nader','colton.jenkins@klockotromp.net',89076480843);
INSERT INTO `addresses` VALUES (1,'Maryland','Emmettbury','2155 Franecki Center Apt. 135\nNew Vito, KY 53925',1,'1983-03-20 22:47:57'),(2,'Oregon','Kozeyshire','23257 Corkery Meadow\nNew Darrin, HI 08569',2,'2015-12-20 13:15:34'),(3,'Nevada','North Austenport','94717 Britney Common Apt. 020\nEast Bobbymouth, IA 55118',3,'1971-05-07 06:57:59'),(4,'NewJersey','Port Fern','52583 Reynold Forest Suite 359\nGrimesside, DE 69677',4,'1979-08-10 15:10:16'),(5,'Tennessee','Delilahberg','24412 Ledner Stream Apt. 031\nLouisachester, WI 19155',5,'1981-06-29 04:55:31'),(6,'Utah','Jasperhaven','0020 Rossie Cove Suite 012\nQuincyport, WI 03313-7513',6,'2007-06-03 01:24:18'),(7,'Wyoming','Filibertomouth','87359 Stamm Park Apt. 732\nWest Jailynbury, VA 27910-8528',7,'2004-12-04 11:27:55'),(8,'Arizona','Sarinaside','608 Deshawn Islands Apt. 066\nBinsville, MN 80546',8,'1997-04-09 08:15:06'),(9,'Kentucky','Runtestad','513 Cormier Turnpike Apt. 216\nLake Gerson, AL 27594',9,'1976-12-05 04:29:11'),(10,'NorthCarolina','Port Anissa','21357 Haley Brooks\nBogisichview, OH 44263-4886',10,'1972-09-22 17:49:01'),(11,'Connecticut','Port Sarai','54018 Hammes Ports Apt. 767\nCrawfordland, FL 39972-9594',11,'2019-03-13 05:44:53'),(12,'Michigan','West Samirside','9334 Cummerata Station\nEldredmouth, NC 73295-7492',12,'1979-10-04 07:28:36'),(13,'California','Schillerside','702 Myrtice Knoll\nBergstromport, SD 79831',13,'2001-07-06 01:39:58'),(14,'Arkansas','Port Jesse','200 Bednar View\nJustinachester, WA 63213-1701',14,'1982-02-18 08:58:15'),(15,'Utah','East Dewayne','786 Hayes Courts Apt. 963\nNorth Tatyana, ME 16411',15,'1985-07-11 06:19:16'),(16,'Tennessee','South Osvaldo','425 Reinger Harbor\nSouth Melvina, MS 55211-6100',16,'1979-11-03 16:49:38'),(17,'Florida','Malikamouth','8601 Lera Underpass Apt. 106\nWest Lailaburgh, FL 34904',17,'1980-04-04 18:32:50'),(18,'Georgia','West Edgarland','75023 Dessie Mountains\nBatzchester, AR 31150',18,'1974-04-30 19:36:32'),(19,'NewYork','Candidafort','765 Ona Extensions\nLake Arden, CA 72452',19,'1970-02-18 17:11:43'),(20,'Kentucky','Lake Alex','0386 Rice Green\nPricebury, MD 06349-0187',20,'2017-06-22 20:09:35'),(21,'Arkansas','Christiansenburgh','1723 Sophia Curve\nPort Pat, KY 16799-8291',1,'2002-11-26 05:51:39'),(22,'NewJersey','Theoside','4357 Thad Ridge Suite 091\nEast Ernest, OK 11951',2,'2011-06-08 05:55:45'),(23,'Iowa','Denesikfort','85570 Wehner Manors\nNew Wilson, NH 39722-6727',3,'1984-02-20 05:33:25'),(24,'Minnesota','Lake Verlaland','076 Gino Unions\nNorth Madalyn, CO 95510-0794',4,'1974-12-01 02:33:59'),(25,'Delaware','Lake Tellytown','56659 Douglas Orchard\nEast Genoveva, MA 29844',5,'1987-09-03 21:13:34');
INSERT INTO `files` VALUES (1,1,1,'eaque',167,NULL,'2013-02-08 21:03:37','1975-09-25 22:33:49'),(2,2,1,'est',91,NULL,'2011-04-16 01:45:02','1981-05-18 22:50:11'),(3,3,1,'et',175,NULL,'2011-12-19 06:13:22','1973-08-04 08:39:08'),(4,4,1,'est',79,NULL,'1990-04-03 06:09:06','1983-07-27 14:51:08'),(5,5,1,'beatae',208,NULL,'1980-01-12 05:42:52','1981-12-06 07:18:16'),(6,6,1,'dolorem',166,NULL,'1992-11-17 09:08:14','1981-04-25 08:27:13'),(7,7,1,'nihil',95,NULL,'1981-01-26 15:45:42','2021-02-07 18:23:35'),(8,8,1,'esse',168,NULL,'1991-11-06 14:01:20','2015-11-20 09:46:43'),(9,9,1,'eaque',158,NULL,'1985-04-11 09:02:27','2018-12-13 01:40:53'),(10,10,1,'illum',245,NULL,'1987-11-27 16:26:42','1982-10-10 08:17:17'),(11,11,1,'itaque',241,NULL,'1976-02-23 19:28:35','2007-03-28 00:04:50'),(12,12,1,'corrupti',92,NULL,'1994-04-15 15:32:27','1985-01-13 05:35:30'),(13,13,1,'praesentium',203,NULL,'2000-10-14 10:32:47','1993-02-03 04:17:16'),(14,14,1,'dicta',109,NULL,'2000-10-13 19:24:25','1977-11-22 01:54:22'),(15,15,1,'nobis',254,NULL,'2020-07-02 15:04:11','1989-12-13 06:16:50'),(16,16,1,'facere',78,NULL,'1976-06-13 01:20:03','1987-12-21 09:44:42'),(17,17,1,'autem',100,NULL,'1996-11-08 03:01:33','1977-02-24 15:08:22'),(18,18,1,'voluptatem',58,NULL,'1981-06-18 11:27:01','2021-02-24 17:40:59'),(19,19,1,'temporibus',227,NULL,'1974-10-04 09:37:33','2003-09-08 17:02:04'),(20,20,1,'qui',67,NULL,'1992-06-27 20:38:21','1971-10-27 13:34:12');
INSERT INTO `contact_information` VALUES (1,1,89803908424,'Joyce','Laboriosam atque fuga maxime consequuntur quia. Et quia et id ut temporibus fugit. Et voluptas sint sed consequuntur cum fugiat. Quia voluptates et illum aut dolorem.','1991-04-16 06:17:05'),(2,2,89032723363,'Deontae','Aut reprehenderit occaecati quasi commodi. Explicabo ipsum perferendis eligendi vel id praesentium sed. Et saepe eum accusamus mollitia et. In et ullam aperiam dolorem aut est.','2002-10-19 10:49:22'),(3,3,89866396268,'Alfredo','Magnam ea dolorum molestiae consequatur provident. Ut consequatur ipsam consequatur maxime optio a nihil consequatur. Rerum autem sed consequatur et libero fugit.','2011-11-23 20:05:09'),(4,4,88725601970,'Hallie','Rerum tempore vel doloremque expedita aperiam molestiae commodi. Animi distinctio vitae vitae possimus est nostrum atque sunt. Atque necessitatibus porro est suscipit rem ea pariatur.','1981-09-23 13:51:00'),(5,5,89894234918,'Bianka','Dicta fugit deserunt perspiciatis quia doloremque ad reiciendis. Voluptatem corrupti esse perferendis cupiditate consectetur quam aut. Repellat voluptate quibusdam dicta alias. Nam et sed commodi ut ut similique.','1986-05-29 14:09:31'),(6,6,89375513041,'Myrtie','Itaque aperiam molestiae qui commodi et architecto et. Ipsam iste aut dolorem velit minus et nesciunt. Consectetur facere ducimus non similique natus cumque quia. At dolor porro magni quo ab consequatur.','1998-02-18 05:33:22'),(7,7,89427736727,'Hallie','Nihil tenetur laudantium eius. Ut ea assumenda hic aut. Et quis quia recusandae.','2009-03-31 10:57:39'),(8,8,89726532280,'Arthur','Sint dicta iure quibusdam saepe. Tenetur aperiam saepe unde saepe optio delectus est voluptas.','2005-02-10 11:02:53'),(9,9,88658193968,'Tianna','Non non hic et et magnam eveniet. Et voluptas itaque quaerat suscipit quo dolor. Rerum quos illo hic beatae corporis eaque alias. A quia asperiores non ratione suscipit.','2017-03-25 11:53:21'),(10,10,89795846991,'Elwyn','Autem quia distinctio et odit. Sit eveniet perferendis libero corporis velit rem laudantium. Maiores sint commodi maxime qui fugit reprehenderit minus.','1975-03-26 18:21:06'),(11,11,89292610578,'Einar','Commodi qui iure magni ipsa culpa perspiciatis et et. Non ipsam maxime ut similique facere. Mollitia aut aliquid ad non eaque aut.','2009-07-23 08:29:14'),(12,12,89367944322,'Tremaine','Officiis quis iste temporibus beatae dolorem pariatur ab. Pariatur voluptas eaque accusamus. Fuga optio praesentium ab voluptates iure corporis rerum.','2012-07-03 02:09:19'),(13,13,88547637496,'Hazel','Sint sunt dolor numquam sunt. Id nulla est quae tempore eos aspernatur. Quam quidem quam tempore tempora similique aut distinctio.','1972-04-16 11:39:50'),(14,14,89546149891,'Janiya','Sint aliquid molestiae mollitia debitis unde aliquam. Modi aut commodi nam alias et tempora quis. Quam distinctio numquam autem aut enim asperiores. Reprehenderit ad dolores architecto vitae aliquid aut.','2002-05-04 11:56:40'),(15,15,88630597202,'Conrad','Rerum rerum deleniti qui tempora soluta vitae. Commodi et eos repudiandae et quae voluptatem ab. Numquam et quis libero expedita repellendus est dolorem. Omnis reprehenderit voluptas dolor vel temporibus.','1987-01-14 23:15:08'),(16,16,88396912579,'Selmer','Reiciendis assumenda error laudantium pariatur et rerum. Est atque rerum voluptatem accusantium illo voluptatem nihil. At rerum ipsum illum consequatur eos. Quae dolore libero nulla et voluptate voluptate repudiandae.','1972-06-30 07:05:25'),(17,17,89432484040,'Maeve','Debitis harum ipsum et quia eveniet eligendi aut. Commodi explicabo dolore animi doloribus error laudantium in. Minus et voluptas officiis iusto qui.','1991-06-22 14:10:35'),(18,18,88653754111,'Eli','Est velit fuga quia libero sapiente. Omnis ipsum aut quia sed minima dolorem ut. Laboriosam illo est omnis.','2008-11-11 23:28:41'),(19,19,89315361917,'Maurine','Sit nesciunt voluptatibus porro numquam perferendis recusandae. Sit doloribus illo voluptatem at assumenda. Quam possimus qui sit et.','1980-07-04 16:11:57'),(20,20,88551553641,'Clint','Magnam ipsa optio repellendus. Beatae eum voluptate necessitatibus consequatur itaque qui voluptas.','1996-11-26 23:30:17'),(21,1,88743410602,'Alda','Cupiditate maiores rem velit velit quia. Aperiam optio ut laborum id. Pariatur minus excepturi enim provident quasi.','2012-04-15 07:07:07'),(22,2,89844520638,'Demetrius','Nam assumenda deleniti beatae eos quae accusantium rerum. Pariatur voluptates ad minima neque dolorum quis sunt deserunt. Rem corporis consectetur minus quia est. Amet doloribus aut illum voluptas sunt eveniet minus.','2000-04-07 19:21:53'),(23,3,88540507577,'Camden','Maxime provident distinctio maxime maxime repudiandae non dolorum alias. Sint est aliquam debitis rerum. Ut eum voluptatibus repellendus quod sint.','2011-03-20 00:41:17'),(24,4,89111138189,'Bonnie','Aspernatur quos expedita autem nostrum quis unde. Quod incidunt est molestiae qui explicabo dignissimos delectus. Repellat veniam fuga possimus et. Sapiente corporis eligendi sit ducimus quas.','1990-09-04 02:34:22'),(25,5,88533934173,'Joyce','Saepe dicta ducimus animi accusantium voluptatem molestiae repudiandae. Illo optio libero qui incidunt error. Doloremque perferendis natus dicta facere.','2012-04-14 18:15:57');
INSERT INTO `profiles` VALUES (1,'f','2003-04-28',1,1,1,'1971-07-20 17:01:59','2020-01-11 15:59:48'),(2,'m','1989-02-27',2,2,2,'2009-02-10 19:41:00','1971-11-11 04:30:58'),(3,'f','2015-03-12',3,3,3,'1987-02-09 11:58:12','2015-06-29 07:12:24'),(4,'m','1984-07-12',4,4,4,'2017-01-10 22:29:58','1978-09-27 21:47:50'),(5,'m','2018-11-14',5,5,5,'2008-10-18 08:22:14','2004-10-06 16:27:44'),(6,'m','2019-11-18',6,6,6,'1989-09-20 11:53:58','2006-12-23 15:27:19'),(7,'f','1974-06-13',7,7,7,'2012-10-01 05:45:36','2016-01-05 19:23:45'),(8,'f','2007-08-05',8,8,8,'1975-12-29 20:09:55','1985-05-02 15:46:15'),(9,'m','2002-04-04',9,9,9,'1986-10-23 06:02:07','1974-09-03 03:53:22'),(10,'f','2000-07-03',10,10,10,'2018-09-01 10:49:20','2020-09-27 05:54:02'),(11,'m','1989-12-04',11,11,11,'1999-11-24 14:52:27','1992-01-02 02:09:51'),(12,'f','1988-09-18',12,12,12,'2001-09-06 20:49:38','1971-05-28 22:09:23'),(13,'f','1986-01-27',13,13,13,'1970-09-23 01:36:20','2017-04-06 15:17:44'),(14,'f','1992-10-12',14,14,14,'2002-07-14 21:38:53','1997-05-17 16:54:45'),(15,'m','2008-09-03',15,15,15,'1974-10-23 21:12:37','2011-04-16 15:22:32'),(16,'m','1989-05-11',16,16,16,'2009-12-13 19:56:48','1988-08-02 14:01:25'),(17,'f','2008-09-05',17,17,17,'1981-12-23 00:16:15','2016-08-27 23:28:40'),(18,'f','1981-05-24',18,18,18,'2003-01-02 19:32:14','2005-05-25 09:15:22'),(19,'f','1981-01-27',19,19,19,'2007-05-31 05:00:49','2009-10-14 10:35:21'),(20,'m','2011-04-21',20,20,20,'2009-01-09 05:13:42','1995-07-17 06:53:38');
-- ******

-- 1 клиент
INSERT INTO clients (firstname, lastname, email, phone) VALUES ('Иван', 'Иванов','1@dsfds.ru','89887474789');
SET @cl_id =last_insert_id();
SET @first_cl_id =last_insert_id();

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
SET @second_cl_id =last_insert_id();

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

-- ****************************************************************************************************************
-- 3 клиент
-- ****************************************************************************************************************
INSERT INTO clients (firstname, lastname, email, phone) VALUES ('Сергей', 'Швыряев','5@dssgf.ru','89896847325');
SET @cl_id =last_insert_id();
SET @third_cl_id =last_insert_id();

INSERT INTO addresses (region, city, address, client_id) VALUES('Краснодарский край', 'Новороссийск', 'Лейтенанта Шмидта 12', @cl_id);
SET @actual_address = last_insert_id();
INSERT INTO addresses (region, city, address, client_id) VALUES('Республика крым', 'Симферополь', 'Гагарина 69', @cl_id);
SET @reg_address = last_insert_id();

INSERT INTO files VALUES (NULL,@cl_id,1,'0003',96,NULL,NULL,NULL);
SET @ph_id =last_insert_id();

INSERT INTO contact_information VALUES (NULL, @cl_id, 89281245789,'Смирнов Никита Олегович', 'Отец',Null);
INSERT INTO contact_information VALUES (NULL, @cl_id, 89799874582,'Швыряева Дана Борисова', 'Мать',Null);


INSERT INTO profiles VALUES (@cl_id, 'm','1995-04-28',@actual_address, @reg_address,@ph_id,NOW(),NOW());

-- *****************************************************************************************************************
-- Выдаем займы
-- 1 клиент
INSERT INTO doc_contract VALUES (NULL, 'мкк-000001', '2021-01-21', @first_cl_id, 1, 10000, '2021-02-06',0); -- Выдаем не подписанный займ (не активный)
INSERT INTO doc_contract VALUES (NULL, 'мкк-000002', '2021-01-25', @first_cl_id, 1, 12000, '2021-02-10',1); -- Выдаем подписанный займ

SET @contr_id = LAST_INSERT_ID();
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 120, '2021-01-26 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 120, '2021-01-27 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 120, '2021-01-28 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000001', '2021-01-28 15:00:00', @first_cl_id, @contr_id, 6000,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 63.6, '2021-01-29 01:00:00'); -- начисляем проценты

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000002', '2021-01-29 10:00:00', @first_cl_id, @contr_id, 4000,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-01-30 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-01-31 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-01 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-02 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-04 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-05 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-06 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-07 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-08 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-09 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-10 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-11 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-12 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-13 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-14 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-15 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-16 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @first_cl_id, 1, 0, 24.24, '2021-02-17 01:00:00');

-- 2 клиент
INSERT INTO doc_contract VALUES (NULL, 'мкк-000003', '2021-01-15', @second_cl_id, 1, 8000, '2021-01-31',1); -- Выдаем займ
SET @contr_id = LAST_INSERT_ID();

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-01 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-02 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-03 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-04 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-05 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-06 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-07 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-08 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-09 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-10 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-11 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-12 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-13 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 80, '2021-02-14 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000003', '2021-02-14 11:00:00', @second_cl_id, @contr_id, 4000,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 51.20, '2021-02-15 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000004', '2021-02-15 17:00:00', @second_cl_id, @contr_id, 500,1); -- гасим часть займа

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 46.71, '2021-02-16 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @second_cl_id, 1, 0, 46.71, '2021-02-17 01:00:00');

INSERT INTO doc_repayment VALUES (NULL, 'мкк-000005', '2021-02-17 11:00:00', @second_cl_id, @contr_id, 4764.62,1); -- гасим весь займ

-- 3 клиент
INSERT INTO doc_contract VALUES (NULL, 'мкк-000004', '2021-02-10', @third_cl_id, 2, 15000, '2021-03-14',1); -- Выдаем займ
SET @contr_id = LAST_INSERT_ID();

INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-11 01:00:00'); -- начисляем проценты
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-12 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-13 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-14 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-15 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-16 01:00:00');
INSERT INTO reg_loans(contract_id, client_id, record_kind, principal, interest, period) VALUES(@contr_id, @third_cl_id, 1, 0, 142.5, '2021-02-17 01:00:00');


