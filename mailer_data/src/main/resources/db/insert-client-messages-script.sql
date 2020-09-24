use mailer_app;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `client`;
TRUNCATE TABLE `message`;
TRUNCATE TABLE `address_book`;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `mailer_app`.`address_book`(`id`, `name`)
VALUES(5, 'Alpha');

INSERT INTO `mailer_app`.`client`(`client_id`,`firstname`,`lastname`,`email`,`addressBook_id`)
VALUES(2, 'Micheal', 'Gilbert', 'mike@mail.com', 5),
(3, 'Micheal', 'Gilbert', 'mike@mail.com',5), 
(4, 'Micheal', 'Gilbert', 'mike@mail.com',5),
(10, 'Micheal', 'Gilbert', 'mike@mail.com',5);

INSERT INTO `mailer_app`.`message`(`message_id`,`subject`,`body`)
VALUES(8, 'Test message', 'This is a test message'),
(9, 'Test message 2', 'This is a another message 2'),
(10, 'Test message 3', 'This is a another message 3');





