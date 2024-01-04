CREATE TABLE BINI_P_KURIAKOSE (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO BINI_P_KURIAKOSE 
VALUES 
('PERIOD_1',null,null,null,null,null,null), 
('PERIOD_2',null,11,11,null,11,11),
('PERIOD_3',null,12,12,null,12,null), 
('PERIOD_4',12,null,null,12,null,null),
('PERIOD_5',12,null,null,11,null,12),
('PERIOD_6',11,11,null,null,null,null),
('PERIOD_7',11,null,12,null,11,null),  
('PERIOD_8',null,null,11,null,12,null);

CREATE TABLE KARUPPASAMY_A (
  PERIOD_DAYS  varchar(15),
  MONDAY varchar(10),
  TUESDAY varchar(10), 
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO KARUPPASAMY_A
VALUES
('PERIOD_1',11,12,11,12,11,12),
('PERIOD_2',null,null,null,null,null,null),
('PERIOD_3',null,null,null,null,null,11),
('PERIOD_4',null,null,null,null,null,null),
('PERIOD_5',null,12,null,12,11,null), 
('PERIOD_6',12,null,null,null,12,null),
('PERIOD_7',12,11,null,null,null,11), 
('PERIOD_8',null,11,12,11,null,null);

CREATE TABLE RADHA_LAKSHMI_P (
  PERIOD_DAYS  varchar(15),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO RADHA_LAKSHMI_P
VALUES
('PERIOD_1','11_ACC','12_ACC','11_ACC','12_ACC','11_ACC','12_ACC'),
('PERIOD_2',null,null,null,'11_BST',null,null),
('PERIOD_3','11_BST','12_BST','12_BST',null,'12_BST','11_ACC'),
('PERIOD_4','12_BST','11_BST','11_BST','12_BST','11_BST','11_BST'),
('PERIOD_5','12_BST','12_ACC','11_BST','12_ACC','11_ACC','12_BST'), 
('PERIOD_6','12_ACC',null,null,null,'12_ACC','11_BST'),
('PERIOD_7','12_ACC','11_ACC','12_BST','11_BST',null,'11_ACC'), 
('PERIOD_8',null,'11_ACC','12_ACC','11_ACC','12_BST',null);

CREATE TABLE SUSAN_SOBI (
  PERIOD_DAYS  varchar(15),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO SUSAN_SOBI
VALUES
('PERIOD_1',12,'10B',12,'10B',12,null),
('PERIOD_2',null,null,'9E',11,'9E',null),
('PERIOD_3',11,null,null,12,null,12),
('PERIOD_4',null,11,11,null,11,11),
('PERIOD_5','10B','10C',11,null,12,null), 
('PERIOD_6',null,null,12,null,null,11),
('PERIOD_7',null,12,null,11,'10C','9E'), 
('PERIOD_8','10C',12,null,12,null,'10B');

CREATE TABLE SUSANNA_ABRAHAM (
  PERIOD_DAYS  varchar(15),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO SUSANNA_ABRAHAM
VALUES
('PERIOD_1','10D',11,null,11,'10D',11),
('PERIOD_2',12,null,12,'10A',12,null),
('PERIOD_3','10A','10B',11,'10B',11,null),
('PERIOD_4',null,null,null,null,null,null),
('PERIOD_5',11,'10A','10B','10D',null,null), 
('PERIOD_6','10B',12,'11-A','11-A','11-A','10B'),
('PERIOD_7',null,'10D','10A',12,'10A',null), 
('PERIOD_8','11-A',null,'10D',null,null,null);

CREATE TABLE BHASWATI_CHATTOPADHYAY (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO BHASWATI_CHATTOPADHYAY
VALUES 
('PERIOD_1','10A','10A','10A','10A','10A','10A'),
('PERIOD_2',11,null,null,'10D',null,null),
('PERIOD_3',12,11,'10D',11,'10D','10D'),
('PERIOD_4',null,12,12,null,12,12),
('PERIOD_5',null,11,null,null,'10-MSC',11), 
('PERIOD_6','10D','10D','10A',12,null,null),
('PERIOD_7',null,null,11,'10D','10D',12), 
('PERIOD_8','10A',null,null,null,11,null);

CREATE TABLE RESHMA_ANIL_KUMAR (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO RESHMA_ANIL_KUMAR
VALUES 
('PERIOD_1','11-CS','11-IP','11-CS','11-IP','11-CS','11-IP'),
('PERIOD_2',null,null,'9D',null,'10C','10B'),
('PERIOD_3','10C',null,'11-IP',null,'11-IP','11-CS'),
('PERIOD_4','9B',null,null,'9B',null,null),
('PERIOD_5','11-IP',null,null,null,'11-CS',null), 
('PERIOD_6',null,null,'11-IP','11-IP','11-IP','10C'),
('PERIOD_7',null,'11-CS',null,'9D','10B','11-CS'), 
('PERIOD_8','11-IP','11-CS','10B','11-CS',null,null);

CREATE TABLE SWATI_AHLAWAT (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO SWATI_AHLAWAT 
VALUES 
('PERIOD_1',12,'9E',12,null,12,null),
('PERIOD_2',null,11,11,'9D',11,11),
('PERIOD_3',null,null,null,12,null,12),
('PERIOD_4','9C',null,null,null,null,null),
('PERIOD_5','9B',null,'9A',11,12,null), 
('PERIOD_6',11,11,12,'10C','10A','10D'),
('PERIOD_7',11,12,null,null,11,'10B'), 
('PERIOD_8',null,12,11,12,null,null);

CREATE TABLE JONES_SOLOMON_ROCHE_U (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO JONES_SOLOMON_ROCHE_U
VALUES 
('PERIOD_1',null,'12-SCI',null,'12-SCI',null,'12-SCI'),
('PERIOD_2','12-COM','12-COM','12-COM','12-COM','12-COM','12-COM'),
('PERIOD_3','10D',null,'10A','10D',null,null),
('PERIOD_4',null,null,null,null,null,null),
('PERIOD_5',null,'12-SCI','12-COM','12-SCI',null,null), 
('PERIOD_6','12-SCI','12-COM',null,null,'12-SCI','10A'),
('PERIOD_7','12-SCI',null,'10D','12-COM','12-COM',null), 
('PERIOD_8',null,null,'12-SCI',null,'10A',null);

CREATE TABLE ASHA_KRISHNAN (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO ASHA_KRISHNAN
VALUES 
('PERIOD_1','7B','11-A','7B','11-A','7B',11),
('PERIOD_2','8C',12,null,12,null,12),
('PERIOD_3',null,'8C','11-A',null,'11-A','7B'),
('PERIOD_4',null,'7B','8C','7B','8C',null),
('PERIOD_5','11-A',null,12,null,null,null), 
('PERIOD_6','8C',null,11,11,11,'8C'),
('PERIOD_7',null,'8C','7B','8C',12,null), 
('PERIOD_8',11,null,null,null,null,null);

CREATE TABLE HRUDAYA_RANI (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO HRUDAYA_RANI
VALUES 
('PERIOD 1','10B',null,'10B','8C','10B','8C'),
('PERIOD 2','9C','10D',null,'6F','10A',null),
('PERIOD 3',null,null,'7E','8B',null,null),
('PERIOD 4','6D','7D','9B','6E','6E',null),
('PERIOD 5',null,'6D',null,null,'10-MSC','9B'), 
('PERIOD 6','7E',null,'8B','10D','9C','7D'),
('PERIOD 7','9B','8A','6F',null,'8A','9C'), 
('PERIOD 8',null,null,null,'9B',null,null);



CREATE TABLE SMITHA_MATHEW (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO SMITHA_MATHEW
VALUES 
('PERIOD 1',null,'10D','10D','9E','9E','9C'),
('PERIOD 2','10A','8E',null,'10C','10B','8C'),
('PERIOD 3','8E',null,'10C','8C',null,null),
('PERIOD 4','8C','8C',null,null,null,null),
('PERIOD 5',null,null,null,'10B','10-MSC',null), 
('PERIOD 6','9D','9B','9D','9A','9A','8E'),
('PERIOD 7',null,null,'8C',null,'8S-S.S','8C'), 
('PERIOD 8','9E','10A',null,null,null,'9B');

CREATE TABLE JULIE_JACOB (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO JULIE_JACOB
VALUES 
('PERIOD 1',null,'9C',null,'9C',null,'10B'),
('PERIOD 2','10C','10C',null,null,null,'10A'),
('PERIOD 3',null,null,'8E','7E','10A','8E'),
('PERIOD 4','7E','9A','9D',null,'7E','9B'),
('PERIOD 5','9E','10D','7E','7E','9-MSC',null), 
('PERIOD 6','9A',null,'9B',null,null,'7E'),
('PERIOD 7',null,'10B',null,'8E','8E',null), 
('PERIOD 8','9D',null,null,null,'9E','10D');

CREATE TABLE SHASHIKALA_K_G (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO SHASHIKALA_K_G
VALUES 
('PERIOD_1',null,null,null,null,null,null),
('PERIOD_2',null,'10-A','6-F','6-E','8-D','9-B'),
('PERIOD_3',null,'7-B','7-A',null,'6-E',null),
('PERIOD_4','7-B',NULL,'9-C','6-F','7-C','7-A'),
('PERIOD_5','6-D','9-B',NULL,'7-C',null,'6-D'), 
('PERIOD_6',NULL,NULL,NULL,NULL,NULL,NULL),
('PERIOD_7','10-B','8-E',NULL,'8-D','9-A','8-E'), 
('PERIOD_8','12','9-C','9-A','10-A','10-B','12');

CREATE TABLE SHINI_THOMAS (
  PERIOD_DAYS  varchar(10),
  MONDAY varchar(10),
  TUESDAY varchar(10),
  WEDNESDAY varchar(10),
  THURSDAY varchar(10),
  FRIDAY varchar(10),
  SATURDAY varchar(10)
);
INSERT INTO SHINI_THOMAS
VALUES 
('PERIOD_1',null,null,null,null,null,null),
('PERIOD_2',null,'9-C',NULL,NULL,NULL,'7-C'),
('PERIOD_3','7-D',NULL,'7-B','6-D',null,'10-B'),
('PERIOD_4','8-A','7-A','6-C','11','8-D','9-A'),
('PERIOD_5','6-E','6-B','6-A',NULL,null,NULL), 
('PERIOD_6','9-B',NULL,'8-C','8-A','7-E','12'),
('PERIOD_7',NULL,NULL,NULL,NULL,'6-F','10-C'), 
('PERIOD_8','8-E',NULL,'9-C','9-D','10-D','10-A');

