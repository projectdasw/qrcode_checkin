-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 07:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `checkin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_tamu`
--

CREATE TABLE `data_tamu` (
  `no_regist` varchar(30) NOT NULL,
  `no_undian` int(11) NOT NULL,
  `nama_tamu` text NOT NULL,
  `asal` text NOT NULL,
  `status` text NOT NULL,
  `kehadiran` text NOT NULL,
  `jam_kedatangan` text NOT NULL,
  `keterangan` text DEFAULT NULL,
  `qr_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_tamu`
--

INSERT INTO `data_tamu` (`no_regist`, `no_undian`, `nama_tamu`, `asal`, `status`, `kehadiran`, `jam_kedatangan`, `keterangan`, `qr_code`) VALUES
('REG-112214', 112316, 'Rian Andriansah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-112214683290f56196f_Rian Andriansah.png'),
('REG-114363', 793334, 'test7', 'asdasd', 'Umum', 'Hadir', '00:25:01', '', 'REG-1143636841d2e3ea939_test7.png'),
('REG-115882', 494196, 'Prima Kurnia Setiawan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-115882683281e1dad60_Prima Kurnia Setiawan.png'),
('REG-119887', 875507, 'Rosyidi Catur Margono', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-11988768328157c9eb2_Rosyidi Catur Margono.png'),
('REG-121508', 172403, 'Muhammad Ali Romdhon', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-12150868327f5edc537_Muhammad Ali Romdhon.png'),
('REG-125707', 935212, 'Niki (WKF)', '', 'VIP', 'Belum Hadir', '', '', 'REG-125707683a626b08910_Niki (WKF).png'),
('REG-125723', 826897, 'Zainul Arifin', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-125723683283602bde5_Zainul Arifin.png'),
('REG-130045', 920518, 'Ferdianto Nur Maulana', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-13004568328466506a5_Ferdianto Nur Maulana.png'),
('REG-131727', 133699, 'test', 'mala', 'Umum', 'Hadir', '19.10.20', 'ik', 'REG-13172768412633375aa_test.png'),
('REG-134075', 454088, 'Andhi Setiawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-134075683292c73180e_Andhi Setiawan.png'),
('REG-152406', 619185, 'Irfan Nurkarim', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-1524066832822039be7_Irfan Nurkarim.png'),
('REG-157190', 993178, 'test6', 'a;sldk', 'Umum', 'Hadir', '00:24:14', '', 'REG-1571906841cfb1e1d92_test6.png'),
('REG-164296', 883418, 'Adi Agus Ciputra', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-164296683294525f477_Adi Agus Ciputra.png'),
('REG-164615', 986434, 'Anang Kurniawan Adi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-16461568327e7a59ed5_Anang Kurniawan Adi.png'),
('REG-166440', 884766, 'Imam Fatoni', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-166440683282dab6161_Imam Fatoni.png'),
('REG-178795', 876633, 'Judi Widjaja', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-17879568327e0ad8471_Judi Widjaja.png'),
('REG-186934', 603031, 'Setian Mahendra', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-186934683284dd25a2b_Setian Mahendra.png'),
('REG-187006', 365649, 'Widi Pratama Karuniawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-187006683294df02fb5_Widi Pratama Karuniawan.png'),
('REG-190331', 142810, 'Yosita Mai Rini', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-190331683287f12c332_Yosita Mai Rini.png'),
('REG-195719', 217087, 'Dimas Raharjo', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-195719683291bde99c8_Dimas Raharjo (PW).png'),
('REG-196297', 757863, 'Global', '', 'VIP', 'Belum Hadir', '', '', 'REG-19629768329c4ad4718_Global.png'),
('REG-196681', 649582, 'Rama Subekti', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-1966816832817f0b174_Rama Subekti.png'),
('REG-205867', 614299, 'Riko Ardiansyah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-2058676832935320658_Riko Ardiansyah.png'),
('REG-209851', 775705, 'Moch. Syaifudin', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-20985168329251d74bd_Moch. Syaifudin.png'),
('REG-212496', 581674, 'Sifri', '', 'VIP', 'Belum Hadir', '', '', 'REG-21249668329c830ad2e_Sifri.png'),
('REG-219562', 869529, 'Rizky Pangestu', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-219562683281284253d_Rizky Pangestu.png'),
('REG-220044', 582566, 'Bayu Krizwanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-22004468328371022f6_Bayu Krizwanto.png'),
('REG-225171', 492673, 'Hengki Krisno Pambudi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-22517168328440de08f_Hengki Krisno Pambudi.png'),
('REG-232552', 586804, 'Dasar', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-232552683280f9d48c9_Dasar.png'),
('REG-233774', 869040, 'Sudadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-233774683282105c55e_Sudadi.png'),
('REG-241389', 213370, 'Bagyo (WKF)', '', 'VIP', 'Belum Hadir', '', '', 'REG-241389683a627a1dbb8_Bagyo (WKF).png'),
('REG-255706', 737270, 'Alfan Saroni', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-255706683281ad10efb_Alfan Saroni.png'),
('REG-257049', 909016, 'Anang Nachrowi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-257049683295f068dbf_Anang Nachrowi.png'),
('REG-257806', 661980, 'Afandi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-257806683283fd6fb03_Afandi.png'),
('REG-264421', 833395, 'Dirga Rulian', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-26442168329291a4dbb_Dirga Rulian.png'),
('REG-268643', 426621, 'Bosco', '', 'VIP', 'Belum Hadir', '', '', 'REG-26864368329be8a93b6_Bosco.png'),
('REG-273523', 436628, 'Moh. Khoirul', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-273523683281369a7da_Moh. Khoirul.png'),
('REG-279599', 337115, 'Saiin Kodir', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-27959968329031e7453_Saiin Kodir.png'),
('REG-280450', 394701, 'Timothy Andrew Herlambang', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-2804506832996170e30_Timothy Andrew Herlambang.png'),
('REG-286636', 338399, 'Happy Riyanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-28663668327e4fcaa46_Happy Riyanto.png'),
('REG-299082', 693852, 'Yogik Dwi Purwanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-2990826832918fd77c8_Yogik Dwi Purwanto (PW).png'),
('REG-302689', 868897, 'Windiono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-302689683287caeb8f1_Windiono.png'),
('REG-305668', 393272, 'test3', 'trsetrdes', 'Umum', 'Hadir', '12:15:23', '', 'REG-305668684127a7f2450_test3.png'),
('REG-322318', 517430, 'Siyanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-32231868328140c1607_Siyanto.png'),
('REG-324541', 280695, 'Devi Dwi Rahmawati', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-32454168327f9a92188_Devi Dwi Rahmawati.png'),
('REG-335322', 199979, 'Tamin', '', 'VIP', 'Belum Hadir', '', '', 'REG-33532268329c0e1e896_Tamin.png'),
('REG-336921', 430180, 'BCA Arif', '', 'VIP', 'Belum Hadir', '', '', 'REG-33692168329c5b88bcd_BCA Arif.png'),
('REG-338461', 720925, 'Toha Mansyur', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-338461683282884ed5c_Toha Mansyur.png'),
('REG-340628', 757953, 'Agus Hartanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-340628683291d1008d8_Agus Hartanto (PW).png'),
('REG-345955', 277520, 'Bernadetta Joyce Goenawan, SH.', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-345955683298888eee3_Bernadetta Joyce Goenawan, SH..png'),
('REG-349158', 924440, 'Sheva Agdrian Antonella', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-349158683285181d5eb_Sheva Agdrian Antonella.png'),
('REG-354156', 259224, 'Tri Ismayanti', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-354156683ff90aedcd7_Tri Ismayanti.png'),
('REG-358798', 427962, 'Santi (WKF)', '', 'VIP', 'Belum Hadir', '', '', 'REG-3587986835b17183877_Santi (WKF).png'),
('REG-364058', 453863, 'test10', 'asdasd', 'Umum', 'Hadir', '00:33:08', '', 'REG-3640586841d4c89f74e_test10.png'),
('REG-364095', 454200, 'Hadi Purwanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-3640956832916802491_Hadi Purwanto.png'),
('REG-371396', 903868, 'Hendika Agustian', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-3713966832847b197f4_Hendika Agustian.png'),
('REG-375313', 302959, 'Mahendra Febri Wijaya', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-3753136832830053b23_Mahendra Febri Wijaya.png'),
('REG-381068', 430459, 'Medara Ferry', '', 'VIP', 'Belum Hadir', '', '', 'REG-38106868329c29f4228_Medara Ferry.png'),
('REG-384013', 370214, 'Nurul Wahyudi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-384013683281ee09b5a_Nurul Wahyudi.png'),
('REG-392290', 412473, 'Muhammad Ramadhan Hadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-392290683ff9295f209_Muhammad Ramadhan Hadi.png'),
('REG-393928', 770301, 'Mohammad Yuda Harianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-39392868329426efe74_Mohammad Yuda Harianto.png'),
('REG-400378', 768375, 'Pantja Adji Prijanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-40037868400cb195584_Pantja Adji Prijanto.png'),
('REG-404982', 971495, 'Indra Nur Wijaya', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-4049826832965772d35_Indra Nur Wijaya.png'),
('REG-406000', 445269, 'Permata Pak Ricky', '', 'VIP', 'Belum Hadir', '', '', 'REG-4060006835b7be7dee2_Permata Pak Ricky.png'),
('REG-406340', 826119, 'Ari', '', 'VIP', 'Belum Hadir', '', '', 'REG-4063406835b7e40b163_Ari.png'),
('REG-410898', 862356, 'Pujiono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-410898683293cd04b3f_Pujiono.png'),
('REG-412805', 982236, 'Muhammad Khoironi', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-4128056832992ac8f30_Muhammad Khoironi.png'),
('REG-417676', 470847, 'Noriyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-4176766832922ecc677_Noriyanto.png'),
('REG-420899', 586071, 'Siti Zaenab', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-420899683296f77b931_Siti Zaenab.png'),
('REG-424973', 794608, 'Aris Hermawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-4249736832960f09a17_Aris Hermawan.png'),
('REG-426402', 540357, 'Nino', '', 'VIP', 'Belum Hadir', '', '', 'REG-4264026835b7ef90381_Nino.png'),
('REG-435384', 943482, 'Nofan Setio Budi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-435384683ffde5770a7_Nofan Setio Budi.png'),
('REG-438739', 518272, 'Andik Firmansyah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-438739683282aab3b63_Andik Firmansyah.png'),
('REG-442726', 706479, 'Jefry Noor Sandi Saputra', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-44272668329902d710e_Jefry Noor Sandi Saputra.png'),
('REG-446401', 638007, 'David Al Adam', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-446401683283b0a5b1b_David Al Adam.png'),
('REG-452030', 861333, 'Chusnul Chotimah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-4520306832880b8df31_Chusnul Chotimah.png'),
('REG-453449', 597734, 'Kukuh Santoso', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-45344968329637e5e68_Kukuh Santoso.png'),
('REG-458449', 794290, 'Agus Cahya Krismadana', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-4584496832838fa2b11_Agus Cahya Krismadana.png'),
('REG-462231', 642245, 'Yeni (WKF)', '', 'VIP', 'Belum Hadir', '', '', 'REG-4622316835b1886c202_Yeni (WKF).png'),
('REG-476547', 936752, 'Sutrisno', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-47654768328420328cb_Sutrisno.png'),
('REG-485420', 969040, 'Mochamad Mahfud', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-485420683284a895ad0_Mochamad Mahfud.png'),
('REG-487790', 382245, 'Vincent', '', 'VIP', 'Belum Hadir', '', '', 'REG-48779068329c702d75c_Vincent.png'),
('REG-494552', 891236, 'Very Harianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-494552683291596dc36_Very Harianto.png'),
('REG-497857', 537868, 'Nugraha Hartanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-4978576832808c562c6_Nugraha Hartanto.png'),
('REG-500244', 229606, 'Eko Sasi', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-50024468329917755cb_Eko Sasi.png'),
('REG-502051', 522470, 'Ahmad Syahroni', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-502051683296cec61ab_Ahmad Syahroni.png'),
('REG-508411', 136001, 'Adi Susanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-5084116832953fb5d78_Adi Susanto.png'),
('REG-519644', 818107, 'Agus Saputro', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-51964468329406d1f81_Agus Saputro.png'),
('REG-522222', 510102, 'Mohammad Syukron', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-5222226832819db0618_Mohammad Syukron.png'),
('REG-525654', 997828, 'Syaiful Aziz', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-525654683283443d6de_Syaiful Aziz.png'),
('REG-527839', 717575, 'Andik', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-527839683298bb3f5bb_Andik.png'),
('REG-530801', 368341, 'FX Suheri Mulyanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-53080168327ec9eaf4f_FX Suheri Mulyanto.png'),
('REG-532300', 685497, 'Muhammad Nur Habibi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-532300683292b48abb1_Muhammad Nur Habibi.png'),
('REG-532717', 956645, 'Lis (WKF)', '', 'VIP', 'Belum Hadir', '', '', 'REG-5327176835b10c87472_Lis (WKF).png'),
('REG-533502', 179405, 'Doni Susanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-53350268328170246d6_Doni Susanto.png'),
('REG-544527', 517303, 'Yanuar Viki Romansyah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-544527683290daa1837_Yanuar Viki Romansyah.png'),
('REG-544958', 620547, 'Sutinah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-544958683297d4257fb_Sutinah.png'),
('REG-548476', 359541, 'Rival Arif Al-Hidayah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-548476683285abd719e_Rival Arif Al-Hidayah.png'),
('REG-551703', 586822, 'Burhannudin Harahap', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-551703683295a2481d6_Burhannudin Harahap.png'),
('REG-553781', 192717, 'test5', 'asdasd', 'Umum', 'Hadir', '12:54:52', '', 'REG-553781684131193f435_test5.png'),
('REG-554138', 828959, 'Miswan Hadi P', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-55413868329139e23c7_Miswan Hadi P.png'),
('REG-555595', 900709, 'Achmad Arga Ramadani', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-5555956832852aabaa7_Achmad Arga Ramadani.png'),
('REG-565829', 634808, 'Hergita', '', 'VIP', 'Belum Hadir', '', '', 'REG-565829683a6299ae849_Hergita.png'),
('REG-587283', 395585, 'A. Bagus Indriantono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-58728368328fdde2c8e_A. Bagus Indrantono.png'),
('REG-587682', 317661, 'Amin Taruna Negara', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-587682683291aadd132_Amin Taruna Negara.png'),
('REG-591166', 507224, 'Ranang Firmansyah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-5911666832818f432f6_Ranang Firmansyah.png'),
('REG-593555', 915360, 'Anita Ari Setyowati', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-593555683288205e768_Anita Ari Setyowati.png'),
('REG-595528', 803003, 'Tessalya Trirachmadani', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-595528683298eb9291d_Tessalya Trirachmadani.png'),
('REG-599150', 357273, 'Candrawinata', '', 'VIP', 'Belum Hadir', '', '', 'REG-59915068329c92d4064_Candrawinata.png'),
('REG-601280', 828632, 'Noviani Eka Pratiwi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-60128068328b1dea724_Noviani Eka Pratiwi.png'),
('REG-603542', 357102, 'Widjanarko', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-603542683298af1bc35_Widjanarko.png'),
('REG-606492', 709873, 'Mochamad Rohman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-6064926832859865124_Mochamad Rohman.png'),
('REG-609647', 661321, 'Dimas Kusuma Putra', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-6096476832855c3c148_Dimas Kusuma Putra.png'),
('REG-612806', 315819, 'Yenny', '', 'VIP', 'Belum Hadir', '', '', 'REG-612806683a6288075ca_Yenny (WKF).png'),
('REG-617878', 396213, 'Mochamad Sholeh', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-61787868329216c73b3_Mochamad Sholeh.png'),
('REG-624547', 941438, 'Achmad Faisol', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-624547683282996303e_Achmad Faisol.png'),
('REG-626188', 207132, 'Vina Puspa Dewi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-62618868328b3bd91c2_Vina Puspa Dewi.png'),
('REG-671585', 195760, 'test11', 'jhgjkhg', 'Umum', 'Hadir', '00:48:46', '', 'REG-6715856841d77fbd7e0_test11.png'),
('REG-679030', 158933, 'Asrul Faris', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-6790306832854d0ba5d_Asrul Faris.png'),
('REG-680695', 704035, 'Debi Anggraini Kartikasari', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-68069568327feb3f173_Debi Anggraini Kartikasari.png'),
('REG-680771', 529666, 'Wiwi', '', 'VIP', 'Belum Hadir', '', '', 'REG-6807716835b7930b51e_Wiwi.png'),
('REG-692943', 803524, 'Sony Susanto', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', 'REG-6929436832989dbbf7f_Sony Susanto.png'),
('REG-698253', 157241, 'Yusuf Fadeli', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-69825368329464adfd4_Yusuf Fadeli.png'),
('REG-699796', 279697, 'Abdul Khohar', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-69979668328325d65c2_Abdul Khohar.png'),
('REG-702581', 355299, 'Mochamad Alfan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-7025816832824f497c0_Mochamad Alfan.png'),
('REG-706525', 437646, 'Teguh Siswanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-7065256832842d1cd6b_Teguh Siswanto.png'),
('REG-706967', 620083, 'Andi Setyawan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-70696768328451eae79_Andi Setyawan.png'),
('REG-710075', 711524, 'test9', 'asd', 'Umum', 'Hadir', '00:32:09', '', 'REG-7100756841d48f95097_test9.png'),
('REG-713580', 951672, 'Muhammad Nur Rahman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-713580683284f48b830_Muhammad Nur Rahman.png'),
('REG-716653', 397498, 'Agus Wahyudi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-716653683290ab2d4b5_Agus Wahyudi.png'),
('REG-720039', 921515, 'Ulul Azmi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-720039683280627e28b_Ulul Azmi.png'),
('REG-727298', 590061, 'Wachid Arianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-727298683293287f3ab_Wachid Arianto.png'),
('REG-728291', 729431, 'Edy Nurachman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-72829168328311534fc_Edy Nurachman.png'),
('REG-729208', 860460, 'Muhammad Riduwan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-7292086832841019191_Muhammad Riduwan.png'),
('REG-729389', 619040, 'Gunawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-729389683290190a9cb_Gunawan.png'),
('REG-732852', 640225, 'Permata Bu Ana', '', 'VIP', 'Belum Hadir', '', '', 'REG-73285268400efb7e7cd_Permata Bu Ana.png'),
('REG-738467', 403406, 'Bambang Jatmiko', 'Jakarta', 'Umum', 'Belum Hadir', '', '', 'REG-7384676832997a4f71a_Bambang Jatmiko.png'),
('REG-738519', 208957, 'Siti Maslukhah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-738519683298173df47_Siti Maslukhah.png'),
('REG-742989', 661590, 'Muhamad Dwi Ardianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-7429896832952af27f0_Muhamad Dwi Ardianto.png'),
('REG-743055', 549560, 'Noer ISlamet', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-743055683282d03d8bf_Noer ISlamet.png'),
('REG-743741', 680936, 'Vigo Ramadhani Hardiansyah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-743741683285c2770f5_Vigo Ramadhani Hardiansyah.png'),
('REG-746672', 807632, 'Wahruri', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-746672683296de14701_Wahruri.png'),
('REG-747318', 343444, 'BCA Oka', '', 'VIP', 'Belum Hadir', '', '', 'REG-74731868329c525dd5c_BCA Oka.png'),
('REG-751376', 939215, 'Rudiyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-751376683293f841b2c_Rudiyanto.png'),
('REG-755123', 612240, 'Steviano', '', 'VIP', 'Belum Hadir', '', '', 'REG-75512368329bf3e5e0a_Steviano.png'),
('REG-755243', 255262, 'Irfannudin', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-75524368328afe5d22d_Irfannudin.png'),
('REG-767860', 316584, 'Yunanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-7678606832825ee0cce_Yunanto.png'),
('REG-769423', 391717, 'Ribu Sapto Hadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-769423683281d043ff5_Ribu Sapto Hadi.png'),
('REG-779080', 144900, 'Medara Dian', '', 'VIP', 'Belum Hadir', '', '', 'REG-77908068329c3597b91_Medara Dian.png'),
('REG-782495', 529579, 'Fendi Febrianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-78249568329073a439b_Fendi Febrianto.png'),
('REG-782807', 751469, 'Tammy', '', 'VIP', 'Belum Hadir', '', '', 'REG-7828076835b7d5a7084_Tammy.png'),
('REG-795568', 793814, 'test2', 'laksdjl', 'Umum', 'Hadir', '12:13:14', '', 'REG-795568684126fd3ff41_test2.png'),
('REG-797237', 378765, 'Didik Efendi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-797237683293dd11825_Didik Efendi.png'),
('REG-803100', 585926, 'Yoki', '', 'VIP', 'Belum Hadir', '', '', 'REG-80310068329c0524e65_Yoki.png'),
('REG-808211', 556713, 'Suef Agus Wiyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-80821168329090300d4_Suef Agus Wiyanto.png'),
('REG-808880', 620852, 'Doddy Dwi Ardianto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-8088806832833587b3e_Doddy Dwi Ardianto.png'),
('REG-809561', 571299, 'Arief Mariono', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-8095616832826befc4a_Arief Mariono.png'),
('REG-810984', 698096, 'Swara', '', 'VIP', 'Belum Hadir', '', '', 'REG-81098468329c4061932_Swara.png'),
('REG-811864', 669913, 'test8', 'asdasd', 'Umum', 'Hadir', '00:31:18', '', 'REG-8118646841d39e4032f_test8.png'),
('REG-812844', 104262, 'Noval Jiddarul Khomsah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-8128446832857305c68_Noval Jiddarul Khomsah.png'),
('REG-817314', 953879, 'Saiful Anwar', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-8173146832967c0d6ee_Saiful Anwar.png'),
('REG-821714', 175709, 'Luke', '', 'VIP', 'Belum Hadir', '', '', 'REG-821714683fff75e4b80_Luke.png'),
('REG-821785', 265210, 'Atik Latifah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-82178568327ef17f3b4_Atik Latifah.png'),
('REG-839068', 412797, 'Aris Mujiono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-83906868329388f3bbd_Aris Mujiono.png'),
('REG-839509', 403694, 'Dwi Indra Wahyudi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-8395096832930ca1f28_Dwi Indra Wahyudi.png'),
('REG-840800', 292096, 'Mochammad Alfian', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-8408006832823f69474_Mochammad Alfian.png'),
('REG-841738', 567008, 'Tarem', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-841738683297fcbac01_Tarem.png'),
('REG-847941', 761127, 'Fatchul Chakiki', 'Jakarta', 'Umum', 'Belum Hadir', '', '', 'REG-84794168329995142b1_Fatchul Chakiki.png'),
('REG-857064', 685727, 'Eko Hadi Siswanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-8570646832811505356_Eko Hadi Siswanto.png'),
('REG-857225', 997940, 'Isnaini Uswatun Khasanah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-85722568327f4ab1762_Isnaini Uswatun Khasanah.png'),
('REG-864171', 347828, 'Agus Sholeh', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-864171683291fcd5cf3_Agus Sholeh.png'),
('REG-868669', 850835, 'Moch Albaihaqi Diva M', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-8686696832978fb9cf8_Moch Albaihaqi Diva M.png'),
('REG-871323', 903725, 'Maria Teresa Trivika', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-8713236832889239aa8_Maria Teresa Trivika.png'),
('REG-876954', 168490, 'Zaidan Zainul Abidin', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-876954683294cc27608_Zaidan Zainul Abidin.png'),
('REG-878864', 568636, 'Lukman Efendi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-878864683287b524329_Lukman Efendi.png'),
('REG-881031', 776880, 'Agus Mubaidillah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-8810316832884ef1154_Agus Mubaidillah.png'),
('REG-882522', 413213, 'Setya Rahman', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-88252268329437a4430_Setya Rahman.png'),
('REG-900351', 123910, 'Muhammad Irfan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-90035168329127ea2bc_Mukhammad Irfan.png'),
('REG-903884', 801705, 'Mochamad Fiki', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-903884683284915279f_Mochamad Fiki.png'),
('REG-904108', 903342, 'Melati Arthamevia', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-904108683280c30a00e_Melati Arthamevia.png'),
('REG-905456', 129151, 'Tanto Hermanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-9054566832950100a79_Tanto Hermanto.png'),
('REG-908300', 664311, 'Suntoro Hadi Wijoyo', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-908300683294b0d9887_Suntoro Hadi Wijoyo.png'),
('REG-913425', 902272, 'Randy', '', 'VIP', 'Belum Hadir', '', '', 'REG-9134256835afec11fb4_Randy.png'),
('REG-913460', 458690, 'Wahyudi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-91346068328b87a198e_Wahyudi.png'),
('REG-913905', 813193, 'Junet Priyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-91390568329720638a3_Junet Priyanto.png'),
('REG-918977', 142921, 'Rizki Fiansyah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-918977683295c310009_Rizki Fiansyah.png'),
('REG-922650', 768895, 'Alvian Izac Novendra', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-922650683285049ec46_Alvian Izac Novendra.png'),
('REG-928255', 991157, 'Ali Muhdor', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-928255683281baef5e7_Ali Muhdor.png'),
('REG-932422', 281637, 'Ferbianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-932422683290bde8ba2_Ferbianto.png'),
('REG-934477', 252126, 'Hanafi', 'Jakarta', 'Umum', 'Belum Hadir', '', '', 'REG-93447768329987e1069_Hanafi.png'),
('REG-949571', 246091, 'Yohanes', '', 'VIP', 'Belum Hadir', '', '', 'REG-9495716835b00d14f84_Yohanes.png'),
('REG-949882', 670947, 'Arifatur Rachman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-949882683283d7ae1a9_Arifatur Rachman.png'),
('REG-952980', 445558, 'Farida', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-9529806832983b54d18_Farida.png'),
('REG-953465', 579884, 'Fajar', '', 'VIP', 'Belum Hadir', '', '', 'REG-95346568329c7b7ad30_Fajar.png'),
('REG-965529', 430827, 'Miftahul Munip', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-96552968329487770a3_Miftahul Munip.png'),
('REG-968777', 657632, 'Gunadi Setiawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-96877768329043cdf07_Gunadi Setiawan.png'),
('REG-972358', 676977, 'Inggar Septian', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-972358683282e82e2ec_Inggar Septian.png'),
('REG-978250', 852249, 'Nanang Fadeli', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-97825068327f05d6de7_Nanang Fadeli.png'),
('REG-980270', 202784, 'test4', 'asdasd', 'Umum', 'Hadir', '12:51:19', 'asdasdasd', 'REG-98027068412aaebfaeb_test4.png'),
('REG-985344', 673059, 'Febryan Arif Fajar', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-985344683285854cbf8_Febryan Arif Fajar.png'),
('REG-988435', 658549, 'Yohanes Nanang Pujianto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-988435683283c54c540_Yohanes Nanang Pujianto.png'),
('REG-990672', 723962, 'Iman Rokhani', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-99067268400262c1332_Iman Rokhani.png'),
('REG-995408', 359367, 'Hariadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', 'REG-9954086832827656f14_Hariadi.png'),
('REG-998496', 649814, 'Agus Supriyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', 'REG-998496683297a62a2fb_Agus Supriyanto.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama_user` text NOT NULL,
  `username` text NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_tamu`
--
ALTER TABLE `data_tamu`
  ADD PRIMARY KEY (`no_regist`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
