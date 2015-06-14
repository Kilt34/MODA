-- phpMyAdmin SQL Dump
-- version 4.4.9
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 13 Juin 2015 à 18:53
-- Version du serveur :  5.5.43-0ubuntu0.14.04.1
-- Version de PHP :  5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `MODA`
--

-- --------------------------------------------------------

--
-- Structure de la table `Commentaire`
--

CREATE TABLE IF NOT EXISTS `Commentaire` (
  `id` int(11) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `id_creation` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Commentaire`
--

INSERT INTO `Commentaire` (`id`, `auteur`, `message`, `id_creation`) VALUES
(1, '::1', 'fdsqfdsqfdsqfds', 3),
(2, '::1', 'fdsfdsfdsqfdsq', 5);

-- --------------------------------------------------------

--
-- Structure de la table `Creation`
--

CREATE TABLE IF NOT EXISTS `Creation` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `likes` int(5) NOT NULL,
  `id_creatrice` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Creation`
--

INSERT INTO `Creation` (`id`, `libelle`, `description`, `likes`, `id_creatrice`) VALUES
(3, 'La petite robe noire', 'vetements', 0, 0),
(4, 'Bustier', 'vetements', 5, 0),
(5, 'Pochette', 'accessoires', 8, 0),
(6, 'Bijoux', 'accessoires', 3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Creatrice`
--

CREATE TABLE IF NOT EXISTS `Creatrice` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Image`
--

CREATE TABLE IF NOT EXISTS `Image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `id_creation` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Image`
--

INSERT INTO `Image` (`id`, `url`, `id_creation`) VALUES
(1, 'image2.jpg', 3),
(2, 'image3.jpg', 5),
(3, 'image5.jpg', 4),
(4, 'image6.jpg', 6);

-- --------------------------------------------------------

--
-- Structure de la table `Reservation`
--

CREATE TABLE IF NOT EXISTS `Reservation` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` int(10) NOT NULL,
  `id_creation` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Creation`
--
ALTER TABLE `Creation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Creatrice`
--
ALTER TABLE `Creatrice`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `Creation`
--
ALTER TABLE `Creation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `Creatrice`
--
ALTER TABLE `Creatrice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
