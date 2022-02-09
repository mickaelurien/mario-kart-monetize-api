-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : mickaevdb.mysql.db
-- Généré le : dim. 23 jan. 2022 à 12:03
-- Version du serveur : 5.6.50-log
-- Version de PHP : 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mickaevdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `mk8_bodies`
--

CREATE TABLE `mk8_bodies` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `weight` int(10) NOT NULL,
  `acceleration` int(10) NOT NULL,
  `on-road-traction` int(10) NOT NULL,
  `off-road-traction` int(10) NOT NULL,
  `mini-turbo` int(10) NOT NULL,
  `ground-speed` int(10) NOT NULL,
  `water-speed` int(10) NOT NULL,
  `anti-gravity-speed` int(10) NOT NULL,
  `air-speed` int(10) NOT NULL,
  `ground-handling` int(10) NOT NULL,
  `water-handling` int(10) NOT NULL,
  `anti-gravity-handling` int(10) NOT NULL,
  `air-handling` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mk8_bodies`
--

INSERT INTO `mk8_bodies` (`id`, `name`, `weight`, `acceleration`, `on-road-traction`, `off-road-traction`, `mini-turbo`, `ground-speed`, `water-speed`, `anti-gravity-speed`, `air-speed`, `ground-handling`, `water-handling`, `anti-gravity-handling`, `air-handling`) VALUES
(1, 'standard kart', 2, 4, 3, 3, 4, 3, 3, 3, 3, 3, 2, 3, 3),
(2, 'pipe frame', 1, 6, 3, 4, 6, 1, 3, 1, 1, 5, 4, 4, 2),
(3, 'mach 8', 3, 3, 2, 4, 4, 3, 3, 5, 4, 2, 2, 4, 2),
(4, 'steel driver', 4, 1, 1, 3, 2, 4, 5, 2, 0, 1, 5, 1, 1),
(5, 'car cruiser', 2, 5, 4, 3, 5, 2, 2, 3, 4, 4, 2, 3, 4),
(6, 'circuit special', 3, 1, 3, 1, 1, 5, 1, 4, 2, 1, 1, 2, 0),
(7, 'tri-speeder', 4, 1, 1, 3, 2, 4, 5, 2, 0, 1, 5, 1, 1),
(8, 'badwagon', 4, 0, 2, 5, 0, 5, 2, 3, 1, 0, 1, 1, 0),
(9, 'prancer', 1, 2, 1, 2, 3, 4, 3, 3, 3, 3, 3, 2, 3),
(10, 'biddybuggy', 0, 7, 1, 4, 7, 0, 1, 2, 1, 5, 4, 5, 4),
(11, 'landship', 0, 6, 0, 6, 6, 1, 5, 0, 2, 4, 5, 2, 3),
(12, 'sneeker', 2, 2, 1, 0, 3, 4, 2, 3, 3, 3, 2, 3, 2),
(13, 'sports coupe', 3, 3, 2, 4, 4, 3, 3, 5, 4, 2, 2, 4, 2),
(14, 'gold kart', 2, 2, 1, 0, 3, 4, 2, 3, 3, 3, 2, 3, 2),
(15, 'standard bike', 1, 5, 3, 5, 5, 2, 2, 4, 3, 4, 3, 4, 3),
(16, 'comet', 2, 5, 4, 3, 5, 2, 2, 3, 4, 4, 2, 3, 4),
(17, 'sport bike', 1, 2, 1, 2, 3, 4, 3, 3, 3, 3, 3, 2, 3),
(18, 'the duke', 2, 4, 3, 3, 4, 3, 3, 3, 3, 3, 2, 3, 3),
(19, 'flame rider', 1, 5, 3, 5, 5, 2, 2, 4, 3, 4, 3, 4, 3),
(20, 'varmint', 1, 6, 3, 4, 6, 1, 3, 1, 1, 5, 4, 4, 2),
(21, 'mr. scooty', 0, 7, 1, 4, 7, 0, 1, 2, 1, 5, 4, 5, 4),
(22, 'jet bike', 1, 2, 1, 2, 3, 4, 3, 3, 3, 3, 3, 2, 3),
(23, 'yoshi bike', 2, 5, 4, 3, 5, 2, 2, 3, 4, 4, 2, 3, 4),
(24, 'standard ATV', 4, 0, 2, 5, 0, 5, 2, 3, 1, 0, 1, 1, 0),
(25, 'wild wiggler', 1, 5, 3, 5, 5, 2, 2, 4, 3, 4, 3, 4, 3),
(26, 'teddy buggy', 2, 5, 4, 3, 5, 2, 2, 3, 4, 4, 2, 3, 4),
(27, 'GLA', 4, 0, 2, 5, 0, 5, 2, 3, 1, 0, 1, 1, 0),
(28, 'W 25 silver arrow', 1, 5, 3, 5, 5, 2, 2, 4, 3, 4, 3, 4, 3),
(29, '300 SL roadster', 2, 4, 3, 3, 4, 3, 3, 3, 3, 3, 2, 3, 3),
(30, 'blue falcon', 0, 3, 1, 3, 3, 4, 2, 4, 3, 2, 3, 5, 1),
(31, 'tanooki kart', 3, 2, 4, 7, 3, 2, 4, 3, 3, 4, 4, 3, 3),
(32, 'B dasher', 3, 1, 3, 1, 1, 5, 1, 4, 2, 1, 1, 2, 0),
(33, 'master cycle', 2, 2, 1, 0, 3, 4, 2, 3, 3, 3, 2, 3, 2),
(34, 'streetle', 0, 6, 0, 6, 6, 1, 5, 0, 2, 4, 5, 2, 3),
(35, 'p-wing', 3, 1, 3, 1, 1, 5, 1, 4, 2, 1, 1, 2, 0),
(36, 'city tripper', 1, 6, 3, 4, 6, 1, 3, 1, 1, 5, 4, 4, 2),
(37, 'bone rattler', 4, 1, 1, 3, 2, 4, 5, 2, 0, 1, 5, 1, 1),
(38, 'koopa clown', 3, 2, 4, 7, 3, 2, 4, 3, 3, 4, 4, 3, 3),
(39, 'splat buggy', 0, 3, 1, 3, 3, 4, 2, 4, 3, 2, 3, 5, 1),
(40, 'inkstriker', 3, 3, 2, 4, 4, 3, 3, 5, 4, 2, 2, 4, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mk8_bodies`
--
ALTER TABLE `mk8_bodies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mk8_bodies`
--
ALTER TABLE `mk8_bodies`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
