-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 08:21 AM
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
-- Table structure for table `data_hadiah`
--

CREATE TABLE `data_hadiah` (
  `id_hadiah` int(11) NOT NULL,
  `nama_hadiah` text NOT NULL,
  `jumlah_hadiah` int(11) NOT NULL,
  `jumlah_menang` int(11) NOT NULL,
  `sisa_hadiah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_hadiah`
--

INSERT INTO `data_hadiah` (`id_hadiah`, `nama_hadiah`, `jumlah_hadiah`, `jumlah_menang`, `sisa_hadiah`) VALUES
(1, 'Setrika', 20, 0, 0),
(2, 'Set Pisau', 19, 0, 0),
(3, 'Rice Cooker', 8, 0, 0),
(4, 'Kipas Angin', 10, 0, 0),
(5, 'TV LED 32 Inch', 4, 0, 0),
(6, 'Handphone', 2, 0, 0),
(7, 'Sepeda Listrik', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_tamu`
--

CREATE TABLE `data_tamu` (
  `no_regist` varchar(30) NOT NULL,
  `no_undian` int(11) DEFAULT NULL,
  `nama_tamu` text NOT NULL,
  `asal` text NOT NULL,
  `status` text NOT NULL,
  `kehadiran` text NOT NULL,
  `jam_kedatangan` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `keterangan_hadir` text DEFAULT NULL,
  `qr_code` varchar(255) NOT NULL,
  `menang_undian` text DEFAULT NULL,
  `menang_hadiah` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_tamu`
--

INSERT INTO `data_tamu` (`no_regist`, `no_undian`, `nama_tamu`, `asal`, `status`, `kehadiran`, `jam_kedatangan`, `keterangan`, `keterangan_hadir`, `qr_code`, `menang_undian`, `menang_hadiah`) VALUES
('REG-112214', 112316, 'Rian Andriansah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-112214683290f56196f_Rian Andriansah.png', NULL, NULL),
('REG-115882', 494196, 'Prima Kurnia Setiawan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-115882683281e1dad60_Prima Kurnia Setiawan.png', NULL, NULL),
('REG-119887', 875507, 'Rosyidi Catur Margono', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-11988768328157c9eb2_Rosyidi Catur Margono.png', NULL, NULL),
('REG-121508', 172403, 'Muhammad Ali Romdhon', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-12150868327f5edc537_Muhammad Ali Romdhon.png', NULL, NULL),
('REG-125723', 826897, 'Zainul Arifin', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-125723683283602bde5_Zainul Arifin.png', NULL, NULL),
('REG-130045', 920518, 'Ferdianto Nur Maulana', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-13004568328466506a5_Ferdianto Nur Maulana.png', '', NULL),
('REG-134075', 454088, 'Andhi Setiawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-134075683292c73180e_Andhi Setiawan.png', NULL, NULL),
('REG-152406', 619185, 'Irfan Nurkarim', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-1524066832822039be7_Irfan Nurkarim.png', NULL, NULL),
('REG-164296', 883418, 'Adi Agus Ciputra', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-164296683294525f477_Adi Agus Ciputra.png', NULL, NULL),
('REG-164615', 986434, 'Anang Kurniawan Adi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-16461568327e7a59ed5_Anang Kurniawan Adi.png', NULL, NULL),
('REG-166440', 884766, 'Imam Fatoni', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-166440683282dab6161_Imam Fatoni.png', NULL, NULL),
('REG-178795', 876633, 'Judi Widjaja', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-17879568327e0ad8471_Judi Widjaja.png', '', NULL),
('REG-182799', 424899, 'Dany Purniawan', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-182799685217eede09b_Dany Purniawan.png', NULL, NULL),
('REG-186934', 603031, 'Setian Mahendra', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-186934683284dd25a2b_Setian Mahendra.png', NULL, NULL),
('REG-187006', 365649, 'Widi Pratama Karuniawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-187006683294df02fb5_Widi Pratama Karuniawan.png', NULL, NULL),
('REG-190331', 142810, 'Yosita Mai Rini', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-190331683287f12c332_Yosita Mai Rini.png', NULL, NULL),
('REG-195719', 217087, 'Dimas Raharjo', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-195719683291bde99c8_Dimas Raharjo (PW).png', NULL, NULL),
('REG-196681', 649582, 'Rama Subekti', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-1966816832817f0b174_Rama Subekti.png', '', NULL),
('REG-205867', 614299, 'Riko Ardiansyah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-2058676832935320658_Riko Ardiansyah.png', NULL, NULL),
('REG-209851', 775705, 'Moch. Syaifudin', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-20985168329251d74bd_Moch. Syaifudin.png', NULL, NULL),
('REG-212496', 581674, 'Sifri', '', 'VIP', 'Belum Hadir', '', 'Table Anggrek', NULL, 'REG-21249668329c830ad2e_Sifri.png', NULL, NULL),
('REG-219562', 869529, 'Rizky Pangestu', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-219562683281284253d_Rizky Pangestu.png', NULL, NULL),
('REG-220044', 582566, 'Bayu Krizwanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-22004468328371022f6_Bayu Krizwanto.png', '', ''),
('REG-225171', 492673, 'Hengki Krisno Pambudi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-22517168328440de08f_Hengki Krisno Pambudi.png', NULL, NULL),
('REG-232552', 586804, 'Dasar', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-232552683280f9d48c9_Dasar.png', NULL, NULL),
('REG-233774', 869040, 'Sudadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-233774683282105c55e_Sudadi.png', NULL, NULL),
('REG-247612', 165671, 'Samsul Hadi', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-247612685216d0d8bab_Samsul Hadi.png', NULL, NULL),
('REG-252032', 432546, 'Soesanti', 'WKF', 'VIP', 'Belum Hadir', '', 'Table Mawar', NULL, 'REG-2520326848144e14a6c_Soesanti.png', NULL, NULL),
('REG-255706', 737270, 'Alfan Saroni', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-255706683281ad10efb_Alfan Saroni.png', NULL, NULL),
('REG-257049', 909016, 'Anang Nachrowi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-257049683295f068dbf_Anang Nachrowi.png', '', NULL),
('REG-257806', 661980, 'Afandi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-257806683283fd6fb03_Afandi.png', NULL, NULL),
('REG-264421', 833395, 'Dirga Rulian', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-26442168329291a4dbb_Dirga Rulian.png', NULL, NULL),
('REG-268643', 426621, 'Bosco', '', 'VIP', 'Belum Hadir', '', 'Table Anggrek', NULL, 'REG-26864368329be8a93b6_Bosco.png', NULL, NULL),
('REG-273523', 436628, 'Moh. Khoirul', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-273523683281369a7da_Moh. Khoirul.png', NULL, NULL),
('REG-279599', 337115, 'Saiin Kodir', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-27959968329031e7453_Saiin Kodir.png', NULL, NULL),
('REG-280450', 394701, 'Timothy Andrew Herlambang', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-2804506832996170e30_Timothy Andrew Herlambang.png', NULL, NULL),
('REG-286636', 338399, 'Happy Riyanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-28663668327e4fcaa46_Happy Riyanto.png', NULL, NULL),
('REG-299082', 693852, 'Yogik Dwi Purwanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-2990826832918fd77c8_Yogik Dwi Purwanto (PW).png', NULL, NULL),
('REG-302689', 868897, 'Windiono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-302689683287caeb8f1_Windiono.png', NULL, NULL),
('REG-322318', 517430, 'Siyanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-32231868328140c1607_Siyanto.png', NULL, NULL),
('REG-324541', 280695, 'Devi Dwi Rahmawati', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-32454168327f9a92188_Devi Dwi Rahmawati.png', '', ''),
('REG-335322', 199979, 'Tamin', '', 'VIP', 'Belum Hadir', '', 'Table Lavender', NULL, 'REG-33532268329c0e1e896_Tamin.png', NULL, NULL),
('REG-338461', 720925, 'Toha Mansyur', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-338461683282884ed5c_Toha Mansyur.png', NULL, NULL),
('REG-340628', 757953, 'Agus Hartanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-340628683291d1008d8_Agus Hartanto (PW).png', NULL, NULL),
('REG-341541', 976371, 'Soegiono', '', 'Umum', 'Belum Hadir', NULL, '', NULL, 'REG-341541685442fea86a1_Soegiono.png', NULL, NULL),
('REG-345955', 277520, 'Bernadetta Joyce Goenawan, SH.', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-345955683298888eee3_Bernadetta Joyce Goenawan, SH..png', NULL, NULL),
('REG-349158', 924440, 'Sheva Agdrian Antonella', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-349158683285181d5eb_Sheva Agdrian Antonella.png', NULL, NULL),
('REG-354156', 259224, 'Tri Ismayanti', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-354156683ff90aedcd7_Tri Ismayanti.png', NULL, NULL),
('REG-364095', 454200, 'Hadi Purwanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-3640956832916802491_Hadi Purwanto.png', NULL, NULL),
('REG-371396', 903868, 'Hendika Agustian', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-3713966832847b197f4_Hendika Agustian.png', NULL, NULL),
('REG-375313', 302959, 'Mahendra Febri Wijaya', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-3753136832830053b23_Mahendra Febri Wijaya.png', NULL, NULL),
('REG-381068', 430459, 'Ferry', 'Medara', 'VIP', 'Belum Hadir', '', 'Table Melati', NULL, 'REG-38106868329c29f4228_Medara Ferry.png', NULL, NULL),
('REG-384013', 370214, 'Nurul Wahyudi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-384013683281ee09b5a_Nurul Wahyudi.png', NULL, NULL),
('REG-392290', 412473, 'Muhammad Ramadhan Hadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-392290683ff9295f209_Muhammad Ramadhan Hadi.png', NULL, NULL),
('REG-393928', 770301, 'Mohammad Yuda Harianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-39392868329426efe74_Mohammad Yuda Harianto.png', NULL, NULL),
('REG-400378', 768375, 'Pantja Adji Prijanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-40037868400cb195584_Pantja Adji Prijanto.png', '', NULL),
('REG-404982', 971495, 'Indra Nur Wijaya', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4049826832965772d35_Indra Nur Wijaya.png', NULL, NULL),
('REG-406000', 445269, 'Ricky', 'Permata', 'VIP', 'Belum Hadir', '', 'Table Melati', NULL, 'REG-4060006835b7be7dee2_Permata Pak Ricky.png', '', ''),
('REG-406340', 826119, 'Ari', '', 'VIP', 'Belum Hadir', '', 'Table Anggrek', NULL, 'REG-4063406835b7e40b163_Ari.png', NULL, NULL),
('REG-410898', 862356, 'Pujiono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-410898683293cd04b3f_Pujiono.png', '', NULL),
('REG-412805', 982236, 'Muhammad Khoironi', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4128056832992ac8f30_Muhammad Khoironi.png', NULL, NULL),
('REG-417676', 470847, 'Noriyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4176766832922ecc677_Noriyanto.png', NULL, NULL),
('REG-420899', 586071, 'Siti Zaenab', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-420899683296f77b931_Siti Zaenab.png', NULL, NULL),
('REG-424973', 794608, 'Aris Hermawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4249736832960f09a17_Aris Hermawan.png', '', NULL),
('REG-426402', 540357, 'Nino', '', 'VIP', 'Belum Hadir', '', 'Table Anggrek', NULL, 'REG-4264026835b7ef90381_Nino.png', '', NULL),
('REG-427304', 347467, 'Bu Yenni & Pak Arifli', 'WKF', 'VIP', 'Belum Hadir', '', 'Table Mawar', NULL, 'REG-427304684814d38ecca_Bu Yenni & Pak Arifli.png', NULL, NULL),
('REG-435384', 943482, 'Nofan Setio Budi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-435384683ffde5770a7_Nofan Setio Budi.png', '', ''),
('REG-438739', 518272, 'Andik Firmansyah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-438739683282aab3b63_Andik Firmansyah.png', NULL, NULL),
('REG-442726', 706479, 'Jefry Noor Sandi Saputra', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-44272668329902d710e_Jefry Noor Sandi Saputra.png', NULL, NULL),
('REG-446401', 638007, 'David Al Adam', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-446401683283b0a5b1b_David Al Adam.png', NULL, NULL),
('REG-452030', 861333, 'Chusnul Chotimah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4520306832880b8df31_Chusnul Chotimah.png', NULL, NULL),
('REG-453449', 597734, 'Kukuh Santoso', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-45344968329637e5e68_Kukuh Santoso.png', '', ''),
('REG-458449', 794290, 'Agus Cahya Krismadana', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4584496832838fa2b11_Agus Cahya Krismadana.png', NULL, NULL),
('REG-476547', 936752, 'Sutrisno', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-47654768328420328cb_Sutrisno.png', NULL, NULL),
('REG-485420', 969040, 'Mochamad Mahfud', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-485420683284a895ad0_Mochamad Mahfud.png', NULL, NULL),
('REG-487790', 382245, 'Vincent', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-48779068329c702d75c_Vincent.png', NULL, NULL),
('REG-489372', 454119, 'Chandra', '', 'VIP', 'Belum Hadir', '', 'Table Anggrek', NULL, 'REG-48937268481520b6559_Chandra.png', NULL, NULL),
('REG-494552', 891236, 'Very Harianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-494552683291596dc36_Very Harianto.png', '', ''),
('REG-497857', 537868, 'Nugraha Hartono', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-4978576832808c562c6_Nugraha Hartanto.png', '', ''),
('REG-500244', 229606, 'Eko Sasi', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-50024468329917755cb_Eko Sasi.png', NULL, NULL),
('REG-502051', 522470, 'Ahmad Syahroni', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-502051683296cec61ab_Ahmad Syahroni.png', '', ''),
('REG-504770', 240479, 'Bu Nini Susilo & Pak Bagyo', 'WKF', 'VIP', 'Belum Hadir', '', 'Table Mawar', NULL, 'REG-5047706848148af1bf1_Bu Nini Susilo & Pak Bagyo.png', NULL, NULL),
('REG-508411', 136001, 'Adi Susanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-5084116832953fb5d78_Adi Susanto.png', NULL, NULL),
('REG-509706', NULL, 'Natalia Sondi', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-5097066852f3924f10d_Natalia Sondi.png', NULL, NULL),
('REG-519644', 818107, 'Agus Saputro', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-51964468329406d1f81_Agus Saputro.png', NULL, NULL),
('REG-522222', 510102, 'Mohammad Syukron', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-5222226832819db0618_Mohammad Syukron.png', NULL, NULL),
('REG-525654', 997828, 'Syaiful Aziz', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-525654683283443d6de_Syaiful Aziz.png', NULL, NULL),
('REG-527839', 717575, 'Andik', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-527839683298bb3f5bb_Andik.png', '', ''),
('REG-530801', 368341, 'FX Suheri Mulyanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-53080168327ec9eaf4f_FX Suheri Mulyanto.png', NULL, NULL),
('REG-532300', 685497, 'Muhammad Nur Habibi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-532300683292b48abb1_Muhammad Nur Habibi.png', NULL, NULL),
('REG-532717', 956645, 'Listya Natalia', 'WKF', 'VIP', 'Belum Hadir', '', 'Table Mawar', NULL, 'REG-5327176835b10c87472_Lis (WKF).png', '', ''),
('REG-533502', 179405, 'Doni Susanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-53350268328170246d6_Doni Susanto.png', '', ''),
('REG-544527', 517303, 'Yanuar Viki Romansyah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-544527683290daa1837_Yanuar Viki Romansyah.png', NULL, NULL),
('REG-544958', 620547, 'Sutinah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-544958683297d4257fb_Sutinah.png', NULL, NULL),
('REG-548476', 359541, 'Rival Arif Al-Hidayah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-548476683285abd719e_Rival Arif Al-Hidayah.png', '', ''),
('REG-551703', 586822, 'Burhannudin Harahap', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-551703683295a2481d6_Burhannudin Harahap.png', NULL, NULL),
('REG-554138', 828959, 'Miswan Hadi P', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-55413868329139e23c7_Miswan Hadi P.png', '', ''),
('REG-555595', 900709, 'Achmad Arga Ramadani', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-5555956832852aabaa7_Achmad Arga Ramadani.png', NULL, NULL),
('REG-565829', 634808, 'Hergita', '', 'VIP', 'Belum Hadir', '', 'Table Lavender', NULL, 'REG-565829683a6299ae849_Hergita.png', '', ''),
('REG-587283', 395585, 'A. Bagus Indriantono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-58728368328fdde2c8e_A. Bagus Indrantono.png', NULL, NULL),
('REG-587682', 317661, 'Amin Taruna Negara', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-587682683291aadd132_Amin Taruna Negara.png', NULL, NULL),
('REG-591166', 507224, 'Ranang Firmansyah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-5911666832818f432f6_Ranang Firmansyah.png', NULL, NULL),
('REG-593555', 915360, 'Anita Ari Setyowati', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-593555683288205e768_Anita Ari Setyowati.png', NULL, NULL),
('REG-595528', 803003, 'Tessalya Trirachmadani', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-595528683298eb9291d_Tessalya Trirachmadani.png', '', ''),
('REG-601280', 828632, 'Noviani Eka Pratiwi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-60128068328b1dea724_Noviani Eka Pratiwi.png', NULL, NULL),
('REG-603542', 357102, 'Widjanarko', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-603542683298af1bc35_Widjanarko.png', NULL, NULL),
('REG-606492', 709873, 'Mochamad Rohman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-6064926832859865124_Mochamad Rohman.png', NULL, NULL),
('REG-609647', 661321, 'Dimas Kusuma Putra', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-6096476832855c3c148_Dimas Kusuma Putra.png', NULL, NULL),
('REG-617699', 525489, 'Widiyanto', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-617699685217d2baa48_Widiyanto.png', NULL, NULL),
('REG-617878', 396213, 'Mochamad Sholeh', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-61787868329216c73b3_Mochamad Sholeh.png', '', NULL),
('REG-624547', 941438, 'Achmad Faisol', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-624547683282996303e_Achmad Faisol.png', NULL, NULL),
('REG-626188', 207132, 'Vina Puspa Dewi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-62618868328b3bd91c2_Vina Puspa Dewi.png', NULL, NULL),
('REG-636891', 928232, 'Mili', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-6368916848136770c75_Mili.png', NULL, NULL),
('REG-670367', 524587, 'Arsad Slamet Prayitno', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-670367685216b1ba15b_Arsyad Slamet Prayitno.png', NULL, NULL),
('REG-675354', 294562, 'Albert', '', 'VIP', 'Belum Hadir', '', '', NULL, 'REG-675354684c473f5b024_Albert.png', NULL, NULL),
('REG-679030', 158933, 'Asrul Faris', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-6790306832854d0ba5d_Asrul Faris.png', NULL, NULL),
('REG-680695', 704035, 'Debi Anggraini Kartikasari', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-68069568327feb3f173_Debi Anggraini Kartikasari.png', NULL, NULL),
('REG-688751', 674451, 'Tirza', 'BCA', 'VIP', 'Belum Hadir', '', 'Table Aster', NULL, 'REG-688751684815f33c5e5_Tirza.png', '', ''),
('REG-692943', 803524, 'Sony Susanto', 'Surabaya & Sidoarjo', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-6929436832989dbbf7f_Sony Susanto.png', '', ''),
('REG-694072', 698822, 'Vicky Arianto', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-694072685216c405574_Vicky Arianto.png', NULL, NULL),
('REG-698253', 157241, 'Yusuf Fadeli', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-69825368329464adfd4_Yusuf Fadeli.png', NULL, NULL),
('REG-699796', 279697, 'Abdul Khohar', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-69979668328325d65c2_Abdul Khohar.png', NULL, NULL),
('REG-702581', 355299, 'Mochamad Alfan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-7025816832824f497c0_Mochamad Alfan.png', NULL, NULL),
('REG-706525', 437646, 'Teguh Siswanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-7065256832842d1cd6b_Teguh Siswanto.png', '', NULL),
('REG-706967', 620083, 'Andi Setyawan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-70696768328451eae79_Andi Setyawan.png', NULL, NULL),
('REG-713580', 951672, 'Muhammad Nur Rahman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-713580683284f48b830_Muhammad Nur Rahman.png', NULL, NULL),
('REG-716653', 397498, 'Agus Wahyudi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-716653683290ab2d4b5_Agus Wahyudi.png', NULL, NULL),
('REG-718732', 228884, 'David', 'BCA', 'VIP', 'Belum Hadir', '', 'Table Aster', NULL, 'REG-718732684816076f54b_David.png', NULL, NULL),
('REG-720039', 921515, 'Ulul Azmi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-720039683280627e28b_Ulul Azmi.png', '', ''),
('REG-727298', 590061, 'Wachid Arianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-727298683293287f3ab_Wachid Arianto.png', NULL, NULL),
('REG-728291', 729431, 'Edy Nurachman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-72829168328311534fc_Edy Nurachman.png', NULL, NULL),
('REG-729208', 860460, 'Muhammad Riduwan', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-7292086832841019191_Muhammad Riduwan.png', NULL, NULL),
('REG-729389', 619040, 'Gunawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-729389683290190a9cb_Gunawan.png', NULL, NULL),
('REG-732852', 640225, 'Ana', 'Permata', 'VIP', 'Belum Hadir', '', 'Table Melati', NULL, 'REG-73285268400efb7e7cd_Permata Bu Ana.png', NULL, NULL),
('REG-736764', 106295, 'Muhammad Mustofa', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-736764685217c68d553_Muhammad Mustofa.png', NULL, NULL),
('REG-738467', 403406, 'Bambang Jatmiko', 'Jakarta', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-7384676832997a4f71a_Bambang Jatmiko.png', NULL, NULL),
('REG-738519', 208957, 'Siti Maslukhah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-738519683298173df47_Siti Maslukhah.png', '', ''),
('REG-742989', 661590, 'Muhamad Dwi Ardianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-7429896832952af27f0_Muhamad Dwi Ardianto.png', NULL, NULL),
('REG-743055', 549560, 'Noer ISlamet', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-743055683282d03d8bf_Noer ISlamet.png', '', NULL),
('REG-743741', 680936, 'Vigo Ramadhani Hardiansyah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-743741683285c2770f5_Vigo Ramadhani Hardiansyah.png', '', ''),
('REG-746672', 807632, 'Wahruri', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-746672683296de14701_Wahruri.png', NULL, NULL),
('REG-747318', 343444, 'Oka', 'BCA', 'VIP', 'Belum Hadir', '', 'Table Aster', NULL, 'REG-74731868329c525dd5c_BCA Oka.png', NULL, NULL),
('REG-751376', 939215, 'Rudiyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-751376683293f841b2c_Rudiyanto.png', NULL, NULL),
('REG-755123', 612240, 'Steviano', '', 'VIP', 'Belum Hadir', '', 'Table Anggrek', NULL, 'REG-75512368329bf3e5e0a_Steviano.png', NULL, NULL),
('REG-755243', 255262, 'Irfannudin', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-75524368328afe5d22d_Irfannudin.png', NULL, NULL),
('REG-760310', 739497, 'Ratna', 'Swara', 'VIP', 'Belum Hadir', '', 'Table Lavender', NULL, 'REG-7603106848162d66115_Ratna.png', NULL, NULL),
('REG-767860', 316584, 'Yunanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-7678606832825ee0cce_Yunanto.png', NULL, NULL),
('REG-769423', 391717, 'Ribu Sapto Hadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-769423683281d043ff5_Ribu Sapto Hadi.png', NULL, NULL),
('REG-779080', 144900, 'Dian', 'Medara', 'VIP', 'Belum Hadir', '', 'Table Melati', NULL, 'REG-77908068329c3597b91_Medara Dian.png', NULL, NULL),
('REG-782495', 529579, 'Fendi Febrianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-78249568329073a439b_Fendi Febrianto.png', NULL, NULL),
('REG-782807', 751469, 'Tammy', '', 'VIP', 'Belum Hadir', '', 'Table Lavender', NULL, 'REG-7828076835b7d5a7084_Tammy.png', NULL, NULL),
('REG-797237', 378765, 'Didik Efendi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-797237683293dd11825_Didik Efendi.png', '', ''),
('REG-803100', 585926, 'Yoki', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-80310068329c0524e65_Yoki.png', NULL, NULL),
('REG-808211', 556713, 'Suef Agus Wiyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-80821168329090300d4_Suef Agus Wiyanto.png', NULL, NULL),
('REG-808880', 620852, 'Doddy Dwi Ardianto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8088806832833587b3e_Doddy Dwi Ardianto.png', '', NULL),
('REG-809561', 571299, 'Arief Mariono', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8095616832826befc4a_Arief Mariono.png', NULL, NULL),
('REG-812844', 104262, 'Noval Jiddarul Khomsah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8128446832857305c68_Noval Jiddarul Khomsah.png', NULL, NULL),
('REG-817314', 953879, 'Saiful Anwar', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8173146832967c0d6ee_Saiful Anwar.png', NULL, NULL),
('REG-817904', 419020, 'Pak Didi & Bu Lana ', 'Kharisma', 'VIP', 'Belum Hadir', '', 'Table Mawar', NULL, 'REG-8179046848140360b6c_Pak Didi & Bu Lana .png', NULL, NULL),
('REG-821714', NULL, 'Luke', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-821714683fff75e4b80_Luke.png', NULL, NULL),
('REG-821785', 265210, 'Atik Latifah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-82178568327ef17f3b4_Atik Latifah.png', '', ''),
('REG-839068', 412797, 'Aris Mujiono', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-83906868329388f3bbd_Aris Mujiono.png', NULL, NULL),
('REG-839509', 403694, 'Dwi Indra Wahyudi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8395096832930ca1f28_Dwi Indra Wahyudi.png', NULL, NULL),
('REG-840800', 292096, 'Mochammad Alfian', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8408006832823f69474_Mochammad Alfian.png', NULL, NULL),
('REG-841738', 567008, 'Tarem', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-841738683297fcbac01_Tarem.png', NULL, NULL),
('REG-847941', 761127, 'Fatchul Chakiki', 'Jakarta', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-84794168329995142b1_Fatchul Chakiki.png', '', ''),
('REG-857064', 685727, 'Eko Hadi Siswanto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8570646832811505356_Eko Hadi Siswanto.png', NULL, NULL),
('REG-857225', 997940, 'Isnaini Uswatun Khasanah', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-85722568327f4ab1762_Isnaini Uswatun Khasanah.png', NULL, NULL),
('REG-864171', 347828, 'Agus Sholeh', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-864171683291fcd5cf3_Agus Sholeh.png', '', ''),
('REG-868669', 850835, 'Moch Albaihaqi Diva M', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8686696832978fb9cf8_Moch Albaihaqi Diva M.png', NULL, NULL),
('REG-871323', 903725, 'Maria Teresa Trivika', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8713236832889239aa8_Maria Teresa Trivika.png', '', ''),
('REG-876954', 168490, 'Zaidan Zainul Abidin', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-876954683294cc27608_Zaidan Zainul Abidin.png', NULL, NULL),
('REG-878864', 568636, 'Lukman Efendi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-878864683287b524329_Lukman Efendi.png', NULL, NULL),
('REG-881031', 776880, 'Agus Mubaidillah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-8810316832884ef1154_Agus Mubaidillah.png', NULL, NULL),
('REG-882522', 413213, 'Setya Rahman', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-88252268329437a4430_Setya Rahman.png', NULL, NULL),
('REG-900351', 123910, 'Muhammad Irfan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-90035168329127ea2bc_Mukhammad Irfan.png', NULL, NULL),
('REG-903884', 801705, 'Mochamad Fiki', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-903884683284915279f_Mochamad Fiki.png', NULL, NULL),
('REG-904108', 903342, 'Melati Arthamevia', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-904108683280c30a00e_Melati Arthamevia.png', NULL, NULL),
('REG-905456', 129151, 'Tanto Hermanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-9054566832950100a79_Tanto Hermanto.png', '', NULL),
('REG-908300', 664311, 'Suntoro Hadi Wijoyo', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-908300683294b0d9887_Suntoro Hadi Wijoyo.png', NULL, NULL),
('REG-913425', 902272, 'Randy', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-9134256835afec11fb4_Randy.png', NULL, NULL),
('REG-913460', 458690, 'Wahyudi', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-91346068328b87a198e_Wahyudi.png', NULL, NULL),
('REG-913905', 813193, 'Junet Priyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-91390568329720638a3_Junet Priyanto.png', NULL, NULL),
('REG-918977', 142921, 'Rizki Fiansyah', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-918977683295c310009_Rizki Fiansyah.png', NULL, NULL),
('REG-922650', 768895, 'Alvian Izac Novendra', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-922650683285049ec46_Alvian Izac Novendra.png', '', ''),
('REG-925084', 254732, 'Teddy', 'BCA', 'VIP', 'Belum Hadir', '', 'Table Aster', NULL, 'REG-925084684815bb60121_Teddy.png', NULL, NULL),
('REG-928255', 991157, 'Ali Muhdor', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-928255683281baef5e7_Ali Muhdor.png', NULL, NULL),
('REG-932422', 281637, 'Ferbianto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-932422683290bde8ba2_Ferbianto.png', NULL, NULL),
('REG-934477', 252126, 'Hanafi', 'Jakarta', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-93447768329987e1069_Hanafi.png', NULL, NULL),
('REG-940554', 890043, 'Suharianto', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-940554685217e09f0ae_Suharianto.png', NULL, NULL),
('REG-949571', NULL, 'Yohanes', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-9495716835b00d14f84_Yohanes.png', NULL, NULL),
('REG-949882', 670947, 'Arifatur Rachman', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-949882683283d7ae1a9_Arifatur Rachman.png', NULL, NULL),
('REG-952980', 445558, 'Farida', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-9529806832983b54d18_Farida.png', NULL, NULL),
('REG-953465', 579884, 'Fajar', '', 'VIP', 'Belum Hadir', '', 'Table Tulip', NULL, 'REG-95346568329c7b7ad30_Fajar.png', NULL, NULL),
('REG-965529', 430827, 'Miftahul Munip', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-96552968329487770a3_Miftahul Munip.png', NULL, NULL),
('REG-968777', 657632, 'Gunadi Setiawan', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-96877768329043cdf07_Gunadi Setiawan.png', NULL, NULL),
('REG-972358', 676977, 'Inggar Septian', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-972358683282e82e2ec_Inggar Septian.png', NULL, NULL),
('REG-978250', 852249, 'Nanang Fadeli', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-97825068327f05d6de7_Nanang Fadeli.png', NULL, NULL),
('REG-984728', 281731, 'M. Saad', '', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-984728685216d9e5d81_M. Saad.png', NULL, NULL),
('REG-985344', 673059, 'Febryan Arif Fajar', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-985344683285854cbf8_Febryan Arif Fajar.png', NULL, NULL),
('REG-988435', 658549, 'Yohanes Nanang Pujianto', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-988435683283c54c540_Yohanes Nanang Pujianto.png', NULL, NULL),
('REG-989576', 932072, 'Tjyntia', 'Global', 'VIP', 'Belum Hadir', '', 'Table Lavender', NULL, 'REG-9895766848167883295_Tjyntia.png', NULL, NULL),
('REG-990672', 723962, 'Iman Rokhani', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-99067268400262c1332_Iman Rokhani.png', NULL, NULL),
('REG-995408', 359367, 'Hariadi', 'Sunandar', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-9954086832827656f14_Hariadi.png', '', NULL),
('REG-998496', 649814, 'Agus Supriyanto', 'Pandanwangi', 'Umum', 'Belum Hadir', '', '', NULL, 'REG-998496683297a62a2fb_Agus Supriyanto.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setup_pemenang`
--

CREATE TABLE `setup_pemenang` (
  `id` int(11) NOT NULL,
  `no_undian` varchar(10) NOT NULL,
  `id_hadiah` int(11) NOT NULL,
  `status` enum('pending','used') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_hadiah`
--
ALTER TABLE `data_hadiah`
  ADD PRIMARY KEY (`id_hadiah`);

--
-- Indexes for table `data_tamu`
--
ALTER TABLE `data_tamu`
  ADD PRIMARY KEY (`no_regist`),
  ADD UNIQUE KEY `no_undian` (`no_undian`);

--
-- Indexes for table `setup_pemenang`
--
ALTER TABLE `setup_pemenang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_hadiah`
--
ALTER TABLE `data_hadiah`
  MODIFY `id_hadiah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `setup_pemenang`
--
ALTER TABLE `setup_pemenang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
