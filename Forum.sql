-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 13 Juin 2018 à 10:00
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `discussion`
--

CREATE TABLE `discussion` (
  `id_dis` int(11) NOT NULL,
  `name_discussion` varchar(255) COLLATE utf8_bin NOT NULL,
  `name_sous_salon` varchar(255) COLLATE utf8_bin NOT NULL,
  `nbr_post` smallint(5) NOT NULL,
  `date_creation` datetime NOT NULL,
  `auteur` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_post` int(11) NOT NULL,
  `date_envoi` datetime NOT NULL,
  `pseudo` varchar(32) COLLATE utf8_bin NOT NULL,
  `name_discussion` varchar(32) COLLATE utf8_bin NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `salon`
--

CREATE TABLE `salon` (
  `id_salon` int(1) NOT NULL,
  `name_salon` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `salon`
--

INSERT INTO `salon` (`id_salon`, `name_salon`) VALUES
(1, 'Maison'),
(2, 'Santé & Bien-être'),
(3, 'Vêtement et Accessoires'),
(4, 'Drône'),
(5, 'Mobilité'),
(6, 'Loisirs'),
(7, 'Insolite');

-- --------------------------------------------------------

--
-- Structure de la table `sous_salon`
--

CREATE TABLE `sous_salon` (
  `id_ss` int(11) NOT NULL,
  `id_salon` int(11) NOT NULL,
  `name_sous_salon` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `sous_salon`
--

INSERT INTO `sous_salon` (`id_ss`, `id_salon`, `name_sous_salon`) VALUES
(1, 1, 'salon'),
(2, 1, 'cuisine'),
(3, 1, 'chambre'),
(4, 1, 'salle de bain'),
(5, 1, 'bureau eclairage'),
(6, 1, 'électroménager'),
(7, 1, 'chauffage'),
(8, 1, 'sécurité'),
(9, 1, 'jardin'),
(10, 2, 'beauté'),
(11, 2, 'régime'),
(12, 2, 'soleil'),
(13, 2, 'sport'),
(14, 3, 'vêtements'),
(15, 3, 'chaussures'),
(16, 3, 'ceintures'),
(17, 3, 'bijoux'),
(18, 3, 'lunettes'),
(19, 3, 'montres'),
(20, 4, 'drône'),
(21, 5, 'moto'),
(22, 5, 'voitures'),
(23, 5, 'trotinettes électriques'),
(24, 5, 'vélo & accessoires'),
(25, 6, 'réalité virtuelle'),
(26, 6, 'vacances'),
(27, 6, 'jouets'),
(28, 7, 'insomite');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_u` smallint(4) NOT NULL,
  `pseudo` varchar(32) COLLATE utf8_bin NOT NULL,
  `mail` varchar(32) COLLATE utf8_bin NOT NULL,
  `pwd` varchar(32) COLLATE utf8_bin NOT NULL,
  `date_inscription` datetime NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`id_dis`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_post`);

--
-- Index pour la table `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`id_salon`);

--
-- Index pour la table `sous_salon`
--
ALTER TABLE `sous_salon`
  ADD PRIMARY KEY (`id_ss`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_u`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `discussion`
--
ALTER TABLE `discussion`
  MODIFY `id_dis` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `salon`
--
ALTER TABLE `salon`
  MODIFY `id_salon` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `sous_salon`
--
ALTER TABLE `sous_salon`
  MODIFY `id_ss` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_u` smallint(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
