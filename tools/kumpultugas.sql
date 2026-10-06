-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2026 at 04:04 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kumpultugas`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `idguru` int NOT NULL,
  `namaguru` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`idguru`, `namaguru`, `username`, `password`, `foto`) VALUES
(1, 'guru raffa', 'guru1', '123456', 'guru1.jpg'),
(2, 'guru budi', 'guru2', '123456', 'guru2.jpg'),
(3, 'guru andi', 'guru3', '123456', 'guru3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `idkelas` int NOT NULL,
  `namakelas` varchar(50) NOT NULL,
  `tingkat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`idkelas`, `namakelas`, `tingkat`) VALUES
(1, 'xi rpl 1', 'xi'),
(2, 'xi rpl 2', 'xi'),
(3, 'xi rpl 3', 'xi');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `idmapel` int NOT NULL,
  `namamapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`idmapel`, `namamapel`) VALUES
(1, 'pemrograman dasar'),
(2, 'basis data'),
(3, 'pemrograman web'),
(4, 'jaringan komputer'),
(5, 'kewirausahaan');

-- --------------------------------------------------------

--
-- Table structure for table `pengumpulan`
--

CREATE TABLE `pengumpulan` (
  `idpengumpulan` int NOT NULL,
  `idtugas` int NOT NULL,
  `idsiswa` int NOT NULL,
  `tanggalkumpul` datetime NOT NULL,
  `filejawaban` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengumpulan`
--

INSERT INTO `pengumpulan` (`idpengumpulan`, `idtugas`, `idsiswa`, `tanggalkumpul`, `filejawaban`, `status`) VALUES
(1, 1, 1, '2026-10-05 00:00:00', 'jawaban1.pdf', 'dikumpulkan'),
(2, 2, 2, '2026-10-06 00:00:00', 'jawaban2.pdf', 'dikumpulkan'),
(3, 3, 3, '2026-10-07 00:00:00', 'jawaban3.pdf', 'dikumpulkan');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int NOT NULL,
  `nis` varchar(30) NOT NULL,
  `namasiswa` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `idkelas` int NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`idsiswa`, `nis`, `namasiswa`, `username`, `password`, `idkelas`, `foto`) VALUES
(1, '1234567890', 'raffa', 'raffa', '123456', 1, 'foto1.jpg'),
(2, '1234567891', 'raffa1', 'raffa1', '123456', 2, 'foto2.jpg'),
(3, '1234567892', 'raffa2', 'raffa2', '123456', 3, 'foto3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `idtugas` int NOT NULL,
  `idguru` int NOT NULL,
  `idmapel` int NOT NULL,
  `idkelas` int NOT NULL,
  `judultugas` varchar(30) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggalbuat` date NOT NULL,
  `deadline` date NOT NULL,
  `filetugas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`idtugas`, `idguru`, `idmapel`, `idkelas`, `judultugas`, `deskripsi`, `tanggalbuat`, `deadline`, `filetugas`) VALUES
(1, 1, 1, 1, 'program sederhana', 'buat program sederhana menggunakan python', '2026-10-01', '2026-10-10', 'tugas1.pdf'),
(2, 2, 2, 2, 'database siswa', 'buat database siswa menggunakan mysql', '2026-10-02', '2026-10-11', 'tugas2.pdf'),
(3, 3, 3, 3, 'halaman web', 'buat halaman web menggunakan html', '2026-10-03', '2026-10-12', 'tugas3.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `namauser` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` enum('guru','siswa') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `namauser`, `username`, `password`, `role`, `foto`) VALUES
(1, 'raffauser1', 'raffa', '098765432128172873256', 'siswa', 'foto1.jpg'),
(2, 'raffauser2', 'raffa', '09876543217671167215', 'siswa', 'foto2.jpg'),
(3, 'raffauser3', 'raffa', '0987654327266167215', 'siswa', 'foto3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`idkelas`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`idmapel`);

--
-- Indexes for table `pengumpulan`
--
ALTER TABLE `pengumpulan`
  ADD PRIMARY KEY (`idpengumpulan`),
  ADD KEY `idtugas` (`idtugas`),
  ADD KEY `idsiswa` (`idsiswa`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`),
  ADD KEY `fk_siswa_kelas` (`idkelas`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`idtugas`),
  ADD KEY `fktugasguru` (`idguru`),
  ADD KEY `fktugasmapel` (`idmapel`),
  ADD KEY `fktugaskelas` (`idkelas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `idguru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `idkelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `idmapel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengumpulan`
--
ALTER TABLE `pengumpulan`
  MODIFY `idpengumpulan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `idtugas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengumpulan`
--
ALTER TABLE `pengumpulan`
  ADD CONSTRAINT `idsiswa` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`),
  ADD CONSTRAINT `idtugas` FOREIGN KEY (`idtugas`) REFERENCES `tugas` (`idtugas`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`);

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fktugasguru` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`),
  ADD CONSTRAINT `fktugasmapel` FOREIGN KEY (`idmapel`) REFERENCES `mapel` (`idmapel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
