-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 04:51 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `tanggal`) VALUES
(21, 8, 2, 'gada', 1, '2023-12-31 15:11:27'),
(22, 8, 3, 'sesak jantung', 1, '2024-01-07 05:39:59'),
(23, 10, 3, 'sesak nafas', 2, '2024-01-07 07:59:22'),
(24, 9, 2, 'Mata merah', 2, '2024-01-07 08:07:07'),
(25, 8, 3, 'sesak nafas', 3, '2024-01-07 08:09:45'),
(26, 8, 2, 'mata merah', 3, '2024-01-07 08:10:01'),
(27, 8, 2, 'ppp', 4, '2024-01-07 08:12:21'),
(28, 8, 2, 'pp', 5, '2024-01-07 08:13:16'),
(29, 12, 2, 'Mata memerah', 6, '2024-01-07 08:17:53'),
(30, 12, 3, 'sakit', 4, '2024-01-07 08:19:18'),
(31, 13, 2, 'bayangan kabur', 7, '2024-01-07 08:23:07'),
(32, 14, 2, 'Mata bengkak', 8, '2024-01-07 08:29:19'),
(33, 15, 4, 'Demam batuk', 1, '2024-01-07 08:47:51'),
(34, 15, 5, 'keram perut', 1, '2024-01-07 08:49:58'),
(35, 15, 4, 'demam', 2, '2024-01-07 09:02:07'),
(36, 13, 2, 'Mata pedas', 9, '2024-01-07 09:12:12'),
(37, 16, 4, 'demam', 3, '2024-01-07 09:25:47'),
(38, 17, 2, 'Mata sakit', 10, '2024-01-07 14:39:26'),
(39, 17, 3, 'sesak', 5, '2024-01-07 14:43:11'),
(40, 18, 2, 'Mata bengkak', 11, '2024-01-07 14:51:39'),
(41, 16, 7, 'capek', 1, '2024-01-07 15:05:38'),
(42, 19, 7, 'Matanya sakit dan merah', 2, '2024-01-08 02:29:27'),
(43, 20, 7, 'Mata bengkak dan merah', 3, '2024-01-08 03:05:29'),
(44, 21, 2, 'Mata rabun', 12, '2024-01-08 03:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(1, 13, 2),
(2, 14, 4),
(3, 15, 2),
(4, 16, 3),
(5, 17, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`) VALUES
(8, 'Rahmaisya Intan Damayanti', 'jl cemara', '087717534258', 7),
(9, 'Kurnia Iqbal Setiyawan', 'jl kaliwiru', '08177560230', 8),
(11, 'Michael Jackson', 'Jl raya supriyadi', '08177868908', 9),
(12, 'Sandrina michelle', 'jl pahlawan', '0877175568667', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(2, 8, 'Senin', '00:00:10', '00:00:12'),
(3, 9, 'Kamis', '00:00:10', '00:00:12'),
(4, 11, 'Selasa', '13:44:11', '15:44:11'),
(5, 12, 'Selasa', '10:44:11', '11:44:11'),
(6, 9, 'Jumat', '07:45:17', '11:45:17'),
(7, 8, 'Kamis', '08:45:17', '15:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `kemasan` varchar(50) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'paracetamol', 'Strip', 5000),
(2, 'paratusin', 'strip', 20000),
(3, 'panadol', 'strip', 10000),
(4, 'sanmol', 'botol', 15000),
(7, 'Lacoldin', 'strip', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(8, 'iqbal', 'jl kaliwiru', '986627888', '08177868908', '202312-1'),
(9, 'saskia', 'jl baru', '876332645', '08177560230', '202312-2'),
(10, 'Ina Munafiah', 'Jl baru no 5', '8815442789188', '086115278920', '202401-3'),
(11, 'Gina amalia', 'Jl indraprasta no 22', '88157688922787', '0871658092887', '202401-4'),
(12, 'Salsabila Aurelia', 'Jl pabelan', '88156255788927', '081228278998', '202401-5'),
(13, 'Eunike', 'Jl hehe', '7715227838878', '08716580928856', '202401-6'),
(14, 'Raditya', 'jl beringin', '88176625899', '087717536715', '202401-7'),
(15, 'Beby Tsabina', 'Jl Kemayoran', '77161187892768', '085717689267', '202401-8'),
(16, 'Senina ', 'Jl PIK', '9817765267898', '08167288678', '202401-9'),
(17, 'Renata', 'Jl Prima', '77161187645', '08571768367', '202401-10'),
(18, 'Anyaa', 'Jl Tembalang', '7716114578', '0857176765', '202401-11'),
(19, 'Dyajeng ayu', 'Jl pandean', '8815762899', '087166627892', '202401-12'),
(20, 'Ica septi', 'Jl bekasi', '771566298792', '081767398278', '202401-13'),
(21, 'Nikomang Dilla', 'Jl diponegoro', '881681728', '087176568', '202401-14');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(13, 24, '2024-01-07 09:53:20', 'jangan capek', 170000),
(14, 23, '2024-01-07 09:55:18', 'minum obat 3x sehari', 165000),
(15, 30, '2024-01-07 09:57:04', 'makan teratur', 170000),
(16, 28, '2024-01-07 09:58:58', 'Olahraga', 160000),
(17, 43, '2024-01-08 04:20:54', 'Jangan sering main hp', 165000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(7, 'Poli Mata', 'Dokter akan memberikan pelayanan kesehatan untuk masalah mata, misalnya seperti gangguan di retina, katarak, lasik, mata kering, strabismus, glaukoma dan lainnya.'),
(8, 'Poli Jantung', 'Poli jantung Menyediakan layanan kesehatan untuk kesehatan jantung, misalnya seperti gagal jantung, aritmia, penyakit vaskular atau pembuluh darah, katup jantung, infeksi atau penyakit jantung bawaan (kongenital).'),
(9, 'Poli Anak', 'Menangani masalah kesehatan terhadap anak, biasanya gejala-gejala penyakit umum seperti demam, batuk, flu, dan lain sebagainya.'),
(10, 'Poli Bedah Umum', 'Pengembangan dari klinik ortopedi yang kita ketahui berhubungan erat dengan tulang. Sedangkan untuk bedah umum memberikan pelayanan kesehatan dengan kasus bedah non-ortopedi.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(6, 'intan', '123'),
(7, 'hehe', '$2y$10$Deq5mG8k4CRt91z0OzBijeQfwGkgCOGDj7s3XteRcTQoVX8cl59Z.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pasien_daftar_poli` (`id_pasien`),
  ADD KEY `fk_jadwal_periksa_daftar_poli` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_periksa_obat` (`id_obat`),
  ADD KEY `fk_periksa_detail_periksa` (`id_periksa`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_periksa_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftar_poli_periksa` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_jadwal_periksa_daftar_poli` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_pasien_daftar_poli` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detail_periksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_periksa_detail_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwal_periksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_daftar_poli_periksa` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
