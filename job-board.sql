-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 11 déc. 2023 à 09:45
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `job-board`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `id_annonce` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `Salaire` varchar(20) NOT NULL,
  `horaire` varchar(30) NOT NULL,
  `démaré_le` date DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `id_secteur` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id_annonce`, `Description`, `titre`, `Salaire`, `horaire`, `démaré_le`, `adresse`, `id_secteur`, `id_entreprise`) VALUES
(7, 'uiporsiuorjiosjioes', 'Test', '567', '35heures', '2023-10-18', 'Nancy', 3, 8),
(8, 'j\'ai pris mon KATANA', 'KATANA', '1000', '34H', '2023-11-28', 'Metz', 3, 7),
(9, 'nkjfs', 'Sys Admin', '50', '40 heures', '2023-11-29', 'Paris', 5, 7);

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE `candidature` (
  `id_candidature` int(11) NOT NULL,
  `message` varchar(50) DEFAULT NULL,
  `email_candid` varchar(50) DEFAULT NULL,
  `prenom_candid` varchar(50) DEFAULT NULL,
  `nom_candid` varchar(50) DEFAULT NULL,
  `telephone_candid` varchar(50) DEFAULT NULL,
  `cv` varchar(150) DEFAULT NULL,
  `id_annonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `candidature`
--

INSERT INTO `candidature` (`id_candidature`, `message`, `email_candid`, `prenom_candid`, `nom_candid`, `telephone_candid`, `cv`, `id_annonce`) VALUES
(1, 'je veux un travail', 'axel@test.com', 'Axel', 'Morin', '076634567890', NULL, 7),
(2, 'salut ça va moi oue ', 'salut@salut.com', 'SalutMan', 'ManSalut', '34567890', NULL, 7);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email_client` varchar(50) DEFAULT NULL,
  `telephone_client` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `mot_de_passe` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom`, `email_client`, `telephone_client`, `genre`, `mot_de_passe`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '  667', NULL, '$2y$10$bOhVzod4Y4Z39IFcZTUCnOTsKFdy4J/D3QAua5NMGe1.YW/EMwHaG'),
(16, 'morin', 'axel', 'axel@gmail.com', '34567', NULL, '$2y$10$V0UGLaUazqis77G8smkAyevCKdMtSRLeHfBsceOk4l4QObRtI0vWi');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `nom_entreprise` varchar(50) DEFAULT NULL,
  `telephone_entreprise` varchar(50) DEFAULT NULL,
  `email_entreprise` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id_entreprise`, `nom_entreprise`, `telephone_entreprise`, `email_entreprise`) VALUES
(3, 'juge', '456789    ', 'jujutsukaizen@juju.com'),
(5, 'huawei', '34567890', 'huawei@epitech.eu'),
(7, 'DEEPCORP', '03456789', 'deepcorp@deep.com'),
(8, 'xiaomi ', '0323456789 ', 'xiaomi@xiaomi.eeu'),
(9, 'la ferme', '0334567890', 'laferme@ferme.ferme');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `id_secteur` int(11) NOT NULL,
  `nom_metier` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`id_secteur`, `nom_metier`) VALUES
(1, 'banquier'),
(2, 'rappeur'),
(3, 'fromager'),
(4, 'boulanger'),
(5, 'barman'),
(6, 'trader'),
(7, 'rienfaire');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`id_annonce`),
  ADD KEY `id_secteur` (`id_secteur`),
  ADD KEY `id_entreprise` (`id_entreprise`);

--
-- Index pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD PRIMARY KEY (`id_candidature`),
  ADD KEY `id_annonce` (`id_annonce`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id_entreprise`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`id_secteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `id_annonce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `candidature`
--
ALTER TABLE `candidature`
  MODIFY `id_candidature` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id_secteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_ibfk_1` FOREIGN KEY (`id_secteur`) REFERENCES `secteur` (`id_secteur`),
  ADD CONSTRAINT `annonce_ibfk_2` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`);

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`id_annonce`) REFERENCES `annonce` (`id_annonce`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
