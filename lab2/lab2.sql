CREATE TABLE `departmemnt` (
  `DeptId` int(11) NOT NULL,
  `DeptName` varchar(25) NOT NULL,
  `DeptOffice` varchar(5) NOT NULL,
  `DeptPhone` varchar(25) DEFAULT NULL,
  `DeptSupervisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`DeptId`),
  UNIQUE KEY `DeptId_UNIQUE` (`DeptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `employee` (
  `EmplId` int(11) NOT NULL AUTO_INCREMENT,
  `EmplFname` varchar(25) NOT NULL,
  `EmplLname` varchar(25) NOT NULL,
  `EmplOffice` varchar(5) NOT NULL,
  `EmplPhone` varchar(25) DEFAULT NULL,
  `EmplDept` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmplId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=cp1250;
CREATE TABLE `project` (
  `ProjectId` int(11) NOT NULL,
  `ProjectClient` varchar(15) NOT NULL,
  `ProjectLead` int(11) DEFAULT NULL,
  `ProjectContactPhone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
