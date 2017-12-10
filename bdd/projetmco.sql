-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 10 Décembre 2017 à 22:31
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetmco`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `nom_album` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `nombre_titre` int(11) NOT NULL,
  `date_sortie` date NOT NULL,
  `description_album` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `id_pays` int(11) NOT NULL,
  `id_artiste` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `album`
--

INSERT INTO `album` (`id_album`, `nom_album`, `nombre_titre`, `date_sortie`, `description_album`, `id_pays`, `id_artiste`, `id_genre`) VALUES
(1, 'ZIFIKURO', 15, '2016-07-12', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `id_artiste` int(11) NOT NULL,
  `nom_artiste` varchar(100) CHARACTER SET ucs2 COLLATE ucs2_general_mysql500_ci NOT NULL,
  `description_artiste` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `id_pays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artiste`
--

INSERT INTO `artiste` (`id_artiste`, `nom_artiste`, `description_artiste`, `id_pays`) VALUES
(1, 'NISKA', 'koro des koro', 1);

-- --------------------------------------------------------

--
-- Structure de la table `chante`
--

CREATE TABLE `chante` (
  `id_artiste` int(11) NOT NULL,
  `id_morceaux` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `nom_genre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_genre` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id_genre`, `nom_genre`, `description_genre`) VALUES
(1, 'RAP FRANCAIS', 'en France');

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

CREATE TABLE `jouer` (
  `id_morceaux` int(11) NOT NULL,
  `id_pays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `morceaux`
--

CREATE TABLE `morceaux` (
  `id_morceaux` int(11) NOT NULL,
  `titre_morceaux` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `lien_morceaux` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_morceaux` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int(11) NOT NULL,
  `nom_pays` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description_pays` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`id_pays`, `nom_pays`, `description_pays`) VALUES
(1, 'FRANCE', 'francais');

-- --------------------------------------------------------

--
-- Structure de la table `pratique`
--

CREATE TABLE `pratique` (
  `id_artiste` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD UNIQUE KEY `id_album` (`id_album`),
  ADD UNIQUE KEY `id_album_2` (`id_album`),
  ADD KEY `id_pays` (`id_pays`),
  ADD KEY `id_artiste` (`id_artiste`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`id_artiste`),
  ADD UNIQUE KEY `id_artiste` (`id_artiste`),
  ADD UNIQUE KEY `id_artiste_2` (`id_artiste`),
  ADD KEY `id_pays` (`id_pays`);

--
-- Index pour la table `chante`
--
ALTER TABLE `chante`
  ADD PRIMARY KEY (`id_artiste`,`id_morceaux`),
  ADD UNIQUE KEY `id_artiste_2` (`id_artiste`,`id_morceaux`),
  ADD KEY `id_artiste` (`id_artiste`),
  ADD KEY `id_morceaux` (`id_morceaux`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`),
  ADD UNIQUE KEY `id_genre` (`id_genre`),
  ADD UNIQUE KEY `id_genre_2` (`id_genre`);

--
-- Index pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD PRIMARY KEY (`id_morceaux`,`id_pays`),
  ADD UNIQUE KEY `id_morceaux_2` (`id_morceaux`,`id_pays`),
  ADD KEY `id_morceaux` (`id_morceaux`),
  ADD KEY `id_pays` (`id_pays`);

--
-- Index pour la table `morceaux`
--
ALTER TABLE `morceaux`
  ADD PRIMARY KEY (`id_morceaux`),
  ADD UNIQUE KEY `id_morceaux` (`id_morceaux`),
  ADD UNIQUE KEY `id_morceaux_2` (`id_morceaux`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_album` (`id_album`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`),
  ADD UNIQUE KEY `id_pays` (`id_pays`),
  ADD UNIQUE KEY `id_pays_3` (`id_pays`),
  ADD KEY `id_pays_2` (`id_pays`);

--
-- Index pour la table `pratique`
--
ALTER TABLE `pratique`
  ADD PRIMARY KEY (`id_artiste`,`id_genre`),
  ADD UNIQUE KEY `id_artiste_2` (`id_artiste`,`id_genre`),
  ADD UNIQUE KEY `id_artiste_3` (`id_artiste`,`id_genre`),
  ADD KEY `id_artiste` (`id_artiste`),
  ADD KEY `id_genre` (`id_genre`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `id_artiste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `morceaux`
--
ALTER TABLE `morceaux`
  MODIFY `id_morceaux` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id_pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_cleE1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `album_cleE2` FOREIGN KEY (`id_artiste`) REFERENCES `artiste` (`id_artiste`),
  ADD CONSTRAINT `album_cleE3` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `pays_cleE1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `morceaux`
--
ALTER TABLE `morceaux`
  ADD CONSTRAINT `morceaux_cleE1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `morceaux_cleE2` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
