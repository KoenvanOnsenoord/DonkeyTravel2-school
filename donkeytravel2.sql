-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 20 apr 2023 om 14:56
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donkeytravel2`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `donkey_adventure_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230420093339', '2023-04-20 11:33:47', 84),
('DoctrineMigrations\\Version20230420093433', '2023-04-20 11:34:42', 40),
('DoctrineMigrations\\Version20230420093538', '2023-04-20 11:35:41', 157),
('DoctrineMigrations\\Version20230420095055', '2023-04-20 11:51:02', 41),
('DoctrineMigrations\\Version20230420095151', '2023-04-20 11:51:54', 139);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `donkey_adventure`
--

CREATE TABLE `donkey_adventure` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `donkey_adventure`
--

INSERT INTO `donkey_adventure` (`id`, `name`, `start_location`, `end_location`, `days`, `description`) VALUES
(1, 'Route 1', 'Start Location 1', 'End Location 1', '2023-04-20', 'Lorem Ipsum'),
(2, 'Route 2', 'Start Location 2', 'End Location 2', '2023-04-21', 'Lorem Ipsum');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'klant@mail.com', '[\"ROLE_KLANT\"]', '$2y$13$P9BqSIlItT.Y5GQNmHYKnu/V1QaGMz917.aW7j6bKVH7E30w/BHsC'),
(2, 'admin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$P9BqSIlItT.Y5GQNmHYKnu/V1QaGMz917.aW7j6bKVH7E30w/BHsC'),
(3, 'ik@ik.nl', '[]', '$2y$13$xRgTvK5M2a8LcpRPv4U45uSY5Ysq0cnwke9Ug0j98IVASBPS5Kzwq'),
(4, 'test@mail.com', '[]', '$2y$13$icfrABxhCNNMOmCZN1YVQ.A5qgQ6VrrQAfdjwdg9H4u.HFOon3AEu'),
(5, 'koen@mail.com', '[]', '$2y$13$gwy7rhLfYhJFKCAgQbOFAuNs/C8Ut2nppt.QRmwnLVLCn3fLVJCu.'),
(6, 'dwadw@mail.com', '[\"ROLE_GUEST\"]', '$2y$13$4ku3/vManbvzgL7aCWyF0O8NnEStrcJ60GjqdYYWuYhvEJRunYRHy'),
(7, 'klant1@mail.com', '[\"ROLE_KLANT\"]', '$2y$13$0GiPetIEK11UiEDAPN2l/Oaz42LaFTgEMrcoTRImu/Qivj2HL5jn6'),
(8, 'register@mail.com', '[\"ROLE_KLANT\"]', '$2y$13$xzZOTQ4ZiUcD6kcJKZVxS.9fb0.YDqGfPvGCwCJzAKJpBGS/PGU3y');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E00CEDDE2D63E894` (`donkey_adventure_id`),
  ADD KEY `IDX_E00CEDDEA76ED395` (`user_id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `donkey_adventure`
--
ALTER TABLE `donkey_adventure`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `donkey_adventure`
--
ALTER TABLE `donkey_adventure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_E00CEDDE2D63E894` FOREIGN KEY (`donkey_adventure_id`) REFERENCES `donkey_adventure` (`id`),
  ADD CONSTRAINT `FK_E00CEDDEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
