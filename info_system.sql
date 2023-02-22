-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2022 at 03:57 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `info_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(6) NOT NULL,
  `course_name_th` varchar(100) NOT NULL,
  `course_name_en` varchar(100) NOT NULL,
  `course_char` varchar(5) NOT NULL,
  `course_detail` varchar(1000) NOT NULL,
  `fac_id` int(2) NOT NULL,
  `lec_credit` int(1) NOT NULL,
  `lab_credit` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name_th`, `course_name_en`, `course_char`, `course_detail`, `fac_id`, `lec_credit`, `lab_credit`) VALUES
(204111, 'การเขียนโปรแกรมเบื้องต้น', 'Fundamentals of Programming', 'ว.คพ.', 'วิทยาการคอมพิวเตอร์ในชีวิตประจำวัน การแปลภาษา ระบบเลขฐานสอง อัลกอริทึมและการออกแบบ แนวคิดการเขียนโปรแกรมพื้นฐาน ระบบชนิดข้อมูลพื้นฐาน โครงสร้างข้อมูลพื้นฐาน โครงสร้างข้อมูลพื้นฐานและอัลกอริทึม และวิธีการพัฒนาโปรแกรม', 5, 2, 1),
(204113, 'หลักการคอมพิวเตอร์', 'Principles of Computing', 'ว.คพ.', 'ประวัติของการคำนวณอย่างย่อ การคำนวณโดยการทำซ้ำ การคิดแบบเวียนบังเกิด การจัดระเบียบข้อมูล การแทนข้อมูล การจัดระเบียบคอมพิวเตอร์ ความสุ่มในการคำนวณ การจำลอง หลักพื้นฐานอินเทอร์เน็ตและอินเทอร์เน็ตของสิ่งต่างๆ ภาวะความพร้อมกัน ปัญญาประดิษฐ์ และภาวะคำนวณได้: ข้อจำกัดของการคำนวณ', 5, 2, 1),
(204211, 'การเขียนโปรแกรมเชิงวัตถุ', 'Object-Oriented Programming', 'ว.คพ.', 'การพัฒนาโปรแกรมเชิงวัตถุ คลาสและวัตถุ เมท็อด การจัดการหน่วยเก็บข้อมูลสำหรับวัตถุ ความสัมพันธ์ระหว่างคลาส การรับทอดและการนำกลับมาใช้ พหุลักษณ์และคลาสทั่วไป การประกอบและการรวมกลุ่ม ความสัมพันธ์ และการจัดสร้างความสัมพันธ์ของคลาส', 5, 2, 1),
(204251, 'โครงสร้างข้อมูล', 'Data Structures', 'ว.คพ.', 'การแก้ปัญหาและแนวคิดเชิงนามธรรม ลิสต์เชิงเส้น กองซ้อน คิว คิวแบบมีลำดับความสำคัญ เซต การส่งและแฮชชิง การเรียงลำดับ ต้นไม้ และกราฟ', 5, 3, 0),
(204321, 'ระบบฐานข้อมูล', 'Database Systems', 'ว.คพ.', 'บทนำสู่ระบบฐานข้อมูล แนวคิดระบบฐานข้อมูลและสถาปัตยกรรม แบบจำลองข้อมูลโดยใช้แบบจำลองข้อมูลเชิงสัมพันธ์ ฐานข้อมูลเชิงสัมพันธ์ ฐานข้อมูลเชิงวัตถุ ฐานข้อมูลโนเอสคิวแอล ฐานข้อมูลเอ็กซ์เอ็มแอล', 5, 2, 1),
(204333, 'สถาปัตยกรรมเว็บแอปพลิเคชัน', 'Web Application Architecture', 'ว.คพ.', 'สถาปัตยกรรมเว็บ รูปแบบต่าง ๆ ของสถาปัตยกรรม ฐานข้อมูลและการเก็บข้อมูล ภาวะปรับขนาดได้ ระบบแบบพร้อมใช้งานสูง การกระจายงานและการเก็บแคช คิวข้อความ การประมวลผลข้อมูลแบบสตรีม', 5, 3, 0),
(204355, 'การเขียนโปรแกรมเชิงแข่งขัน', 'Competitive Programming', 'ว.คพ.', 'บทนำเกี่ยวกับการเขียนโปรแกรมเชิงแข่งขัน โครงสร้างข้อมูลขั้นสูง ชุดปัญหาด้านคณิตศาสตร์ ชุดปัญหาด้านกำหนดการพลวัต ชุดปัญหาด้านเกมเชิงการจัด ชุดปัญหาด้านกราฟ ชุดปัญหาด้านเครือข่ายการไหล ชุดปัญหาด้านสายอักขระ ชุดปัญหาด้านเรขาคณิต', 5, 2, 1),
(204361, 'วิศวกรรมซอฟต์แวร์', 'Software Engineering', 'ว.คพ.', 'บทนำเกี่ยวกับวิศวกรรมซอฟต์แวร์ ตัวแบบของกระบวนการซอฟต์แวร์ เครื่องมือและสภาพแวดล้อมเชิงซอฟต์แวร์ การประกันคุณภาพเชิงซอฟต์แวร์ การจัดระเบียบและการวางแผนโครงการ ความต้องการและการระบุข้อกำหนดความต้องการซอฟต์แวร์ เทคนิคการออกแบบซอฟต์แวร์ การสร้างซอฟต์แวร์ การตรวจสอบและการทวนสอบซอฟต์แวร์ และวิวัฒนาการเชิงซอฟต์แวร์', 5, 3, 0),
(204362, 'การออกแบบเชิงวัตถุ', 'Object-oriented Design', 'ว.คพ.', 'แนวคิดเชิงวัตถุ วัฏจักรการพัฒนาซอฟต์แวร์เชิงวัตถุ การรวบรวมความต้องการ แนวคิดการสร้างแบบจำลอง แผนภาพการไหลของธุรกิจ แบบจำลองยูสเคส ข้อกำหนดยูสเคส แผนภาพการปฏิสัมพันธ์ของวัตถุตามกรอบงานเอ็มวีซี การสกัดคลาส การออกแบบฐานข้อมูล การทดสอบเชิงวัตถุ และการนำซอฟต์แวร์ขึ้นใช้งาน', 5, 3, 0),
(204365, 'ปฏิสัมพันธ์ระหว่างมนุษย์และคอมพิวเตอร์', 'Human-computer Interaction', 'ว.คพ.', 'ภาพรวมการปฏิสัมพันธ์ระหว่างมนุษย์และคอมพิวเตอร์ ความสามารถและพฤติกรรมของมนุษย์ คอมพิวเตอร์และอุปกรณ์ที่เกี่ยวข้องในการนำข้อมูลเข้าและออก แบบจำลองการปฏิสัมพันธ์ระหว่างมนุษย์และคอมพิวเตอร์ การใช้งานได้ของระบบเชิงโต้ตอบ เทคนิคและเทคโนโลยีส่วนต่อประสาน กระบวนการออกแบบการปฏิสัมพันธ์ เทคนิคการประเมินผล', 5, 3, 0),
(204382, 'คอมพิวเตอร์กราฟิก', 'Computer Graphics', 'ว.คพ.', 'แนะนำคอมพิวเตอร์กราฟิก อุปกรณ์การแสดงผล เทคนิคการสร้างภาพเรขาคณิต หน้าต่างและวิวพอร์ต การแปลง การระบาย หน้าต่างและการตัดรูปในกรอบ ส่วนของภาพ เส้นโค้ง แนะนำรูปสามมิติ การแปลงในสามมิติ การประยุกต์ใช้งานคอมพิวเตอร์กราฟิก', 5, 3, 0),
(204423, 'การทำเหมืองข้อมูล', 'Data Mining', 'ว.คพ.', 'แนวคิดพื้นฐานของการทำเหมืองข้อมูล เครื่องมือพื้นฐานและการประมวลผลข้อมูลก่อน การจำแนกข้อมูล การทำเหมืองสำหรับตัวแบบและความสัมพันธ์ และการจัดกลุ่มข้อมูล', 5, 3, 0),
(204425, 'ระบบสารสนเทศเพื่อการจัดการ', 'Management Information System', 'ว.คพ.', 'แนะนำระบบสารสนเทศและโมเดลธุรกิจ ระบบประมวลผลรายการธุรกิจ ระบบสารสนเทศการจัดการและธุรกิจอัจฉริยะ ระบบสนับสนุนการตัดสินใจ ระบบสารสนเทศผู้บริหาร และระบบผู้เชี่ยวชาญและปัญญาประดิษฐ์', 5, 3, 0),
(204456, 'การเรียนรู้ของเครื่อง', 'Machine Learning', 'ว.คพ.', 'แนวคิดพื้นฐานของการเรียนรู้ของเครื่อง การเรียนรู้แบบมีผู้สอน การวิเคราะห์ที่ไม่ขึ้นกับขั้นตอนวิธี การเรียนรู้แบบไม่มีผู้สอน และการเรียนรู้แบบเสริมกำลัง', 5, 3, 0),
(204483, 'การมองเห็นของคอมพิวเตอร์', 'Computer Vision', 'ว.คพ.', 'บทนำและความสัมพันธ์กับสาขาอื่น การวิเคราะห์ภาพเก็บบิตเดียว บริเวณของจุดภาพที่เชื่อมต่อกัน ระบบของตัวกรอง การสกัดและการวิเคราะห์ลักษณะเด่น การแทนเส้นรอบขอบ ตัวบอกลวดลายสำหรับการมองเห็นของคอมพิวเตอร์ ทัศนศาสตร์ การสร้างและระบบศัพท์ภาพ การมองเห็นในมุมมองสามมิติทางเรขาคณิต และการประยุกต์ใช้การมองเห็นของคอมพิวเตอร์', 5, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(2) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `fac_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `fac_id`) VALUES
(1, 'วิทยาการคอมพิวเตอร์', 5);

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `en_sem` int(3) NOT NULL,
  `en_year` int(4) NOT NULL,
  `course_id` int(6) NOT NULL,
  `std_id` int(9) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `en_sec` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`en_sem`, `en_year`, `course_id`, `std_id`, `grade`, `en_sec`) VALUES
(2, 2564, 204355, 620510645, NULL, 1),
(2, 2564, 204355, 620510648, NULL, 1),
(2, 2564, 204355, 620510650, NULL, 1),
(2, 2564, 204362, 620510645, NULL, 1),
(2, 2564, 204365, 620510645, NULL, 1),
(2, 2564, 204423, 620510645, NULL, 1),
(2, 2564, 204423, 620510648, NULL, 1),
(2, 2564, 204423, 620510650, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_time`
--

CREATE TABLE `exam_time` (
  `comp_exam` int(10) NOT NULL,
  `ex_date` date DEFAULT NULL,
  `ex_start` varchar(7) NOT NULL,
  `ex_finish` varchar(7) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_time`
--

INSERT INTO `exam_time` (`comp_exam`, `ex_date`, `ex_start`, `ex_finish`, `status`) VALUES
(1, '2022-01-04', '08.00', '11.00', 'mid'),
(2, '2022-01-05', '12.00', '15.00', 'mid'),
(3, '2022-02-04', '15.00', '18.00', 'mid'),
(4, '2022-02-05', '8.00', '11.00', 'mid'),
(5, '2022-01-06', '08.00', '11.00', 'mid'),
(6, '2022-01-06', '12.00', '15.00', 'mid'),
(7, '2022-02-07', '15.00', '18.00', 'mid'),
(8, '2022-02-08', '8.00', '11.00', 'mid'),
(9, '2022-01-09', '08.00', '11.00', 'mid'),
(10, '2022-01-10', '12.00', '15.00', 'mid'),
(11, '2022-02-11', '15.00', '18.00', 'mid'),
(12, '2022-02-12', '8.00', '11.00', 'mid'),
(13, '2022-01-13', '08.00', '11.00', 'mid'),
(14, '2022-01-14', '12.00', '15.00', 'mid'),
(15, '2022-02-14', '15.00', '18.00', 'mid'),
(16, '2022-02-14', '8.00', '11.00', 'mid');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fac_id` int(2) NOT NULL,
  `fac_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fac_name`) VALUES
(1, 'มนุษยศาสตร์'),
(2, 'ศึกษาศาสตร์'),
(3, 'วิจิตรศิลป์'),
(4, 'สังคมศาสตร์'),
(5, 'วิทยาศาสตร์'),
(6, 'วิศวกรรมศาสตร์'),
(7, 'แพทยศาสตร์'),
(8, 'เกษตรศาสตร์'),
(9, 'ทันตแพทยศาสตร์'),
(10, 'เภสัชศาสตร์'),
(11, 'เทคนิคการแพทย์'),
(12, 'พยาบาลศาสตร์'),
(13, 'อุตสาหกรรมเกษตร'),
(14, 'สัตวแพทยศาสตร์'),
(15, 'บริหารธุรกิจ'),
(16, 'เศรษฐศาสตร์'),
(17, 'สถาปัตยกรรมศาสตร์'),
(18, 'การสื่อสารมวลชน'),
(19, 'รัฐศาสตร์'),
(20, 'นิติศาสตร์'),
(21, 'วิทยาลัยศิลปะ สื่อและเทคโนโลยี');

-- --------------------------------------------------------

--
-- Table structure for table `open_course`
--

CREATE TABLE `open_course` (
  `sec` int(4) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` int(4) NOT NULL,
  `comp_study` int(10) NOT NULL,
  `course_id` int(6) NOT NULL,
  `room_id` varchar(5) NOT NULL,
  `capacity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `open_course`
--

INSERT INTO `open_course` (`sec`, `semester`, `year`, `comp_study`, `course_id`, `room_id`, `capacity`) VALUES
(1, 2, 2564, 2, 204362, 'CS201', 30),
(1, 2, 2564, 6, 204333, 'CS210', 30),
(1, 2, 2564, 6, 204365, 'CS202', 30),
(1, 2, 2564, 7, 204251, 'CS201', 30),
(1, 2, 2564, 9, 204355, 'CS201', 30),
(1, 2, 2564, 9, 204483, 'CS203', 30),
(1, 2, 2564, 10, 204423, 'CS201', 30),
(2, 2, 2564, 2, 204362, 'CS202', 30);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite`
--

CREATE TABLE `prerequisite` (
  `course_id` int(6) NOT NULL,
  `Pcourse_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prerequisite`
--

INSERT INTO `prerequisite` (`course_id`, `Pcourse_id`) VALUES
(204113, 204111),
(204211, 204113),
(204251, 204113),
(204321, 204251),
(204333, 204211),
(204355, 204251),
(204361, 204211),
(204362, 204211),
(204362, 204321),
(204362, 204361),
(204365, 204211),
(204382, 204211),
(204423, 204251),
(204425, 204321),
(204456, 204251),
(204483, 204382);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` varchar(5) NOT NULL,
  `type_room` varchar(3) NOT NULL,
  `fac_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `type_room`, `fac_id`) VALUES
('CS100', 'lec', 5),
('CS201', 'lec', 5),
('CS202', 'lec', 5),
('CS203', 'lec', 5),
('CS204', 'lec', 5),
('CS205', 'lec', 5),
('CS206', 'lec', 5),
('CS207', 'lec', 5),
('CS208', 'lec', 5),
('CS209', 'lec', 5),
('CS210', 'lec', 5),
('CS301', 'lab', 5),
('CS302', 'lab', 5),
('CS303', 'lab', 5),
('CS307', 'lab', 5),
('CS309', 'lab', 5),
('CS310', 'lab', 5);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_exam`
--

CREATE TABLE `schedule_exam` (
  `course_id` int(6) NOT NULL,
  `comp_exam` int(10) NOT NULL,
  `room_id` varchar(5) NOT NULL,
  `ex_sem` int(1) NOT NULL,
  `ex_year` int(4) NOT NULL,
  `ex_capacity` int(5) NOT NULL,
  `et_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_exam`
--

INSERT INTO `schedule_exam` (`course_id`, `comp_exam`, `room_id`, `ex_sem`, `ex_year`, `ex_capacity`, `et_id`) VALUES
(204251, 6, 'CS207', 2, 2564, 50, 333333333),
(204321, 5, 'CS307', 2, 2564, 50, 333333333),
(204333, 6, 'CS210', 2, 2564, 50, 222222222),
(204365, 7, 'CS203', 2, 2564, 50, 111111111),
(204382, 5, 'CS303', 2, 2564, 50, 222222222),
(204423, 1, 'CS310', 2, 2564, 50, 111111111);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `std_id` int(9) NOT NULL,
  `std_fname` varchar(100) NOT NULL,
  `std_lname` varchar(100) NOT NULL,
  `std_email` varchar(100) NOT NULL,
  `dept_id` int(2) NOT NULL,
  `std_title` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `std_fname`, `std_lname`, `std_email`, `dept_id`, `std_title`) VALUES
(620510600, 'เตซอง', 'ผ้าป่า', 'thechong_p@cmu.ac.th', 1, 'นาย'),
(620510645, 'ธีรพัน', 'สองพัน', 'thirapun_s@cmu.ac.th', 1, 'นาย'),
(620510648, 'ปาเจรา', 'โหนติ', 'pajara_h@cmu.ac.th\r\n', 1, 'นาย'),
(620510650, 'พระชร', 'ชอนชัย', 'phachon_c@cmu.ac.th', 1, 'นาย'),
(620510660, 'รัชชะ', 'ดาดิดะ', 'ratcha_d@cmu.ac.th', 1, 'นาย');

-- --------------------------------------------------------

--
-- Table structure for table `study_time`
--

CREATE TABLE `study_time` (
  `comp_study` int(20) NOT NULL,
  `study_day` varchar(3) NOT NULL,
  `study_start` varchar(5) NOT NULL,
  `study_finish` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `study_time`
--

INSERT INTO `study_time` (`comp_study`, `study_day`, `study_start`, `study_finish`) VALUES
(39, 'Fr', '08.00', '09.00'),
(44, 'Fr', '09.30', '10.30'),
(33, 'Fr', '09.30', '12.30'),
(49, 'Fr', '11.00', '12.00'),
(54, 'Fr', '13.00', '14.00'),
(59, 'Fr', '14.30', '15.30'),
(34, 'Fr', '14.30', '17.30'),
(64, 'Fr', '16.00', '17.00'),
(35, 'Mo', '08.00', '09.00'),
(40, 'Mo', '09.30', '10.30'),
(25, 'Mo', '09.30', '12.30'),
(45, 'Mo', '11.00', '12.00'),
(50, 'Mo', '13.00', '14.00'),
(55, 'Mo', '14.30', '15.30'),
(26, 'Mo', '14.30', '17.30'),
(60, 'Mo', '16.00', '17.00'),
(1, 'MTh', '08.00', '09.30'),
(17, 'MTh', '08.00', '10.00'),
(3, 'MTh', '09.30', '11.00'),
(13, 'MTh', '09.30', '12.30'),
(5, 'MTh', '11.00', '12.30'),
(19, 'MTh', '11.00', '13.00'),
(7, 'MTh', '13.00', '14.30'),
(21, 'MTh', '13.00', '15.00'),
(9, 'MTh', '14.30', '16.00'),
(23, 'MTh', '14.30', '16.30'),
(15, 'MTh', '14.30', '17.30'),
(11, 'MTh', '16.00', '17.30'),
(38, 'Th', '08.00', '09.00'),
(43, 'Th', '09.30', '10.30'),
(31, 'Th', '09.30', '12.30'),
(48, 'Th', '11.00', '12.00'),
(53, 'Th', '13.00', '14.00'),
(58, 'Th', '14.30', '15.30'),
(32, 'Th', '14.30', '17.30'),
(63, 'Th', '16.00', '17.00'),
(36, 'Tu', '08.00', '09.00'),
(41, 'Tu', '09.30', '10.30'),
(27, 'Tu', '09.30', '12.30'),
(46, 'Tu', '11.00', '12.00'),
(51, 'Tu', '13.00', '14.00'),
(56, 'Tu', '14.30', '15.30'),
(28, 'Tu', '14.30', '17.30'),
(61, 'Tu', '16.00', '17.00'),
(2, 'TuF', '08.00', '09.30'),
(18, 'TuF', '08.00', '10.00'),
(4, 'TuF', '09.30', '11.00'),
(14, 'TuF', '09.30', '12.30'),
(6, 'TuF', '11.00', '12.30'),
(20, 'TuF', '11.00', '13.00'),
(8, 'TuF', '13.00', '14.30'),
(22, 'TuF', '13.00', '15.00'),
(10, 'TuF', '14.30', '16.00'),
(24, 'TuF', '14.30', '16.30'),
(16, 'TuF', '14.30', '17.30'),
(12, 'TuF', '16.00', '17.30'),
(37, 'We', '08.00', '09.00'),
(42, 'We', '09.30', '10.30'),
(29, 'We', '09.30', '12.30'),
(47, 'We', '11.00', '12.00'),
(52, 'We', '13.00', '14.00'),
(57, 'We', '14.30', '15.30'),
(30, 'We', '14.30', '17.30'),
(62, 'We', '16.00', '17.00');

-- --------------------------------------------------------

--
-- Table structure for table `teach`
--

CREATE TABLE `teach` (
  `t_sem` int(1) NOT NULL,
  `t_sec` int(4) NOT NULL,
  `t_year` int(4) NOT NULL,
  `t_id` int(9) NOT NULL,
  `course_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teach`
--

INSERT INTO `teach` (`t_sem`, `t_sec`, `t_year`, `t_id`, `course_id`) VALUES
(1, 1, 2560, 111111111, 204361),
(1, 1, 2560, 222222222, 204111),
(1, 1, 2560, 333333333, 204211),
(1, 1, 2560, 333333333, 204321),
(1, 1, 2561, 111111111, 204111),
(1, 1, 2561, 111111111, 204211),
(1, 1, 2561, 111111111, 204361),
(1, 1, 2561, 333333333, 204321),
(1, 1, 2562, 111111111, 204361),
(1, 1, 2562, 222222222, 204111),
(1, 1, 2562, 333333333, 204211),
(1, 1, 2562, 333333333, 204321),
(1, 1, 2563, 111111111, 204111),
(1, 1, 2563, 111111111, 204211),
(1, 1, 2563, 111111111, 204361),
(1, 1, 2563, 333333333, 204321),
(1, 1, 2564, 111111111, 204111),
(1, 1, 2564, 222222222, 204211),
(1, 1, 2564, 333333333, 204321),
(1, 1, 2564, 444444444, 204361),
(1, 2, 2560, 111111111, 204111),
(1, 2, 2560, 111111111, 204211),
(1, 2, 2560, 222222222, 204321),
(1, 2, 2560, 555555555, 204361),
(1, 2, 2561, 222222222, 204111),
(1, 2, 2561, 222222222, 204321),
(1, 2, 2561, 333333333, 204211),
(1, 2, 2561, 555555555, 204361),
(1, 2, 2562, 111111111, 204111),
(1, 2, 2562, 222222222, 204321),
(1, 2, 2562, 333333333, 204211),
(1, 2, 2562, 444444444, 204361),
(1, 2, 2563, 222222222, 204111),
(1, 2, 2563, 222222222, 204321),
(1, 2, 2563, 333333333, 204211),
(1, 2, 2563, 444444444, 204361),
(1, 2, 2564, 111111111, 204211),
(1, 2, 2564, 111111111, 204361),
(1, 2, 2564, 222222222, 204111),
(1, 2, 2564, 222222222, 204321),
(2, 1, 2560, 222222222, 204113),
(2, 1, 2560, 333333333, 204362),
(2, 1, 2560, 555555555, 204251),
(2, 1, 2561, 222222222, 204113),
(2, 1, 2561, 333333333, 204362),
(2, 1, 2561, 555555555, 204251),
(2, 1, 2562, 222222222, 204113),
(2, 1, 2562, 333333333, 204362),
(2, 1, 2562, 555555555, 204251),
(2, 1, 2563, 222222222, 204113),
(2, 1, 2563, 333333333, 204362),
(2, 1, 2563, 555555555, 204251),
(2, 1, 2564, 111111111, 204423),
(2, 1, 2564, 222222222, 204113),
(2, 1, 2564, 222222222, 204382),
(2, 1, 2564, 333333333, 204333),
(2, 1, 2564, 333333333, 204362),
(2, 1, 2564, 333333333, 204483),
(2, 1, 2564, 444444444, 204365),
(2, 1, 2564, 555555555, 204251),
(2, 1, 2564, 555555555, 204355),
(2, 2, 2560, 222222222, 204362),
(2, 2, 2560, 333333333, 204113),
(2, 2, 2560, 444444444, 204251),
(2, 2, 2561, 222222222, 204362),
(2, 2, 2561, 333333333, 204113),
(2, 2, 2561, 444444444, 204251),
(2, 2, 2562, 222222222, 204362),
(2, 2, 2562, 333333333, 204113),
(2, 2, 2562, 444444444, 204251),
(2, 2, 2563, 222222222, 204362),
(2, 2, 2563, 333333333, 204113),
(2, 2, 2563, 444444444, 204251),
(2, 2, 2564, 222222222, 204362),
(2, 2, 2564, 333333333, 204113),
(2, 2, 2564, 444444444, 204251);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `t_id` int(9) NOT NULL,
  `t_fname` varchar(100) NOT NULL,
  `t_lname` varchar(100) NOT NULL,
  `t_email` varchar(100) NOT NULL,
  `t_title` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`t_id`, `t_fname`, `t_lname`, `t_email`, `t_title`) VALUES
(111111111, 'วัน', 'อาทิตย์สดใส', 'teacher_1@cmu.ac.th', 'ดร.'),
(222222222, 'ส่องแสง', 'แรงจัง', 'teacher_2@cmu.ac.th', 'นาย'),
(333333333, 'ใบตอง', 'ป๊อกเด้ง', 'teacher_3@cmu.ac.th', 'นาง'),
(444444444, 'โพดำ', 'แสลงใจ', 'teacher_4@cmu.ac.th', 'นาย'),
(555555555, 'อารมณ์', 'ขันทอง', 'teacher_5@cmu.ac.th', 'นาย');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `course_id` int(6) NOT NULL,
  `comp_exam` int(10) NOT NULL,
  `std_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`course_id`, `comp_exam`, `std_id`) VALUES
(204362, 3, 620510645),
(204365, 3, 620510645);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fac_id` (`fac_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `fac_id` (`fac_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`en_sem`,`en_year`,`course_id`,`std_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `exam_time`
--
ALTER TABLE `exam_time`
  ADD PRIMARY KEY (`comp_exam`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `open_course`
--
ALTER TABLE `open_course`
  ADD PRIMARY KEY (`sec`,`semester`,`year`,`comp_study`,`course_id`,`room_id`),
  ADD UNIQUE KEY `comp_study` (`comp_study`,`course_id`,`room_id`),
  ADD KEY `open_course_id` (`course_id`),
  ADD KEY `open_room_id` (`room_id`);

--
-- Indexes for table `prerequisite`
--
ALTER TABLE `prerequisite`
  ADD PRIMARY KEY (`course_id`,`Pcourse_id`),
  ADD KEY `Pcourse_id` (`Pcourse_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `fac_id_2` (`fac_id`);

--
-- Indexes for table `schedule_exam`
--
ALTER TABLE `schedule_exam`
  ADD UNIQUE KEY `course_id` (`course_id`,`comp_exam`,`room_id`),
  ADD KEY `se_comp_exam` (`comp_exam`),
  ADD KEY `se_room_id` (`room_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`std_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `study_time`
--
ALTER TABLE `study_time`
  ADD PRIMARY KEY (`comp_study`),
  ADD UNIQUE KEY `study_day` (`study_day`,`study_start`,`study_finish`);

--
-- Indexes for table `teach`
--
ALTER TABLE `teach`
  ADD PRIMARY KEY (`t_sem`,`t_sec`,`t_year`,`t_id`,`course_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD UNIQUE KEY `course_id` (`course_id`,`comp_exam`,`std_id`),
  ADD KEY `comp_exam_vote` (`comp_exam`),
  ADD KEY `std_id_vote` (`std_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_fac_id` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `departmentf_id` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `std_id` FOREIGN KEY (`std_id`) REFERENCES `student` (`std_id`);

--
-- Constraints for table `open_course`
--
ALTER TABLE `open_course`
  ADD CONSTRAINT `comp_study` FOREIGN KEY (`comp_study`) REFERENCES `study_time` (`comp_study`),
  ADD CONSTRAINT `open_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `open_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `prerequisite`
--
ALTER TABLE `prerequisite`
  ADD CONSTRAINT `Pcourse_id` FOREIGN KEY (`Pcourse_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fac_id` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `schedule_exam`
--
ALTER TABLE `schedule_exam`
  ADD CONSTRAINT `se_comp_exam` FOREIGN KEY (`comp_exam`) REFERENCES `exam_time` (`comp_exam`),
  ADD CONSTRAINT `se_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `se_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `dept_id` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `t_id` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`),
  ADD CONSTRAINT `teach_t_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `comp_exam_vote` FOREIGN KEY (`comp_exam`) REFERENCES `exam_time` (`comp_exam`),
  ADD CONSTRAINT `course_id_vote` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `std_id_vote` FOREIGN KEY (`std_id`) REFERENCES `student` (`std_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
