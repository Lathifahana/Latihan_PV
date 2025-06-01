-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2025 at 09:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_brg` varchar(6) NOT NULL,
  `nm_brg` varchar(25) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `hargabeli` varchar(20) NOT NULL,
  `hargajual` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_brg`, `nm_brg`, `jenis`, `hargabeli`, `hargajual`) VALUES
('IB0001', 'Soto', 'Makanan', '5000', '7000'),
('IB0002', 'Le Mineral', 'Minuman', '3000', '5000'),
('IB0003', 'Indomie', 'Makanan', '2000', '4000'),
('IB0004', 'Nipis Madu', 'Minuman', '2000', '3000'),
('IB0005', 'Sari Roti', 'Makanan', '3000', '5000'),
('IB0006', 'Pocari Sweat', 'Minuman', '3000', '8000'),
('IB0007', 'Es Jeruk', 'Minuman', '20000', '6000'),
('IB0008', 'Pancong', 'Makanan', '3000', '9000'),
('IB0009', 'Spaghetti', 'Makanan', '15000', '30000'),
('IB0010', 'Teh Tarik', 'Minuman', '2000', '5000'),
('IB0011', 'Milo', 'Minuman', '3000', '6000');

-- --------------------------------------------------------

--
-- Table structure for table `isi`
--

CREATE TABLE `isi` (
  `id_nota` varchar(6) NOT NULL,
  `kd_brg` varchar(6) NOT NULL,
  `hargabeli` int(111) NOT NULL,
  `hargajual` bigint(20) NOT NULL,
  `qty` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `isi`
--

INSERT INTO `isi` (`id_nota`, `kd_brg`, `hargabeli`, `hargajual`, `qty`) VALUES
('IN0006', 'IB0003', 2000, 4000, 2),
('IN0007', 'IB0003', 2000, 4000, 2),
('IN0007', 'IB0010', 2000, 5000, 2),
('IN0008', 'IB0010', 2000, 5000, 2),
('IN0001', 'IB0001', 5000, 7000, 1),
('IN0002', 'IB0003', 2000, 4000, 2),
('IN0003', 'IB0011', 3000, 6000, 3),
('IN0004', 'IB0009', 15000, 30000, 1),
('IN0005', 'IB0007', 20000, 6000, 1),
('IN0009', 'IB0001', 5000, 7000, 1),
('IN0009', 'IB0007', 20000, 6000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(6) NOT NULL,
  `nama_kasir` varchar(25) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `jenis_kelamin`, `no_telepon`, `agama`, `alamat`, `password`) VALUES
('IK0001', 'Lathifah H.N', 'Perempuan', '081312234512', 'Islam', 'Jakarta', '1212'),
('IK0002', 'Alya', 'Perempuan', '085712346735', 'Islam', 'Bintara', '1010'),
('IK0003', 'Danis', 'Laki-Laki', '081237485821', 'Islam', 'Bekasi', '0202'),
('IK0004', 'Naufal', 'Laki-Laki', '081236273586', 'Islam', 'Depok', '1818'),
('IK0005', 'John', 'Laki-Laki', '081262341241', 'Kristen', 'Milan', '0303'),
('IK0006', 'Yasmina', 'Perempuan', '089612345678', 'Islam', 'Kutai', '1313');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` varchar(6) NOT NULL,
  `tgl_nota` date NOT NULL,
  `id` varchar(6) NOT NULL,
  `id_kasir` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `tgl_nota`, `id`, `id_kasir`) VALUES
('IN0001', '2025-05-24', 'IP0001', 'IK0001'),
('IN0002', '2025-05-24', 'IP0002', 'IK0001'),
('IN0003', '2025-05-24', 'IP0004', 'IK0002'),
('IN0004', '2025-05-24', 'IP0005', 'IK0003'),
('IN0005', '2025-05-24', 'IP0003', 'IK0004'),
('IN0006', '2025-05-28', 'IP0001', 'IK0001'),
('IN0007', '2025-05-28', 'IP0004', 'IK0001'),
('IN0008', '2025-06-01', 'IP0002', 'IK0001'),
('IN0009', '2025-06-01', 'IP0005', 'IK0002');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` varchar(6) NOT NULL,
  `nmplgn` varchar(25) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nmplgn`, `jenis`, `telepon`, `alamat`) VALUES
('IP0001', 'Lathifah H.N', 'Perempuan', '081312341212', 'Depok'),
('IP0002', 'Kirana', 'Perempuan', '082145674545', 'Jakarta'),
('IP0003', 'Swara', 'Laki-Laki', '085678907878', 'Bogor'),
('IP0004', 'Bimo', 'Laki-Laki', '089636527421', 'Tangerang'),
('IP0005', 'Rendi', 'Laki-Laki', '087632587213', 'Banten'),
('IP0006', 'Yasmin', 'Perempuan', '081234561789', 'Bekasi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indexes for table `isi`
--
ALTER TABLE `isi`
  ADD KEY `fk_isi_nota` (`id_nota`),
  ADD KEY `fk_isi_barang` (`kd_brg`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_nota_kasir` (`id_kasir`),
  ADD KEY `fk_nota_pelanggan` (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `isi`
--
ALTER TABLE `isi`
  ADD CONSTRAINT `fk_isi_barang` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`),
  ADD CONSTRAINT `fk_isi_nota` FOREIGN KEY (`id_nota`) REFERENCES `nota` (`id_nota`);

--
-- Constraints for table `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_kasir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `fk_nota_pelanggan` FOREIGN KEY (`id`) REFERENCES `pelanggan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
