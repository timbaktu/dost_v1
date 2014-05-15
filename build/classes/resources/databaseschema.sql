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



INSERT INTO `dost`.`user` (`userid`, `username`, `password`, `role`, `userrole`) VALUES ('1', 'satya', '123', 'USER', 'USER');
INSERT INTO `dost`.`user` (`userid`, `username`, `password`, `role`, `userrole`) VALUES ('2', 'richa', '123', 'COUNSELOR', 'COUNSELOR');