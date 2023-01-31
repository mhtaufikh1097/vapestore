-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Okt 2022 pada 16.07
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_warung`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(20) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin_telp` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(1, 'Joni Iskandar Saepudin', 'admin', '0192023a7bbd73250516f069df18b500', '0989897923', 'admin1990@gmail.com', 'Cipatik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(13, 'Laptop'),
(14, 'Handphone'),
(15, 'Pakaian Pria'),
(16, 'Pakaian Wanita'),
(17, 'Sayur'),
(18, 'Buah'),
(19, 'Mod');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_product`
--

CREATE TABLE `tb_product` (
  `product_id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_product`
--

INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`) VALUES
(10, 13, 'Assus a564', 5000000, '<p>Speksifikasi laptop</p>\r\n\r\n<p>-Kode SKU PRT-60028-00824</p>\r\n\r\n<p>-Kode Produk MTA-14663231</p>\r\n\r\n<p>-Kode EAN ASUS X441UB-GA322T</p>\r\n', 'produk1665645156.jpg', 1, '2022-10-13 07:12:36'),
(11, 18, 'Jeruk', 12000, '<p>Jeruk asli uruguay</p>\r\n', 'produk1665645233.jpeg', 1, '2022-10-13 07:13:53'),
(12, 15, 'Jas', 580000, '<p>jas ini sangat cocok untuk tamasya</p>\r\n', 'produk1665645274.jpg', 1, '2022-10-13 07:14:34'),
(13, 15, 'Jersey', 120000, '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat beatae modi, quibusdam nulla optio hic, iusto est, perferendis quasi harum ratione culpa voluptatum quis quisquam fuga dolorem atque cum possimus assumenda doloribus. Pariatur labore a quod veritatis officiis dolorum aliquid necessitatibus dolor placeat obcaecati omnis, eum beatae nesciunt rerum vero neque nihil unde aspernatur impedit aperiam assumenda consequatur ipsam? Alias dignissimos dolore aut, accusantium corporis esse veritatis sunt officia repudiandae vero quia repellat nam natus reiciendis, veniam nemo provident cumque quisquam. Voluptatum nesciunt accusamus voluptatibus suscipit facilis soluta non aut tenetur quidem mollitia? Veniam cumque iste, excepturi facere fugit ad.</p>\r\n', 'produk1665645353.jpg', 1, '2022-10-13 07:15:53'),
(14, 16, 'Baju Hawai', 120000, '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat beatae modi, quibusdam nulla optio hic, iusto est, perferendis quasi harum ratione culpa voluptatum quis quisquam fuga dolorem atque cum possimus assumenda doloribus. Pariatur labore a quod veritatis officiis dolorum aliquid necessitatibus dolor placeat obcaecati omnis, eum beatae nesciunt rerum vero neque nihil unde aspernatur impedit aperiam assumenda consequatur ipsam? Alias dignissimos dolore aut, accusantium corporis esse veritatis sunt officia repudiandae vero quia repellat nam natus reiciendis, veniam nemo provident cumque quisquam. Voluptatum nesciunt accusamus voluptatibus suscipit facilis soluta non aut tenetur quidem mollitia? Veniam cumque iste, excepturi facere fugit ad.</p>\r\n', 'produk1665645492.JPG', 1, '2022-10-13 07:18:12'),
(15, 16, 'Baju cina', 347899, '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat beatae modi, quibusdam nulla optio hic, iusto est, perferendis quasi harum ratione culpa voluptatum quis quisquam fuga doxcepturi facere fugit ad.</p>\r\n', 'produk1665645520.JPG', 1, '2022-10-13 07:18:40'),
(16, 14, 'Iphone 14', 8000000, '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat beatae modi, quibusdam nulla optio hic, iusto est, perferendis quasi harum ratione culpa voluptatum quis quisquam fuga dolorem atque cum possimus assumenda doloribus. Pariatur labore a quod veritatis officiis dolorum aliquid necessitatibus dolor placeat obcaecati omnis, eum beatae nesciunt rerum vero neque nihil unde aspernatur impedit aperiam assumenda consequatur ipsam? Alias dignissimos dolore aut, accusantium corporis esse veritatis sunt officia repudiandae vero quia repellat nam natus reiciendis, veniam nemo provident cumque quisquam. Voluptatum nesciunt accusamus voluptatibus suscipit facilis soluta non aut tenetur quidem mollitia? Veniam cumque iste, excepturi facere fugit ad.</p>\r\n', 'produk1665645585.jpg', 1, '2022-10-14 01:49:12'),
(17, 17, 'Sayur kol', 7000, '<p>Lorem ipsum dolor sit ame</p>\r\n', 'produk1665645620.JPG', 0, '2022-10-14 02:18:34'),
(18, 19, 'Drag 3 Series all new', 450000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714087.jpg', 1, '2022-10-14 02:21:27'),
(19, 19, 'drag minion', 250000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714147.jpg', 1, '2022-10-14 02:22:27'),
(20, 19, 'Joy tech', 200000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714196.jpg', 1, '2022-10-14 02:23:16'),
(21, 19, 'Hexom', 750000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714478.jpg', 1, '2022-10-14 02:27:58'),
(22, 19, 'Vanda series', 500000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714519.jpg', 1, '2022-10-14 02:28:39'),
(23, 19, 'r233', 400000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714546.jpg', 1, '2022-10-14 02:29:06'),
(24, 19, 'aegis', 550000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714681.jpg', 1, '2022-10-14 02:31:21'),
(25, 19, 'Puma', 350000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam illo quasi nulla enim eaque eius voluptatem accusamus, neque odit voluptas delectus itaque magni totam, cumque dolorem officiis assumenda officia tempore?</p>\r\n', 'produk1665714801.jpg', 0, '2022-10-16 07:26:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `product_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
