-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 26 Feb 2024 pada 09.35
-- Versi server: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `DetailID` int(11) NOT NULL,
  `PenjualanID` int(11) NOT NULL,
  `ProdukID` int(11) NOT NULL,
  `JumlahProduk` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`DetailID`, `PenjualanID`, `ProdukID`, `JumlahProduk`, `Subtotal`) VALUES
(1, 1, 2, 1, 2000.00),
(3, 1, 8, 1, 500.00),
(5, 7, 3, 1, 8000.00),
(7, 4, 3, 1, 8000.00),
(8, 5, 3, 1, 8000.00),
(9, 5, 6, 1, 6000.00),
(10, 8, 2, 1, 2000.00),
(12, 9, 2, 1, 2000.00),
(16, 4, 0, 0, 0.00),
(17, 9, 4, 1, 10000.00),
(21, 9, 0, 0, 0.00),
(23, 14, 2, -2, -4000.00),
(26, 9, 0, 0, 0.00),
(28, 16, 2, 1, 2000.00),
(30, 16, 3, 1, 8000.00),
(31, 1, 6, 1, 6000.00),
(32, 19, 4, 1, 10000.00);

--
-- Trigger `detailpenjualan`
--
DELIMITER $$
CREATE TRIGGER `pengurangan` AFTER INSERT ON `detailpenjualan` FOR EACH ROW BEGIN
UPDATE produk SET Stok=Stok-NEW.JumlahProduk WHERE ProdukID=NEW.ProdukID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `PelangganID` varchar(20) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `NomorTelepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`PelangganID`, `NamaPelanggan`, `Alamat`, `NomorTelepon`) VALUES
('1902093825', 'atul', 'sugihan', '08564328262'),
('1902094813', 'nafii', 'DSN KRAJAN 1', '086454322445'),
('2302105219', 'ninik', 'tuban', '85734688'),
('2402015246', 'lina', 'tuban', '5454545'),
('2602064904', 'abc', 'merakurak', '4545266'),
('502043919', 'saya', 'merakurak', '0115444554'),
('502053622', 'zuliyana', 'tuban', '02546558555'),
('602015407', 'kiki', 'tuban', '01572452455'),
('602070358', 'yuyun', 'sugihan', '0254143564');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL,
  `TanggalPenjualan` date NOT NULL,
  `TotalHarga` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PelangganID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `TanggalPenjualan`, `TotalHarga`, `PelangganID`) VALUES
(1, '2024-02-05', 8500.00, '502043919'),
(4, '2024-02-05', 8000.00, '502053622'),
(5, '2024-02-06', 14000.00, '602015407'),
(7, '2024-02-06', 8000.00, '602070358'),
(8, '2024-02-19', 2000.00, '1902093825'),
(9, '2024-02-19', 12000.00, '1902094813'),
(14, '2024-02-23', -4000.00, '2302105219'),
(16, '2024-02-24', 10000.00, '2402015246'),
(19, '2024-02-26', 10000.00, '2602064904');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(255) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `level`) VALUES
(3, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(4, 'Petugas', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 2),
(8, 'nafiatul', 'nafiatul', '202cb962ac59075b964b07152d234b70', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL,
  `NamaProduk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`ProdukID`, `NamaProduk`, `Harga`, `Stok`) VALUES
(2, 'sabun', 2000.00, 11),
(3, 'shampo', 8000.00, 1),
(4, 'beras', 10000.00, 2),
(6, 'sandal', 6000.00, 6),
(7, 'Molto', 2500.00, 8),
(8, 'trasi', 500.00, 5),
(11, 'jajan', 500.00, 1),
(12, 'milo', 2500.00, 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `detailpenjualan` (`PenjualanID`),
  ADD KEY `ProdukID` (`ProdukID`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`PelangganID`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `PelangganID` (`PelangganID`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ProdukID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `PenjualanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `ProdukID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
