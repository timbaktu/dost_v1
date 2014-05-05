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