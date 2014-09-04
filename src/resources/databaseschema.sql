CREATE TABLE `FAQ` (
  `faqid` INTEGER NOT NULL AUTO_INCREMENT,
  `userid` INTEGER NOT NULL,
  `faqcategory` INTEGER NOT NULL,
  `question` LONGTEXT DEFAULT NULL,
  `answer` LONGTEXT DEFAULT NULL,
  `createdate` varchar(255) DEFAULT NULL,
  `createby` bigint(20) DEFAULT NULL,
  `updatedate` varchar(255)  DEFAULT NULL,
  `updateby` bigint(20) DEFAULT NULL,
  `deleted` INTEGER DEFAULT 0,
  PRIMARY KEY (`faqid`)
) 

CREATE TABLE `FAQCATEGORY` (
  `faqcategoryid` INTEGER NOT NULL AUTO_INCREMENT,
  `faqcategoryname` varchar(255) DEFAULT NULL,
  `createdate` varchar(255) DEFAULT NULL,
  `createby` bigint(20) DEFAULT NULL,
  `updatedate` varchar(255)  DEFAULT NULL,
  `updateby` bigint(20) DEFAULT NULL,
  `deleted` INTEGER DEFAULT 0,
  PRIMARY KEY (`faqcategoryid`)
)

CREATE TABLE `USER` (
  `userid` INTEGER NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` LONGTEXT DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `createdate` varchar(255) DEFAULT NULL,
  `createby` bigint(20) DEFAULT NULL,
  `updatedate` varchar(255)  DEFAULT NULL,
  `updateby` bigint(20) DEFAULT NULL,
  `deleted` INTEGER DEFAULT 0,
  PRIMARY KEY (`userid`)
) 

CREATE TABLE `MESSAGE` (
  `messageid` INTEGER NOT NULL AUTO_INCREMENT,
  `senderid` INTEGER NOT NULL,
  `sentdate` DATE NOT NULL,
  `subject` LONGTEXT DEFAULT NULL,
  `content` LONGTEXT DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL, -- may be draft, sent or something else
  `important` INTEGER NOT NULL,
  `createdate` varchar(255) DEFAULT NULL,
  `createby` bigint(20) DEFAULT NULL,
  `updatedate` varchar(255)  DEFAULT NULL,
  `updateby` bigint(20) DEFAULT NULL,
  `deleted` INTEGER DEFAULT 0,
  PRIMARY KEY (`messageid`)
); 

CREATE TABLE `MESSAGERECIPIENT` (
  `messagerecipientid` INTEGER NOT NULL AUTO_INCREMENT,
  `recipientid` INTEGER NOT NULL,
  `messageid` INTEGER NOT NULL,
  `viewed` INTEGER NOT NULL,
  `createdate` varchar(255) DEFAULT NULL,
  `createby` bigint(20) DEFAULT NULL,
  `updatedate` varchar(255)  DEFAULT NULL,
  `updateby` bigint(20) DEFAULT NULL,
  `deleted` INTEGER DEFAULT 0,
  PRIMARY KEY (`messagerecipientid`)
);

alter table user add column ENABLED INTEGER;
alter table user drop column ENABLED

alter table user add column ENABLED TINYINT(1) NOT NULL;

INSERT INTO user (USERID, USERNAME,PASSWORD, ENABLED)
VALUES (100, 'mahesh', '24251', TRUE);

INSERT INTO user_roles (USER_ROLE_ID, USERID,AUTHORITY)
VALUES (2, 100, 'ROLE_USER');

INSERT INTO user(username,password,enabled)
VALUES ('mkyong','123456', TRUE);
INSERT INTO user(username,password,enabled)
VALUES ('alex','123456', TRUE);

CREATE TABLE `user_roles` (
  `USER_ROLE_ID` INTEGER NOT NULL AUTO_INCREMENT,
  `USERID` INTEGER NOT NULL,
  `AUTHORITY` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`)
);

INSERT INTO user_roles (USER_ROLE_ID, USERID,AUTHORITY)
VALUES (1, 1, 'ROLE_USER');

drop table user_roles;

CREATE TABLE user_roles (
  user_role_id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  ROLE VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (ROLE,username));

  INSERT INTO user_roles (username, ROLE)
VALUES ('mkyong', 'ROLE_USER');
INSERT INTO user_roles (username, ROLE)
VALUES ('mkyong', 'ROLE_ADMIN');
INSERT INTO user_roles (username, ROLE)
VALUES ('alex', 'ROLE_USER');
  
INSERT INTO `dost`.`user` (`userid`, `username`, `password`, `role`, `userrole`) VALUES ('1', 'satya', '123', 'USER', 'USER');
INSERT INTO `dost`.`user` (`userid`, `username`, `password`, `role`, `userrole`) VALUES ('2', 'richa', '123', 'COUNSELOR', 'COUNSELOR');

ALTER TABLE faq modify userid BIGINT NOT NULL DEFAULT 100;

insert into faqcategory (faqcategoryid, faqcategoryname, deleted) values(2,'family',0);

--message 1
--alex sending to mkyong
INSERT INTO `dost`.`message` (`messageid`, `senderid`, `sentdate`, `subject`, `content`, `important`, `deleted`) VALUES ('1', '102', NOW(), 'Test message', 'Full test message', '0', '0');
INSERT INTO `dost`.`messagerecipient` (`messagerecipientid`, `recipientid`, `messageid`, `viewed`, `deleted`) VALUES ('1', '101', '1', '0', '0');


--message 2
--mkyong sending to alex
INSERT INTO `dost`.`message` (`messageid`, `senderid`, `sentdate`, `subject`, `content`, `important`, `deleted`) VALUES ('2', '101', NOW(), 'Test message reply', 'Full test message reply', '0', '0');
INSERT INTO `dost`.`messagerecipient` (`messagerecipientid`, `recipientid`, `messageid`, `viewed`, `deleted`) VALUES ('2', '102', '2', '0', '0');

alter table message add column msgid INTEGER;

UPDATE `dost`.`message` SET `msgid`='1' WHERE `messageid`='1';
UPDATE `dost`.`message` SET `msgid`='1' WHERE `messageid`='2';

alter table user_roles add column userid INTEGER;
UPDATE `dost`.`user_roles` SET `userid`='102' WHERE `user_role_id`='3';
UPDATE `dost`.`user_roles` SET `userid`='101' WHERE `user_role_id`='2';

alter table user_roles drop column dbUser;

ALTER TABLE message MODIFY sentdate DATETIME NULL DEFAULT NOW();

CREATE TRIGGER message_OnInsert BEFORE INSERT ON `message`
    FOR EACH ROW SET NEW.sentdate = NOW();
    
INSERT INTO `dost`.`user` (`userid`, `username`, `password`, `deleted`, `ENABLED`) VALUES ('103', 'sohil', '123456', '0', '1');
insert into user_roles values(4,'sohil', 'ROLE_USER', 103);
    
INSERT INTO `dost`.`user` (`userid`, `username`, `password`, `deleted`, `ENABLED`) VALUES ('104', 'prashant', '123', '0', '1');
insert into user_roles values(5,'prashant', 'ROLE_ADMIN', 104);

alter table user add column avatar varchar(100);
--DDL to add discussion topics with huge text
ALTER TABLE jforum_topics MODIFY topic_title TEXT(65536)

--Creating DDL for security questions
CREATE TABLE `security_question` (
  `question_id` INTEGER NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `createdate` varchar(255) DEFAULT NULL,
  `createby` bigint(20) DEFAULT NULL,
  `updatedate` varchar(255)  DEFAULT NULL,
  `updateby` bigint(20) DEFAULT NULL,
  `deleted` INTEGER DEFAULT 0,
  PRIMARY KEY (`question_id`)
);

insert into security_question values(1, 'What is your nick name', '', 0, '', 0, 0)
insert into security_question values(2, 'What is you first school’s name', '', 0, '', 0, 0)
insert into security_question values(3, 'Which city are you born in', '', 0, '', 0, 0)
insert into security_question values(4, 'What was your maternal grandfather’s first name', '', 0, '', 0, 0)
insert into security_question values(5, 'In what city or town does your nearest sibling live', '', 0, '', 0, 0)
insert into security_question values(6, 'What was the name of your elementary / primary school', '', 0, '', 0, 0)
insert into security_question values(7, 'In what city or town does your nearest sibling live', '', 0, '', 0, 0)

