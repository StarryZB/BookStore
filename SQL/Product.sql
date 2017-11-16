CREATE database bookstore;

use bookstore;

CREATE TABLE `product` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(100) NOT NULL,
  `book_price` double NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8

INSERT INTO product (book_id,book_name,book_price)
VALUES
('1', 'JAVA编程思想', '89.1'),
('2', 'Java核心技术一', '71.3'),
('3', '算法(第四版)', '82.9'),
('4', 'Head First Java', '68.7'),
('5', '计算机网络自顶向下方法', '65.2'),
('6', 'MySQL必知必会', '29.8'),
('7', '深入理解Java虚拟机', '65.2'),
('8', 'Java并发编程的艺术', '48.4'),
('9', '深入理解计算机系统', '114.7'),
('10', '编码：隐匿在计算机软硬件背后的语言', '56.1'),
('11', '计算机操作系统', '31.7'),
('12', 'Wireshark数据包分析实战', '41'),
('13', '图解TCP/IP', '46.3'),
('14', '图解HTTP', '38.7'),
('15', 'Head First Servlets and JSP', '88.5'),
('16', '大话数据结构', '50.2'),
('17', 'SQL必知必会', '24.7'),
('18', 'Head First设计模式', '83.3'),
('19', 'Java核心技术系列', '56.9'),
('20', '啊哈 算法', '37.7'),
('21', 'Java并发编程实战', '56.9');

