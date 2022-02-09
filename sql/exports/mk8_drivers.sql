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
-- Structure de la table `mk8_drivers`
--

CREATE TABLE `mk8_drivers` (
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
-- Déchargement des données de la table `mk8_drivers`
--

INSERT INTO `mk8_drivers` (`id`, `name`, `weight`, `acceleration`, `on-road-traction`, `off-road-traction`, `mini-turbo`, `ground-speed`, `water-speed`, `anti-gravity-speed`, `air-speed`, `ground-handling`, `water-handling`, `anti-gravity-handling`, `air-handling`) VALUES
(1, 'mario', 6, 2, 4, 2, 2, 6, 6, 6, 6, 4, 4, 4, 4),
(2, 'luigi', 6, 2, 5, 1, 2, 6, 6, 6, 6, 5, 5, 5, 5),
(3, 'peach', 4, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5, 5),
(4, 'daisy', 4, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5, 5),
(5, 'yoshi', 4, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5, 5),
(6, 'toad', 3, 4, 3, 4, 3, 3, 3, 3, 3, 7, 7, 7, 7),
(7, 'koopa troopa', 2, 4, 1, 5, 4, 2, 2, 2, 2, 8, 8, 8, 8),
(8, 'bowser', 10, 0, 6, 0, 0, 10, 10, 10, 10, 0, 0, 0, 0),
(9, 'donkey kong', 8, 1, 10, 0, 1, 9, 9, 9, 9, 2, 2, 2, 2),
(10, 'wario', 9, 0, 5, 1, 0, 10, 10, 10, 10, 1, 1, 1, 1),
(11, 'waluigi', 8, 1, 10, 0, 1, 9, 9, 9, 9, 2, 2, 2, 2),
(12, 'rosalina', 7, 1, 9, 3, 2, 7, 7, 7, 7, 3, 3, 3, 3),
(13, 'metal mario', 10, 1, 8, 1, 1, 8, 8, 8, 8, 3, 3, 3, 3),
(14, 'pink gold peach', 10, 1, 8, 1, 1, 8, 8, 8, 8, 3, 3, 3, 3),
(15, 'lakitu', 2, 4, 1, 5, 4, 2, 2, 2, 2, 8, 8, 8, 8),
(16, 'shy guy', 3, 4, 3, 4, 3, 3, 3, 3, 3, 7, 7, 7, 7),
(17, 'baby mario', 1, 5, 2, 4, 4, 1, 1, 1, 1, 8, 8, 8, 8),
(18, 'baby luigi', 1, 5, 2, 4, 4, 1, 1, 1, 1, 8, 8, 8, 8),
(19, 'baby peach', 0, 4, 3, 5, 5, 0, 0, 0, 0, 10, 10, 10, 10),
(20, 'baby daisy', 0, 4, 3, 5, 5, 0, 0, 0, 0, 10, 10, 10, 10),
(21, 'baby rosalina', 0, 5, 4, 3, 5, 0, 0, 0, 0, 9, 9, 9, 9),
(22, 'larry', 3, 4, 3, 4, 3, 3, 3, 3, 3, 7, 7, 7, 7),
(23, 'lemmy', 0, 5, 4, 3, 5, 0, 0, 0, 0, 9, 9, 9, 9),
(24, 'wendy', 2, 5, 4, 2, 4, 2, 2, 2, 2, 7, 7, 7, 7),
(25, 'ludwig', 6, 2, 4, 2, 2, 6, 6, 6, 6, 4, 4, 4, 4),
(26, 'iggy', 6, 2, 5, 1, 2, 6, 6, 6, 6, 5, 5, 5, 5),
(27, 'roy', 8, 1, 10, 0, 1, 9, 9, 9, 9, 2, 2, 2, 2),
(28, 'morton', 10, 0, 6, 0, 0, 10, 10, 10, 10, 0, 0, 0, 0),
(29, 'mii (medium)', 6, 2, 4, 2, 2, 6, 6, 6, 6, 4, 4, 4, 4),
(30, 'tanooki mario', 5, 3, 7, 1, 3, 5, 5, 5, 5, 5, 5, 5, 5),
(31, 'link', 7, 1, 9, 3, 2, 7, 7, 7, 7, 3, 3, 3, 3),
(32, 'villager (male)', 5, 3, 7, 1, 3, 5, 5, 5, 5, 5, 5, 5, 5),
(33, 'isabelle', 2, 5, 4, 2, 4, 2, 2, 2, 2, 7, 7, 7, 7),
(34, 'cat peach', 3, 4, 2, 3, 3, 4, 4, 4, 4, 6, 6, 6, 6),
(35, 'dry bowser', 9, 0, 5, 1, 0, 10, 10, 10, 10, 1, 1, 1, 1),
(36, 'villager (female)', 3, 4, 2, 3, 3, 4, 4, 4, 4, 6, 6, 6, 6),
(37, 'gold mario', 10, 1, 8, 1, 1, 8, 8, 8, 8, 3, 3, 3, 3),
(38, 'dry bones', 1, 5, 2, 4, 4, 1, 1, 1, 1, 8, 8, 8, 8),
(39, 'bowser jr.', 2, 4, 1, 5, 4, 2, 2, 2, 2, 8, 8, 8, 8),
(40, 'king boo', 7, 1, 9, 3, 2, 7, 7, 7, 7, 3, 3, 3, 3),
(41, 'inkling girl', 3, 4, 2, 3, 3, 4, 4, 4, 4, 6, 6, 6, 6),
(42, 'inkling boy', 5, 3, 7, 1, 3, 5, 5, 5, 5, 5, 5, 5, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mk8_drivers`
--
ALTER TABLE `mk8_drivers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mk8_drivers`
--
ALTER TABLE `mk8_drivers`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
