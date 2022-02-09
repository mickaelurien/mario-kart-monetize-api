-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : mickaevdb.mysql.db
-- Généré le : dim. 23 jan. 2022 à 12:04
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
-- Structure de la table `mk8_tires`
--

CREATE TABLE `mk8_tires` (
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
-- Déchargement des données de la table `mk8_tires`
--

INSERT INTO `mk8_tires` (`id`, `name`, `weight`, `acceleration`, `on-road-traction`, `off-road-traction`, `mini-turbo`, `ground-speed`, `water-speed`, `anti-gravity-speed`, `air-speed`, `ground-handling`, `water-handling`, `anti-gravity-handling`, `air-handling`) VALUES
(1, 'standard', 2, 4, 2, 5, 3, 2, 3, 2, 3, 3, 3, 3, 3),
(2, 'monster', 4, 2, 3, 7, 2, 2, 2, 2, 1, 0, 1, 0, 1),
(3, 'roller', 0, 6, 0, 4, 6, 0, 3, 0, 3, 4, 4, 4, 4),
(4, 'slim', 2, 2, 4, 1, 2, 3, 2, 4, 2, 4, 4, 3, 4),
(5, 'slick', 3, 1, 4, 0, 0, 4, 0, 4, 0, 2, 0, 2, 1),
(6, 'metal', 4, 0, 1, 2, 0, 4, 3, 1, 2, 2, 2, 1, 0),
(7, 'button', 0, 5, 1, 3, 5, 1, 2, 2, 2, 3, 3, 4, 2),
(8, 'off-road', 3, 3, 3, 6, 1, 3, 4, 2, 1, 1, 1, 2, 2),
(9, 'sponge', 1, 4, 2, 6, 4, 1, 1, 1, 4, 2, 1, 2, 3),
(10, 'wood', 2, 2, 4, 1, 2, 3, 2, 4, 2, 4, 4, 3, 4),
(11, 'cushion', 1, 4, 2, 6, 4, 1, 1, 1, 4, 2, 1, 2, 3),
(12, 'blue standard', 2, 4, 2, 5, 3, 2, 3, 2, 3, 3, 3, 3, 3),
(13, 'hot monster', 4, 2, 3, 7, 2, 2, 2, 2, 1, 0, 1, 0, 1),
(14, 'azur roller', 0, 6, 0, 4, 6, 0, 3, 0, 3, 4, 4, 4, 4),
(15, 'crimson slim', 2, 2, 4, 1, 2, 3, 2, 4, 2, 4, 4, 3, 4),
(16, 'cyber slick', 3, 1, 4, 0, 0, 4, 0, 4, 0, 2, 0, 2, 1),
(17, 'retro off-road', 3, 3, 3, 6, 1, 3, 4, 2, 1, 1, 1, 2, 2),
(18, 'gold tires', 4, 0, 1, 2, 0, 4, 3, 1, 2, 2, 2, 1, 0),
(19, 'GLA tires', 2, 4, 2, 5, 3, 2, 3, 2, 3, 3, 3, 3, 3),
(20, 'triforce tires', 3, 3, 3, 6, 1, 3, 4, 2, 1, 1, 1, 2, 2),
(21, 'leaf tires', 0, 5, 1, 3, 5, 1, 2, 2, 2, 3, 3, 4, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mk8_tires`
--
ALTER TABLE `mk8_tires`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mk8_tires`
--
ALTER TABLE `mk8_tires`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
