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
-- Structure de la table `mk8_gliders`
--

CREATE TABLE `mk8_gliders` (
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
-- Déchargement des données de la table `mk8_gliders`
--

INSERT INTO `mk8_gliders` (`id`, `name`, `weight`, `acceleration`, `on-road-traction`, `off-road-traction`, `mini-turbo`, `ground-speed`, `water-speed`, `anti-gravity-speed`, `air-speed`, `ground-handling`, `water-handling`, `anti-gravity-handling`, `air-handling`) VALUES
(1, 'super glider', 1, 1, 1, 1, 1, 1, 1, 0, 2, 1, 0, 1, 1),
(2, 'cloud glider', 0, 2, 1, 1, 2, 0, 1, 1, 1, 1, 0, 1, 2),
(3, 'wario wing', 2, 1, 2, 0, 1, 1, 0, 1, 2, 1, 1, 0, 1),
(4, 'waddle wing', 1, 1, 1, 1, 1, 1, 1, 0, 2, 1, 0, 1, 1),
(5, 'peach parasol', 1, 2, 2, 0, 2, 0, 0, 1, 1, 1, 1, 0, 2),
(6, 'parachute', 0, 2, 1, 1, 2, 0, 1, 1, 1, 1, 0, 1, 2),
(7, 'parafoil', 1, 2, 2, 0, 2, 0, 0, 1, 1, 1, 1, 0, 2),
(8, 'flower glider', 0, 2, 1, 1, 2, 0, 1, 1, 1, 1, 0, 1, 2),
(9, 'bowser kite', 1, 2, 2, 0, 2, 0, 0, 1, 1, 1, 1, 0, 2),
(10, 'plane glider', 2, 1, 2, 0, 1, 1, 0, 1, 2, 1, 1, 0, 1),
(11, 'MKTV parafoil', 1, 2, 2, 0, 2, 0, 0, 1, 1, 1, 1, 0, 2),
(12, 'gold glider', 2, 1, 2, 0, 1, 1, 0, 1, 2, 1, 1, 0, 1),
(13, 'hylian kite', 1, 1, 1, 1, 1, 1, 1, 0, 2, 1, 0, 1, 1),
(14, 'paper glider', 0, 2, 1, 1, 2, 0, 1, 1, 1, 1, 0, 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mk8_gliders`
--
ALTER TABLE `mk8_gliders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mk8_gliders`
--
ALTER TABLE `mk8_gliders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
