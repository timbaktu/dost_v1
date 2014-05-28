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