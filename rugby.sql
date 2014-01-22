-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 18 Septembre 2013 à 23:06
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rugby`
--

-- --------------------------------------------------------

--
-- Structure de la table `acl`
--

CREATE TABLE IF NOT EXISTS `acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gest_joueur` int(1) NOT NULL DEFAULT '0',
  `gest_muscu` int(1) NOT NULL DEFAULT '0',
  `gest_club` int(1) NOT NULL DEFAULT '0',
  `gest_entrainement` int(1) NOT NULL DEFAULT '0',
  `gest_entraineur` int(1) NOT NULL DEFAULT '0',
  `gest_structure` int(1) NOT NULL DEFAULT '0',
  `view_all_fiche` int(1) NOT NULL DEFAULT '0',
  `gest_suivimed` int(1) NOT NULL DEFAULT '0',
  `view_suivimed` int(1) NOT NULL DEFAULT '0',
  `gest_match` int(1) NOT NULL DEFAULT '0',
  `gest_programmation` int(11) NOT NULL DEFAULT '0',
  `gest_document` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `acl_user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `acl`
--

INSERT INTO `acl` (`id`, `user_id`, `gest_joueur`, `gest_muscu`, `gest_club`, `gest_entrainement`, `gest_entraineur`, `gest_structure`, `view_all_fiche`, `gest_suivimed`, `view_suivimed`, `gest_match`, `gest_programmation`, `gest_document`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
(2, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `acl_model`
--

CREATE TABLE IF NOT EXISTS `acl_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(15) NOT NULL,
  `gest_joueur` int(1) NOT NULL DEFAULT '0',
  `gest_muscu` int(1) NOT NULL DEFAULT '0',
  `gest_club` int(1) NOT NULL DEFAULT '0',
  `gest_entrainement` int(1) NOT NULL DEFAULT '0',
  `gest_entraineur` int(1) NOT NULL DEFAULT '0',
  `gest_structure` int(1) NOT NULL DEFAULT '0',
  `view_all_fiche` int(1) NOT NULL DEFAULT '0',
  `gest_suivimed` int(1) NOT NULL DEFAULT '0',
  `view_suivimed` int(1) NOT NULL DEFAULT '0',
  `gest_match` int(1) NOT NULL DEFAULT '0',
  `gest_programmation` int(11) NOT NULL DEFAULT '0',
  `gest_document` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `acl_model`
--

INSERT INTO `acl_model` (`id`, `account_type`, `gest_joueur`, `gest_muscu`, `gest_club`, `gest_entrainement`, `gest_entraineur`, `gest_structure`, `view_all_fiche`, `gest_suivimed`, `view_suivimed`, `gest_match`, `gest_programmation`, `gest_document`) VALUES
(1, 'admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'medic', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0),
(3, 'joueur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'entraineur', 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(5, 'res_muscu', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

CREATE TABLE IF NOT EXISTS `actualite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `contenu` text NOT NULL,
  `creat_on` int(15) NOT NULL,
  `edit_on` int(15) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `actualite`
--

INSERT INTO `actualite` (`id`, `titre`, `contenu`, `creat_on`, `edit_on`, `categorie_id`, `auteur_id`) VALUES
(2, 'Ma super new m jhfghfhfg', 'Ma super new\r\nMa super new\r\nMa super new\r\nMa super new\r\nm\r\njghjghjghj', 1351996889, 1352022499, 0, 1),
(3, 'dfgdfg', 'dfgdfgdfgdfg\r\ndfgdfgdgd', 1354752232, 1354752232, 0, 1),
(4, 'dgdfg', 'dfgd', 1361304519, 1361304519, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `blok`
--

CREATE TABLE IF NOT EXISTS `blok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(100) DEFAULT NULL,
  `fichier` varchar(100) DEFAULT NULL,
  `call_fonction` varchar(100) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `contenu` text,
  `type` varchar(100) DEFAULT NULL,
  `visible` int(1) NOT NULL DEFAULT '1',
  `ordre` int(2) NOT NULL DEFAULT '99',
  `param` int(1) NOT NULL DEFAULT '0',
  `only_index` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `blok`
--

INSERT INTO `blok` (`id`, `position`, `fichier`, `call_fonction`, `name`, `contenu`, `type`, `visible`, `ordre`, `param`, `only_index`) VALUES
(1, 'left', 'blokNavigation.php', 'blokNavigation', 'Navigation', NULL, 'system', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commun_cp_ville`
--

CREATE TABLE IF NOT EXISTS `commun_cp_ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cp` varchar(10) NOT NULL,
  `ville` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `commun_cp_ville`
--

INSERT INTO `commun_cp_ville` (`id`, `cp`, `ville`) VALUES
(1, '18000', 'BOURGES'),
(2, '18190', 'VENESMES'),
(3, '18190', 'CHATEAUNEUF SUR CHER'),
(4, '13000', 'MARSEILLE'),
(5, '03000', 'MOULINS'),
(7, '18230', 'SAINT DOULCHARD'),
(8, '36000', 'CHATEAUROUX'),
(9, '75001', 'PARIS'),
(10, '37000', 'TOURS'),
(11, '45000', 'ORLEANS');

-- --------------------------------------------------------

--
-- Structure de la table `commun_form`
--

CREATE TABLE IF NOT EXISTS `commun_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_code_form` varchar(50) NOT NULL,
  `cf_name` varchar(250) NOT NULL,
  `cf_value` text,
  `cf_type` int(2) NOT NULL DEFAULT '1',
  `cf_required` int(1) NOT NULL DEFAULT '0',
  `cf_actif` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `commun_form`
--

INSERT INTO `commun_form` (`id`, `cf_code_form`, `cf_name`, `cf_value`, `cf_type`, `cf_required`, `cf_actif`) VALUES
(1, 'JoueurForm', 'Test', NULL, 1, 1, 1),
(2, 'JoueurForm', 'selecteoption', 'option1;opion2;option3;option4;', 2, 1, 1),
(3, 'JoueurForm', 'Mon champ', NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commun_form_data`
--

CREATE TABLE IF NOT EXISTS `commun_form_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_id` int(11) NOT NULL,
  `cfd_id` int(11) NOT NULL,
  `cfd_value` text,
  PRIMARY KEY (`id`),
  KEY `cf_id` (`cf_id`,`cfd_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Contenu de la table `commun_form_data`
--

INSERT INTO `commun_form_data` (`id`, `cf_id`, `cfd_id`, `cfd_value`) VALUES
(15, 2, 11, 'option1'),
(14, 1, 11, 'gfhkgjghj'),
(37, 2, 2, 'option1'),
(36, 1, 2, 'jghjghj'),
(18, 1, 12, 'khjkhjkjhkhjkhjkhjkhjkhjk'),
(19, 2, 12, 'option3'),
(38, 1, 1, 'gjghjghj'),
(39, 2, 1, 'option1'),
(22, 1, 13, 'fghfghfghfgh'),
(23, 2, 13, 'option1'),
(24, 1, 14, 'fghfghfghfgh'),
(25, 2, 14, 'option1'),
(26, 1, 15, 'fghfghfghfgh'),
(27, 2, 15, 'option1'),
(28, 1, 16, 'fghfghfghfgh'),
(29, 2, 16, 'option1'),
(30, 1, 0, 'fghfghfghfgh'),
(31, 2, 0, 'option1'),
(32, 1, 17, 'fghfghfghfgh'),
(33, 2, 17, 'option1'),
(34, 1, 18, 'fghfghfghfgh'),
(35, 2, 18, 'option1'),
(40, 3, 1, ''),
(41, 1, 22, 'fjslkfjslkfjls'),
(42, 2, 22, 'opion2'),
(43, 3, 22, 'sdqskjdlqskjdqlk');

-- --------------------------------------------------------

--
-- Structure de la table `commun_liste`
--

CREATE TABLE IF NOT EXISTS `commun_liste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(5) NOT NULL,
  `libelle` varchar(200) NOT NULL,
  `value` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Contient les listes communes.' AUTO_INCREMENT=34 ;

--
-- Contenu de la table `commun_liste`
--

INSERT INTO `commun_liste` (`id`, `code`, `libelle`, `value`) VALUES
(1, 'TENT', 'Technique/Tactique', '1'),
(2, 'TENT', 'Physique', '2'),
(3, 'TUAC', 'Administrateur', 'admin'),
(5, 'TCYC', 'Physique', '2'),
(6, 'TCYC', 'Tactique/technique', '1'),
(7, 'TCYC', 'Physique - Tactique/technique', '3'),
(9, 'TUAC', 'Medecin', 'medic'),
(10, 'ANFO', '1er', '1'),
(11, 'ANFO', '2eme', '2'),
(12, 'ANFO', '3eme et +', '3'),
(13, 'TUAC', 'Joueur', 'joueur'),
(14, 'PORG', 'Directeur', '001'),
(15, 'PORG', 'Coordinateur', '002'),
(16, 'PORG', 'Entrainteur', '003'),
(17, 'PORG', 'Preparateur physique', '004'),
(18, 'PORG', 'Responsable musculation', '005'),
(19, 'PORG', 'Coordinateur médical', '006'),
(20, 'PORG', 'Kinesitherapeute', '007'),
(21, 'PORG', 'Medecin', '008'),
(22, 'PORG', 'Dieteticien', '009'),
(23, 'PORG', 'Psychologue', '010'),
(24, 'PORG', 'Podologue', '011'),
(25, 'PORG', 'Dentiste', '012'),
(26, 'PORG', 'Suivi scolaire', '013'),
(27, 'MEZON', 'Ceinture scapulaire', '001'),
(28, 'MEZON', 'Undefined', '9999'),
(29, 'TUAC', 'Entrainteur', 'entraineur'),
(30, 'TUAC', 'Responsable musculation', 'res_muscu'),
(31, 'PORG', 'Directeur administratif', '014'),
(32, 'PORG', 'Accompagnateur', '015'),
(33, 'TENT', '', '0');

-- --------------------------------------------------------

--
-- Structure de la table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `cle` varchar(250) NOT NULL,
  `valeur` text,
  PRIMARY KEY (`cle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `config`
--

INSERT INTO `config` (`cle`, `valeur`) VALUES
('sport', 'Rugby'),
('joueur_suivi_scolaire', '0'),
('joueur_entraineur', '0'),
('structure_name', 'Site de dev'),
('sport_champ_selection', '0'),
('sport_champ_poste', '0'),
('sport_champ_structure', '0'),
('id_install', '507af1bf8c0b3'),
('theme', 'Goliath'),
('mail_method', 'smtp'),
('smtp_server', 'smtp.free.fr'),
('smtp_port', '21'),
('smtp_login', NULL),
('smtp_password', NULL),
('email_contact', 'contact@sharkphp.com'),
('show_graph_detail_test', '0'),
('email_expediteur', 'w.shark@free.fr'),
('multi_site', '0'),
('joueur_form_show_parent', '0'),
('entrainement_type', '0'),
('entrainement_filtre_annee', '0'),
('entrainement_filtre_equipe', '0'),
('version', '2013021802');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `description` text,
  `fichier` varchar(45) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='table contenant les documents	' AUTO_INCREMENT=21 ;

--
-- Contenu de la table `documents`
--

INSERT INTO `documents` (`id`, `nom`, `description`, `fichier`, `extension`, `add_by`, `add_on`) VALUES
(3, 'exercice muscu export', 'export du logiciel de muscu ', '1356546227.xlsx', 'xlsx', 1, 1356544808),
(5, 'dgfgdfg', 'dfgdfg', '1356622613.txt', 'txt', 1, 1356622605),
(6, 'dgfgdfg', 'dfgdfg', '1356622661.txt', 'txt', 1, 1356622605),
(7, 'dgfgdfg', 'dfgdfg', '1356622725.txt', 'txt', 1, 1356622605),
(8, 'dgfgdfg', 'dfgdfg', '1356622737.txt', 'txt', 1, 1356622605),
(9, 'dgfgdfg', 'dfgdfg', '1356622776.txt', 'txt', 1, 1356622605),
(10, 'dgfgdfg', 'dfgdfg', '1356622784.txt', 'txt', 1, 1356622605),
(11, 'dgfgdfg', 'dfgdfg', '1356622787.txt', 'txt', 1, 1356622605),
(12, 'dgfgdfg', 'dfgdfg', '1356622789.txt', 'txt', 1, 1356622605),
(13, 'dgfgdfg', 'dfgdfg', '1356624378.txt', 'txt', 1, 1356622605),
(14, 'dgfgdfg', 'dfgdfg', '1356624385.txt', 'txt', 1, 1356622605),
(15, 'dgfgdfg', 'dfgdfg', '1356624443.txt', 'txt', 1, 1356622605),
(16, 'dgfgdfg', 'dfgdfg', '1356624508.txt', 'txt', 1, 1356622605),
(17, 'dgfgdfg', 'dfgdfg', '1356624524.txt', 'txt', 1, 1356622605),
(18, 'sdfsdfs', 'dfsdfs', '1356624851.txt', 'txt', 1, 1356624845),
(19, 'sdfsdfs', 'dfsdfs', '1356624959.txt', 'txt', 1, 1356624845),
(20, 'sdfsdfs', 'dfsdfs', '1356625078.txt', 'txt', 1, 1356624845);

-- --------------------------------------------------------

--
-- Structure de la table `documents_user`
--

CREATE TABLE IF NOT EXISTS `documents_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fichier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `du_user` (`user_id`),
  KEY `du_fichier` (`fichier_id`),
  KEY `du_fichier_user` (`user_id`,`fichier_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Acl des documents deposer' AUTO_INCREMENT=64 ;

--
-- Contenu de la table `documents_user`
--

INSERT INTO `documents_user` (`id`, `fichier_id`, `user_id`) VALUES
(4, NULL, 8),
(3, NULL, 1),
(5, NULL, 5),
(6, NULL, 22),
(7, NULL, 21),
(8, NULL, 20),
(9, NULL, 19),
(25, 6, 1),
(24, 5, 10),
(23, 5, 8),
(22, 5, 1),
(19, 3, 19),
(18, 3, 8),
(17, 3, 1),
(26, 6, 8),
(27, 6, 10),
(28, 7, 1),
(29, 7, 8),
(30, 7, 10),
(31, 8, 1),
(32, 8, 8),
(33, 8, 10),
(34, 9, 1),
(35, 9, 8),
(36, 9, 10),
(37, 10, 1),
(38, 10, 8),
(39, 10, 10),
(40, 11, 1),
(41, 11, 8),
(42, 11, 10),
(43, 12, 1),
(44, 12, 8),
(45, 12, 10),
(46, 13, 1),
(47, 13, 8),
(48, 13, 10),
(49, 14, 1),
(50, 14, 8),
(51, 14, 10),
(52, 15, 1),
(53, 15, 8),
(54, 15, 10),
(55, 16, 1),
(56, 16, 8),
(57, 16, 10),
(58, 17, 1),
(59, 17, 8),
(60, 17, 10),
(61, 18, 1),
(62, 19, 1),
(63, 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `entrainement`
--

CREATE TABLE IF NOT EXISTS `entrainement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_entrainement` int(11) DEFAULT NULL,
  `description` text,
  `add_by` int(11) DEFAULT NULL,
  `creat_on` int(11) DEFAULT NULL,
  `edit_at` int(11) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `type` int(2) DEFAULT NULL,
  `date_e` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `entrainement`
--

INSERT INTO `entrainement` (`id`, `date_entrainement`, `description`, `add_by`, `creat_on`, `edit_at`, `is_delete`, `type`, `date_e`) VALUES
(2, 1336572000, 'fhfghgfh', NULL, NULL, NULL, 0, NULL, NULL),
(3, 1336917600, 'travail drop', NULL, NULL, NULL, 0, NULL, NULL),
(4, 1335880800, '', NULL, NULL, NULL, 0, NULL, NULL),
(5, 1338127200, 'jghjghj', NULL, NULL, NULL, 0, NULL, NULL),
(6, 1349359200, '', 1, 1349384754, NULL, 0, 2, NULL),
(8, 1354492800, 'entrainement passe', 1, 1354455598, NULL, 0, 2, '2012-12-03'),
(9, 1357603200, 'gjghjghj', 1, 1357299034, NULL, 0, 1, '2013-01-08'),
(10, 1358172000, 'dfgdfgdfgdf', 1, 1358197097, NULL, 0, 2, '2013-01-14'),
(11, 1358380800, 'fjjkjfqsklfjqjfsd', 1, 1358456633, NULL, 0, 2, '2013-01-17'),
(12, 1359676800, 'TEST entraintement en version light', 1, 1360706048, NULL, 0, NULL, '2013-02-01'),
(13, 1359676800, 'fhfhfghfhfhfghfghfghfghfghfghfgh', 1, 1360706114, NULL, 0, NULL, '2013-02-01'),
(14, 1359763200, 'sfsdfsdfsd', 1, 1360706258, NULL, 0, 0, '2013-02-02'),
(15, 1359676800, '', 1, 1360706374, NULL, 0, 0, '2013-02-01'),
(16, 1359676800, '', 1, 1360707289, NULL, 0, 0, '2013-02-01'),
(17, 1359676800, 'lklmkmlkm', 1, 1360796433, NULL, 0, 0, '2013-02-01'),
(18, 1361059200, 'test', 1, 1361037896, NULL, 0, 0, '2013-02-17'),
(19, 1361196000, 'kjhkjhkjhkhjhjh\r\njhjhjkjhkjkjhhkkjhkjhkjhkhjhjh\r\njhjhjkjhkjkjhhkkjhkjhkjhkhjhjh\r\njhjhjkjhkjkjhhkkjhkjhkjhkhjhjh\r\njhjhjkjhkjkjhhkkjhkjhkjhkhjhjh\r\njhjhjkjhkjkjhhkkjhkjhkjhkhjhjh\r\njhjhjkjhkjkjhhk', 1, 1361038159, NULL, 0, 0, '2013-02-18'),
(20, 1360281600, 'ghjghj', 1, 1361045608, NULL, 0, 0, '2013-02-08');

-- --------------------------------------------------------

--
-- Structure de la table `entraineur`
--

CREATE TABLE IF NOT EXISTS `entraineur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `structure_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `entraineur`
--

INSERT INTO `entraineur` (`id`, `nom`, `prenom`, `telephone`, `email`, `structure_id`) VALUES
(1, 'Jourdaine', 'Marc', '0648698741', 'mj@gmail.com', 1),
(6, 'Nom', 'Prenom', '0214896325', 'email@email.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id unique',
  `nom` varchar(200) NOT NULL COMMENT 'nom de l equipe',
  `description` text NOT NULL COMMENT 'description de l equipe',
  `structure_id` int(11) NOT NULL DEFAULT '0' COMMENT 'id de liaision avec la structure',
  `creat_by` int(11) DEFAULT NULL COMMENT 'auteur id',
  `creat_on` int(11) DEFAULT NULL COMMENT 'timestamp creation',
  `edit_by` int(11) DEFAULT NULL COMMENT 'auteur id modifition',
  `edit_on` int(11) DEFAULT NULL COMMENT 'timestamp modification',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`id`, `nom`, `description`, `structure_id`, `creat_by`, `creat_on`, `edit_by`, `edit_on`) VALUES
(1, 'Senior', 'Equipe pro seniro', 1, 1, 1353669501, 1, 1353670281),
(2, 'Junior', '', 1, 1, 1353669775, 1, 1353669775),
(3, 'Cadet', 'Equipe de cadet', 1, 1, 1353669844, 1, 1353671117),
(5, 'U15', '', 3, 1, 1358454497, 1, 1358454497),
(6, 'tets structure a 0', '', 0, 1, 1359065407, 1, 1359065407);

-- --------------------------------------------------------

--
-- Structure de la table `etab_scolaire`
--

CREATE TABLE IF NOT EXISTS `etab_scolaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL,
  `adresse` text,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `url_portail_note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `etab_scolaire`
--

INSERT INTO `etab_scolaire` (`id`, `nom`, `adresse`, `code_postal`, `ville`, `telephone`, `email`, `url_portail_note`) VALUES
(2, 'hgfhgfhfgh', 'fghfgh', '18000', 'BOURGES', '', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_licence` varchar(45) DEFAULT NULL,
  `numero_homologation` varchar(100) DEFAULT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `prenom` varchar(150) DEFAULT NULL,
  `date_naissance` int(15) DEFAULT NULL,
  `lieu_naissance` varchar(150) DEFAULT NULL,
  `adresse` text,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `portable` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `date_entree` int(11) DEFAULT NULL,
  `date_sortie` int(11) DEFAULT NULL,
  `date_saisie` int(11) DEFAULT NULL,
  `parent_situation` varchar(45) DEFAULT NULL,
  `selection` varchar(100) DEFAULT NULL,
  `classe` varchar(100) DEFAULT NULL,
  `diplome_prepare` varchar(100) DEFAULT NULL,
  `poste` varchar(45) DEFAULT NULL,
  `structure_id` int(11) DEFAULT NULL,
  `etab_scolaire_id` int(11) DEFAULT NULL,
  `sexe` varchar(1) DEFAULT NULL,
  `entraineur_id` int(11) DEFAULT NULL,
  `suivi_scolaire_identifiant` varchar(250) DEFAULT NULL,
  `suivi_scolaire_password` varchar(250) DEFAULT NULL,
  `creat_on` int(11) NOT NULL,
  `creat_by` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  `edit_by` int(11) NOT NULL,
  `actif` int(1) NOT NULL DEFAULT '1',
  `site_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_club` (`structure_id`),
  KEY `fk_etab_scolaire` (`etab_scolaire_id`),
  KEY `tjactif` (`actif`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`id`, `num_licence`, `numero_homologation`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `adresse`, `code_postal`, `ville`, `telephone`, `portable`, `email`, `date_entree`, `date_sortie`, `date_saisie`, `parent_situation`, `selection`, `classe`, `diplome_prepare`, `poste`, `structure_id`, `etab_scolaire_id`, `sexe`, `entraineur_id`, `suivi_scolaire_identifiant`, `suivi_scolaire_password`, `creat_on`, `creat_by`, `edit_on`, `edit_by`, `actif`, `site_id`) VALUES
(1, '789456', NULL, 'Bonnet', 'Dimitri', 744768000, 'Saint Doulchard', '8 allée du maine', '18000', 'Bourges', '0248210079', '0615397521', 'dbonnet@dom.local', 1314835200, 1392940800, NULL, 'separee', NULL, NULL, NULL, NULL, 0, NULL, 'h', 0, NULL, NULL, 0, 0, 1353266995, 1, 1, 5),
(2, '326598741', NULL, 'Drouche', 'Romain', 512697600, 'Saint Doulchard', 'Allée du maine', '18000', 'BOURGES', '0248210079', '0615397521', 'w.shark@hotmail.fr', 1283299200, 1377993600, NULL, 'ensemble', NULL, NULL, NULL, NULL, 1, NULL, 'h', NULL, NULL, NULL, 0, 0, 1352925762, 1, 1, 0),
(3, '5656', NULL, 'Nom', 'prenom', 1337126400, 'Saint Doulchard', 'hfghfg', '14562', 'dfgfdg', '0248210079', '0615397521', 'w.shark@hotmail.fr', 1337040000, 1338336000, 1337557901, 'ensemble', '', '', '', '9 10 14 15', 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0),
(4, '654789', NULL, 'Drouche', 'Pascale', -55123200, 'Paris', 'alle du maine', '18000', 'Bourges', '0248210079', '0615397521', 'pascale.drouche@hotmail.fr', 1283299200, 1377993600, NULL, '', '', '', '', '14', 1, 1, 'f', NULL, NULL, NULL, 0, 0, 0, 0, 1, 0),
(7, '5555', NULL, 'dqds', 'hjhj', 1348012800, 'fdsf', 'dfsfsdf', '36541', 'qfsdf', '4544445', '', 'dqdqs@sqds.ds', 1348012800, 1352851200, 1348088877, '', '', '', '', '', 1, 1, 'h', 1, NULL, NULL, 0, 0, 0, 0, 1, 0),
(8, '65565656', NULL, 'Test', 'test', 1349049600, 'Saint Doulchard', 'allée de savon', '13000', 'Marseille', '', '', '', 1349740800, 1351641600, 1349716484, '', '', '', '', '', 1, 1, 'h', 0, NULL, NULL, 0, 0, 0, 0, 1, 0),
(9, '546545', NULL, 'sffsdfsd', 'sdfsdf', 1349049600, 'sdfsdfsd', 'qsdqsdqsd', '03000', 'Moulins', '', '', '', 1349049600, 1351641600, 1349716720, 'ensemble', '', '', '', '', 1, 1, 'h', 0, NULL, NULL, 0, 0, 0, 0, 1, 0),
(10, '', NULL, 'khkhkjhkhjk', 'khjkh', 1350518400, 'kjhkjhk', 'hjkhjkhjk', '18000', 'BOURGES', '', '', '', 1350691200, 1351641600, NULL, '', '', '', '', '', 2, 1, 'h', 0, NULL, NULL, 0, 0, 0, 0, 1, 0),
(11, '', NULL, 'fghgfhfg', 'hfghfgh', 1351728000, 'qsdqsd', 'qsdqsd', '18000', 'BOURGES', '0248210079', '0615397521', 'pascale.drouche@hotmail.fr', 1352851200, 1354147200, 1352137867, '', '', '', '', '', 1, 2, 'h', 1, '', NULL, 1352137786, 1, 1352137786, 1, 1, 0),
(12, '', NULL, 'sfsdfsd', 'jhkhjkjhk', 1352937600, 'hjkjhkjh', 'khjkjhkhjkhjk', '36000', 'CHATEAUROUX', '0248210079', '0615397521', '', 1352419200, 1352073600, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, NULL, NULL, 1352138417, 1, 1352142836, 1, 1, 0),
(13, '', NULL, 'Testhfghfghfgh', 'fghfghfg', 1351728000, 'BOURGES', 'fhfghfghfghfghfghfghfghfgh', '75001', 'PARIS', '', '', '', 1351728000, 0, 1352844975, '', NULL, NULL, NULL, NULL, 0, NULL, 'h', NULL, NULL, NULL, 1352844742, 1, 1352844742, 1, 1, 0),
(14, '', NULL, 'Testhfghfghfgh', 'fghfghfg', 1351728000, 'BOURGES', 'fhfghfghfghfghfghfghfghfgh', '75001', 'PARIS', '', '', '', 1351728000, 0, 1352845040, '', NULL, NULL, NULL, NULL, 0, NULL, 'h', NULL, NULL, NULL, 1352844742, 1, 1352844742, 1, 1, 0),
(15, '', NULL, 'Testhfghfghfgh', 'fghfghfg', 1351728000, 'BOURGES', 'fhfghfghfghfghfghfghfghfgh', '75001', 'PARIS', '', '', '', 1351728000, 0, 1352845066, '', NULL, NULL, NULL, NULL, 0, NULL, 'h', NULL, NULL, NULL, 1352844742, 1, 1352844742, 1, 1, 0),
(16, '', NULL, 'Testhfghfghfgh', 'fghfghfg', 1351728000, 'BOURGES', 'fhfghfghfghfghfghfghfghfgh', '75001', 'PARIS', '', '', '', 1351728000, 0, 1352845109, '', NULL, NULL, NULL, NULL, 9, NULL, 'h', NULL, NULL, NULL, 1352844742, 1, 1352844742, 1, 1, 0),
(17, '', NULL, 'Testhfghfghfgh', 'fghfghfg', 1351728000, 'BOURGES', 'fhfghfghfghfghfghfghfghfgh', '75001', 'PARIS', '', '', '', 1351728000, 0, 1352845424, '', NULL, NULL, NULL, NULL, 11, NULL, 'h', NULL, NULL, NULL, 1352844742, 1, 1352844742, 1, 1, 0),
(18, '', NULL, 'Testhfghfghfgh', 'fghfghfg', 1351728000, 'BOURGES', 'fhfghfghfghfghfghfghfghfgh', '75001', 'PARIS', '', '', '', 1351728000, 0, 1352845650, '', NULL, NULL, NULL, NULL, 0, NULL, 'h', NULL, NULL, NULL, 1352844742, 1, 1352844742, 1, 1, 0),
(19, '', '', 'Joly', 'Romain', 539222400, 'PARIS', 'route de bourges', '18190', 'VENESMES', '0248298765', '0654839312', 'rjoly@ledomaine.com', 1346457600, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, NULL, NULL, 1361225624, 1, 1361224849, 1, 1, 0),
(20, '', '', 'Joly', 'Romain', 539222400, 'PARIS', 'route de bourges', '18190', 'VENESMES', '0248298765', '0654839312', 'rjoly@ledomaine.com', 1346457600, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, NULL, NULL, 1361226740, 1, 1361224849, 1, 1, 0),
(21, '', '', 'Joly', 'Roman', 539222400, 'PARIS', 'route de bourges', '18190', 'VENESMES', '0248298765', '0654839312', 'rjoly@ledomaine.com', 1361145600, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, NULL, NULL, 1361227721, 1, 1361227645, 1, 1, 0),
(22, '', '', 'Joly', 'Roman', 539222400, 'PARIS', 'route de bourges', '18190', 'VENESMES', '0248298765', '0654839312', 'rjoly@ledomaine.com', 1361145600, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h', NULL, NULL, NULL, 1361227838, 1, 1361227645, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_documents`
--

CREATE TABLE IF NOT EXISTS `joueur_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `date_add` int(11) DEFAULT NULL COMMENT 'Date ajout du document en timestamp',
  `add_by` int(11) DEFAULT NULL COMMENT 'ID de l''utilisateur qui a ajoute le document',
  `description` text,
  `file_name` varchar(255) DEFAULT NULL COMMENT 'Nom du fichier sur le serveur upload_joueur_IdDuJoueur_documents_FileName',
  `extension` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contient les documents en liaison avec les joueurs' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `joueur_entrainement`
--

CREATE TABLE IF NOT EXISTS `joueur_entrainement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) DEFAULT NULL,
  `entrainement_id` int(11) DEFAULT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  `suivi` text,
  `presence` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

--
-- Contenu de la table `joueur_entrainement`
--

INSERT INTO `joueur_entrainement` (`id`, `joueur_id`, `entrainement_id`, `cycle_id`, `suivi`, `presence`) VALUES
(1, NULL, 1, NULL, 'dgdfg', 'blesse'),
(2, 1, 2, NULL, 'ffghfghfghfghfghf\r\nffghfghfghfghfghf\r\nffghfghfghfghfghf', 'blesse'),
(8, 1, 3, NULL, 'ok', 'present'),
(9, 2, 3, NULL, 'rdv', 'abs'),
(10, 1, 4, NULL, '', 'blesse'),
(11, 2, 4, NULL, '', ''),
(24, 1, 5, 5, 'ghjg', 'present'),
(25, 2, 5, NULL, '', ''),
(26, 3, 5, NULL, '', ''),
(27, 4, 5, NULL, '', ''),
(28, 1, 6, NULL, '', 'present'),
(29, 2, 6, NULL, '', 'present'),
(30, 4, 6, NULL, '', 'abs'),
(31, 7, 6, NULL, '', 'present'),
(32, 1, 7, NULL, '', 'present'),
(33, 2, 7, NULL, '', 'present'),
(34, 3, 7, NULL, '', 'abs'),
(35, 4, 7, NULL, '', 'abs'),
(36, 7, 7, NULL, '', 'blesse'),
(37, 1, 8, NULL, '', 'present'),
(38, 2, 8, NULL, '', 'present'),
(39, 3, 8, NULL, '', 'abs'),
(40, 4, 8, NULL, '', 'abs'),
(41, 7, 8, NULL, '', 'blesse'),
(42, 1, 9, NULL, 'ghjghj', 'present'),
(117, 15, 10, NULL, '', ''),
(44, 2, 11, NULL, '', 'present'),
(45, 1, 12, 6, '', 'present'),
(46, 7, 13, NULL, '', 'abs'),
(47, 1, 13, 6, 'fhgfgh', 'present'),
(48, 1, 14, 0, '', 'present'),
(49, 7, 16, NULL, '', 'present'),
(50, 1, 17, 6, '', 'present'),
(51, 2, 17, 7, '', 'present'),
(52, 1, 18, 6, 'qskdjqksljdqlk', 'present'),
(53, 2, 18, 0, '', 'blesse'),
(81, 11, 19, NULL, '', ''),
(80, 10, 19, NULL, '', ''),
(79, 9, 19, NULL, '', ''),
(78, 8, 19, NULL, '', 'blesse'),
(77, 7, 19, NULL, '', 'abs'),
(76, 4, 19, NULL, '', 'present'),
(75, 3, 19, NULL, '', 'present'),
(74, 2, 19, 0, '', 'blesse'),
(73, 1, 19, 6, '', 'present'),
(82, 12, 19, NULL, '', ''),
(83, 13, 19, NULL, '', ''),
(84, 14, 19, NULL, '', ''),
(85, 15, 19, NULL, '', ''),
(86, 16, 19, NULL, '', ''),
(87, 17, 19, NULL, '', ''),
(88, 18, 19, NULL, '', ''),
(116, 14, 10, NULL, '', ''),
(115, 13, 10, NULL, '', ''),
(114, 12, 10, NULL, '', ''),
(113, 11, 10, NULL, '', ''),
(112, 10, 10, NULL, '', ''),
(111, 9, 10, NULL, '', ''),
(110, 8, 10, NULL, '', ''),
(109, 7, 10, NULL, '', ''),
(108, 4, 10, NULL, '', ''),
(107, 3, 10, NULL, '', ''),
(106, 2, 10, NULL, '', 'present'),
(105, 1, 10, 6, '', 'present'),
(118, 16, 10, NULL, '', ''),
(119, 17, 10, NULL, '', ''),
(120, 18, 10, NULL, '', ''),
(121, 2, 20, 9, 'jhgjhgj', 'present');

-- --------------------------------------------------------

--
-- Structure de la table `joueur_entrainement_cycle`
--

CREATE TABLE IF NOT EXISTS `joueur_entrainement_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `description` text,
  `objectif` text,
  `resultat` text,
  `date_debut` int(11) NOT NULL,
  `date_fin` int(11) NOT NULL,
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `joueur_id` (`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `joueur_entrainement_cycle`
--

INSERT INTO `joueur_entrainement_cycle` (`id`, `joueur_id`, `nom`, `description`, `objectif`, `resultat`, `date_debut`, `date_fin`, `type`) VALUES
(2, 3, 'test', 'TEST', 'TEST', NULL, 1338508800, 1341014400, NULL),
(5, 1, 'Reprise', 'Reprise', 'Reprise', '', 1338076800, 1341014400, 1),
(6, 1, 'Cycle de test', 'Super', 'kdqmlkd', NULL, 1356998400, 1362009600, 2),
(7, 2, 'jlljljl', 'jljljkl', 'jkljklj', 'hfhfghf', 1359676800, 1362009600, 2),
(8, 2, 'hjkkhkjhk', 'hkjhhkjhk', 'hhkjhkhkh', NULL, 1362009600, 1364688000, 3),
(9, 2, 'cycle sans type', 'test d un cycle sans type', 'objectif l enregistrer', NULL, 1359676800, 1362009600, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_equipe`
--

CREATE TABLE IF NOT EXISTS `joueur_equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `equipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_je_equipe` (`equipe_id`),
  KEY `i_je_joueur` (`joueur_id`),
  KEY `i_je_joeq` (`joueur_id`,`equipe_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `joueur_equipe`
--

INSERT INTO `joueur_equipe` (`id`, `joueur_id`, `equipe_id`) VALUES
(7, 1, 1),
(8, 1, 2),
(3, 7, 3),
(9, 4, 1),
(13, 2, 2),
(11, 1, 3),
(12, 1, 6),
(14, 22, 6);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_img`
--

CREATE TABLE IF NOT EXISTS `joueur_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` int(3) DEFAULT NULL,
  `date_saisie` int(15) DEFAULT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_jimg_joueur_id` (`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `joueur_img`
--

INSERT INTO `joueur_img` (`id`, `img`, `date_saisie`, `joueur_id`) VALUES
(3, 35, 1336514376, 2),
(4, 25, 1336759750, 2),
(5, 25, 1359111181, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_medical`
--

CREATE TABLE IF NOT EXISTS `joueur_medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `suivi` text,
  `suivi_prive` text,
  `dispo_rugby` int(11) DEFAULT NULL,
  `dispo_muscu` int(11) DEFAULT NULL,
  `creat_by` int(11) DEFAULT NULL,
  `date_saisie` int(11) DEFAULT NULL,
  `date_medical` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Table contenant les informations medical des joueurs' AUTO_INCREMENT=13 ;

--
-- Contenu de la table `joueur_medical`
--

INSERT INTO `joueur_medical` (`id`, `joueur_id`, `type`, `suivi`, `suivi_prive`, `dispo_rugby`, `dispo_muscu`, `creat_by`, `date_saisie`, `date_medical`) VALUES
(10, 1, '', '', '', 0, 0, NULL, 1353243193, 0),
(2, 1, 'maladie', 'Bronchite', '', 0, 0, NULL, 1336406041, NULL),
(3, 1, 'blessure', 'Fracture du poignet', 'Fracture du poignet du a une chute.', 1338595199, 1341187199, NULL, 1336406114, NULL),
(4, 1, 'blessure', 'genoux', '', 1330646399, 1330646399, NULL, 1336406766, NULL),
(5, 2, 'maladie', 'pb oreille', '', 1362009600, 1362009600, NULL, 1336759772, 1359676800),
(6, 1, 'blessure', 'Blessure épaule droite', '', 1340582399, 1340582399, NULL, 1337881153, 1337903999),
(7, 1, 'maladie', 'hfghfgh', '', 0, 0, NULL, 1337881667, 1337990399),
(8, 7, 'blessure', 'fgjhfgh', 'fghfghfghfg\r\nfhghfghf', 1356998399, 1354319999, NULL, 1350031719, 1350086399),
(9, 1, 'maladie', 'hfhfgh', 'fgfghfghf', 0, 0, NULL, 1350050444, 1350172799),
(11, 1, 'psychologique', 'probleme psy\r\nprobleme psy', 'separation des parents\r\nseparation des parents', 1352505600, 0, NULL, 1353243560, 1351814400),
(12, 2, 'psychologique', 'dfgdgdfgdfgdfg', '', 0, 0, NULL, 1360799602, 1361404799);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_medical_commentaire`
--

CREATE TABLE IF NOT EXISTS `joueur_medical_commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suivi_id` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  `date_saisie` int(15) DEFAULT NULL,
  `add_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `joueur_medical_commentaire`
--

INSERT INTO `joueur_medical_commentaire` (`id`, `suivi_id`, `commentaire`, `date_saisie`, `add_by`) VALUES
(1, 4, 'dfgfdg', 1336417773, 1),
(3, 3, 'ljljkljl', 1336425137, 1),
(4, 4, 'mklmk', 1336425863, 1),
(5, 4, 'khkhjkhjkjhk\r\nhkjhk\r\nhjkhjk', 1336427618, 1),
(6, 2, 'fdgdfgdfg', 1336427633, 1),
(7, 5, 'gfdgdfg', 1360799173, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_poids`
--

CREATE TABLE IF NOT EXISTS `joueur_poids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poids` int(11) DEFAULT NULL COMMENT 'Taille en CM',
  `date_saisie` int(11) DEFAULT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_jpoids_joueur_id` (`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `joueur_poids`
--

INSERT INTO `joueur_poids` (`id`, `poids`, `date_saisie`, `joueur_id`) VALUES
(8, 77, 1336514112, 2),
(9, 80, 1336759750, 2),
(10, 85, 1337557901, 3),
(11, 54, 1337643394, 4),
(14, 77, 1352137867, 11),
(15, 75, 1359111181, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueur_scolaire_matiere_note`
--

CREATE TABLE IF NOT EXISTS `joueur_scolaire_matiere_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matiere_id` int(11) NOT NULL,
  `joueur_id` int(11) NOT NULL,
  `trimestre_id` int(11) NOT NULL,
  `moyenne` varchar(15) NOT NULL,
  `observation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joueur_taille`
--

CREATE TABLE IF NOT EXISTS `joueur_taille` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taille` int(11) DEFAULT NULL,
  `date_saisie` int(11) DEFAULT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_jtaille_joueur_id` (`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `joueur_taille`
--

INSERT INTO `joueur_taille` (`id`, `taille`, `date_saisie`, `joueur_id`) VALUES
(1, 170, 1336219664, 1),
(2, 195, 1336324988, NULL),
(3, 200, 1336325212, 1),
(4, 179, 1336514112, 2),
(5, 181, 1337557901, 3),
(6, 168, 1337643394, 4),
(7, 250, 1337882211, 1),
(11, 168, 1352137867, 11);

-- --------------------------------------------------------

--
-- Structure de la table `log_connexion`
--

CREATE TABLE IF NOT EXISTS `log_connexion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_connexion` int(11) NOT NULL,
  `adr_ip` varchar(50) NOT NULL,
  `result` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=198 ;

--
-- Contenu de la table `log_connexion`
--

INSERT INTO `log_connexion` (`id`, `user_id`, `date_connexion`, `adr_ip`, `result`) VALUES
(1, 0, 1352144924, 'fe80::a94d:7cfa:dd8e:ecc', 'Error user/password'),
(2, 1, 1352144954, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(3, 1, 1352184710, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(4, 1, 1352228455, '127.0.0.1', 'Ok'),
(5, 1, 1352228467, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(6, 1, 1352465308, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(7, 1, 1352483550, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(8, 1, 1352842806, '127.0.0.1', 'Ok'),
(9, 1, 1352842811, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(10, 1, 1352846686, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(11, 1, 1352883730, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(12, 0, 1352925637, '127.0.0.1', 'Error user/password'),
(13, 1, 1352925643, '127.0.0.1', 'Ok'),
(14, 1, 1352925648, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(15, 1, 1352928460, '127.0.0.1', 'Ok'),
(16, 1, 1352928464, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(17, 0, 1352974202, 'fe80::a94d:7cfa:dd8e:ecc', 'Error user/password'),
(18, 1, 1352974207, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(19, 1, 1352979726, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(20, 1, 1352998104, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(21, 1, 1353102535, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(22, 1, 1353102713, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(23, 1, 1353141505, '127.0.0.1', 'Ok'),
(24, 8, 1353141511, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(25, 1, 1353147672, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(26, 1, 1353159353, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(27, 0, 1353159499, 'fe80::a94d:7cfa:dd8e:ecc', 'Error user/password'),
(28, 1, 1353159504, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(29, 1, 1353159558, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(30, 1, 1353159635, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(31, 1, 1353206971, 'fe80::3447:290f:199f:15de', 'Ok'),
(32, 1, 1353240688, '127.0.0.1', 'Ok'),
(33, 1, 1353240693, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(34, 0, 1353241247, 'fe80::a94d:7cfa:dd8e:ecc', 'Error user/password'),
(35, 1, 1353241253, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(36, 10, 1353271525, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(37, 1, 1353271829, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(38, 8, 1353535939, '127.0.0.1', 'Ok'),
(39, 1, 1353535949, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(40, 1, 1353625070, '192.168.0.4', 'Ok'),
(41, 1, 1353667684, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(42, 1, 1353669475, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(43, 1, 1353773055, '127.0.0.1', 'Ok'),
(44, 1, 1353773059, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(45, 1, 1353784882, '127.0.0.1', 'Ok'),
(46, 1, 1353784888, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(47, 1, 1353838390, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(48, 1, 1353842044, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(49, 1, 1353844726, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(50, 1, 1353850539, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(51, 1, 1353850791, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(52, 1, 1353877366, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(53, 8, 1353949832, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(54, 1, 1353997270, '127.0.0.1', 'Ok'),
(55, 1, 1353997275, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(56, 1, 1354051152, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(57, 0, 1354129715, 'fe80::a94d:7cfa:dd8e:ecc', 'Error user/password'),
(58, 1, 1354129718, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(59, 1, 1354143094, 'fe80::bcaa:ae94:300f:82c5', 'Ok'),
(60, 1, 1354216278, '192.168.0.34', 'Ok'),
(61, 10, 1354216451, '192.168.0.34', 'Ok'),
(62, 1, 1354218210, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(63, 1, 1354267576, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(64, 1, 1354278563, 'fe80::a94d:7cfa:dd8e:ecc', 'Ok'),
(65, 1, 1354282908, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(66, 1, 1354285227, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(67, 1, 1354285936, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(68, 1, 1354286141, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(69, 1, 1354287473, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(70, 10, 1354306174, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(71, 1, 1354368113, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(72, 1, 1354439878, '127.0.0.1', 'Ok'),
(73, 1, 1354439883, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(74, 10, 1354451599, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(75, 1, 1354455593, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(76, 1, 1354466240, '127.0.0.1', 'Ok'),
(77, 1, 1354466243, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(78, 1, 1354517578, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(79, 1, 1354559206, '127.0.0.1', 'Ok'),
(80, 1, 1354560021, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(81, 1, 1354644662, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(82, 1, 1354651397, '127.0.0.1', 'Ok'),
(83, 1, 1354651399, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(84, 1, 1354752222, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(85, 1, 1354776461, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(86, 1, 1354877402, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(87, 1, 1354883979, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(88, 1, 1354885875, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(89, 1, 1354990059, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(90, 0, 1355088002, 'fe80::6d5b:554b:731:d64c', 'Error user/password'),
(91, 1, 1355088006, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(92, 1, 1355164634, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(93, 1, 1355249292, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(94, 1, 1355331890, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(95, 1, 1355424018, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(96, 1, 1355525730, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(97, 1, 1355583244, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(98, 1, 1356024641, '127.0.0.1', 'Ok'),
(99, 1, 1356024646, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(100, 1, 1356199480, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(101, 1, 1356298747, '192.168.0.34', 'Ok'),
(102, 1, 1356517837, 'fe80::6d5b:554b:731:d64c', 'Ok'),
(103, 1, 1356533035, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(104, 1, 1356550076, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(105, 1, 1356618139, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(106, 1, 1356624830, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(107, 1, 1357146506, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(108, 1, 1357297674, '127.0.0.1', 'Ok'),
(109, 1, 1357297680, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(110, 1, 1357484706, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(111, 1, 1357493615, '127.0.0.1', 'Ok'),
(112, 1, 1357915870, '127.0.0.1', 'Ok'),
(113, 1, 1357915873, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(114, 10, 1357917474, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(115, 1, 1357918416, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(116, 1, 1358196444, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(117, 10, 1358197069, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(118, 1, 1358359892, '127.0.0.1', 'Ok'),
(119, 1, 1358359894, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(120, 1, 1358454036, 'fe80::f1a9:a9fd:e68c:9374', 'Ok'),
(121, 10, 1358456663, 'fe80::f1a9:a9fd:e68c:9374', 'Ok'),
(122, 1, 1358456723, 'fe80::f1a9:a9fd:e68c:9374', 'Ok'),
(123, 10, 1358456786, 'fe80::f1a9:a9fd:e68c:9374', 'Ok'),
(124, 1, 1358793079, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(125, 1, 1358793141, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(126, 1, 1358793189, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(127, 1, 1358793203, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(128, 10, 1358803193, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(129, 0, 1358889105, 'fe80::b97d:565f:8a09:425b', 'Error user/password'),
(130, 1, 1358889110, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(131, 1, 1359051704, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(132, 1, 1359057941, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(133, 1, 1359070552, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(134, 1, 1359104366, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(135, 1, 1359107208, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(136, 1, 1359645032, '127.0.0.1', 'Ok'),
(137, 1, 1359645040, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(138, 1, 1359900673, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(139, 1, 1359917633, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(140, 1, 1359930307, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(141, 1, 1360610723, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(142, 1, 1360684798, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(143, 0, 1360692378, 'fe80::b97d:565f:8a09:425b', 'Error user/password'),
(144, 1, 1360692382, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(145, 1, 1360706007, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(146, 1, 1360737093, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(147, 1, 1360737194, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(148, 1, 1360776992, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(149, 1, 1360784099, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(150, 1, 1360852713, '192.168.0.47', 'Ok'),
(151, 1, 1360931019, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(152, 1, 1361025699, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(153, 1, 1361036128, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(154, 1, 1361037889, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(155, 1, 1361040562, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(156, 1, 1361057387, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(157, 1, 1361222367, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(158, 1, 1361224519, '192.168.0.33', 'Ok'),
(159, 1, 1361227612, '192.168.0.33', 'Ok'),
(160, 1, 1361257126, 'fe80::b97d:565f:8a09:425b', 'Ok'),
(161, 1, 1361303279, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(162, 0, 1361303548, '192.168.0.46', 'Error user/password'),
(163, 1, 1361303554, '192.168.0.46', 'Ok'),
(164, 0, 1361308685, 'fe80::850a:b746:c5e3:cf2d', 'Error user/password'),
(165, 1, 1361308690, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(166, 1, 1361568643, '192.168.0.46', 'Ok'),
(167, 0, 1362638158, 'fe80::850a:b746:c5e3:cf2d', 'Error user/password'),
(168, 1, 1362638162, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(169, 1, 1362739627, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(170, 1, 1364854077, '127.0.0.1', 'Ok'),
(171, 0, 1364854083, 'fe80::850a:b746:c5e3:cf2d', 'Error user/password'),
(172, 0, 1364854095, 'fe80::850a:b746:c5e3:cf2d', 'Error user/password'),
(173, 1, 1364854099, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(174, 1, 1365338859, '127.0.0.1', 'Ok'),
(175, 1, 1365338862, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(176, 1, 1365352772, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(177, 0, 1365698839, '192.168.0.17', 'Error user/password'),
(178, 1, 1365698868, '192.168.0.17', 'Ok'),
(179, 1, 1365700703, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(180, 1, 1365764666, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(181, 1, 1366220169, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(182, 1, 1366365645, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(183, 1, 1366369457, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(184, 1, 1366369946, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(185, 1, 1366585157, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(186, 1, 1366713827, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(187, 1, 1367407802, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(188, 1, 1367415674, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(189, 1, 1367513378, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(190, 1, 1367597856, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(191, 1, 1367767078, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(192, 1, 1367874835, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(193, 1, 1367953235, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(194, 1, 1368091822, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(195, 1, 1368881573, 'fe80::850a:b746:c5e3:cf2d', 'Ok'),
(196, 1, 1369992661, '127.0.0.1', 'Ok'),
(197, 1, 1370323770, '127.0.0.1', 'Ok');

-- --------------------------------------------------------

--
-- Structure de la table `match_basket`
--

CREATE TABLE IF NOT EXISTS `match_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipe_id` int(11) NOT NULL,
  `type` varchar(5) DEFAULT NULL,
  `adversaire` varchar(150) NOT NULL,
  `score_equipe` int(4) DEFAULT NULL,
  `score_adversaire` int(4) DEFAULT NULL,
  `date_match` date NOT NULL,
  `date_timestamp` int(12) NOT NULL,
  `creat_by` int(11) NOT NULL,
  `creat_on` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  `edit_by` int(11) NOT NULL,
  `observation` text,
  PRIMARY KEY (`id`),
  KEY `equipe_id` (`equipe_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `match_basket`
--

INSERT INTO `match_basket` (`id`, `equipe_id`, `type`, `adversaire`, `score_equipe`, `score_adversaire`, `date_match`, `date_timestamp`, `creat_by`, `creat_on`, `edit_on`, `edit_by`, `observation`) VALUES
(1, 1, NULL, 'Clermont', 100, 20, '2012-12-18', 1355788800, 1, 1355063380, 1355063380, 1, 'hgjghjg');

-- --------------------------------------------------------

--
-- Structure de la table `match_basket_joueur`
--

CREATE TABLE IF NOT EXISTS `match_basket_joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `temps_jeu` int(3) NOT NULL,
  `poste` varchar(50) NOT NULL,
  `observation` text,
  `points` int(3) DEFAULT NULL COMMENT 'nombre de point marque',
  `tir` int(3) DEFAULT NULL COMMENT 'nombre de tir tente',
  `tir_reussis` int(3) DEFAULT NULL COMMENT 'nombre de tir reussi',
  `lfranc` int(3) DEFAULT NULL COMMENT 'nombre de lance franc',
  `lfranc_reussis` int(3) DEFAULT NULL COMMENT 'lance franc reussi',
  `rebond_offensif` int(4) DEFAULT NULL COMMENT 'nb de rond offensif',
  `rebond_deffensif` int(4) DEFAULT NULL COMMENT 'nb de rond deffensif',
  `rebond_total` int(5) DEFAULT NULL COMMENT 'Nb total de rebond, calcule dans le formulaire',
  `passe_decissive` int(3) DEFAULT NULL,
  `interception` int(3) DEFAULT NULL,
  `contre` int(3) DEFAULT NULL,
  `balle_perdu` int(3) DEFAULT NULL,
  `faute_provoquee` int(3) DEFAULT NULL,
  `faute` int(3) DEFAULT NULL,
  `evaluation` varchar(50) DEFAULT NULL,
  `tir_2` int(3) DEFAULT NULL,
  `tir_3` int(3) DEFAULT NULL,
  `tir_2_reussis` int(3) DEFAULT NULL,
  `tir_3_reussis` int(3) DEFAULT NULL,
  `tir_2_percent` int(3) DEFAULT NULL,
  `tir_3_percent` int(3) DEFAULT NULL,
  `tir_percent` int(3) DEFAULT NULL,
  `lfranc_percent` int(3) DEFAULT NULL,
  `points_percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mrj_joueur_id` (`joueur_id`),
  KEY `mrj_match_id` (`match_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `match_basket_joueur`
--

INSERT INTO `match_basket_joueur` (`id`, `joueur_id`, `match_id`, `temps_jeu`, `poste`, `observation`, `points`, `tir`, `tir_reussis`, `lfranc`, `lfranc_reussis`, `rebond_offensif`, `rebond_deffensif`, `rebond_total`, `passe_decissive`, `interception`, `contre`, `balle_perdu`, `faute_provoquee`, `faute`, `evaluation`, `tir_2`, `tir_3`, `tir_2_reussis`, `tir_3_reussis`, `tir_2_percent`, `tir_3_percent`, `tir_percent`, `lfranc_percent`, `points_percent`) VALUES
(1, 1, 11, 50, '10', '', 100, 20, 15, 5, 5, 2, 3, 0, 5, 2, 5, 8, 3, 2, '99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 12, 50, '10', '', 100, 20, 15, 5, 5, 2, 3, 0, 5, 2, 5, 8, 3, 2, '99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 13, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 0, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, NULL, NULL, 100, NULL, NULL),
(4, 1, 14, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 0, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, NULL, NULL, 57, NULL, NULL),
(5, 1, 15, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 0, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, NULL, NULL, 57, NULL, NULL),
(6, 1, 16, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 0, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, 60, 50, 57, NULL, NULL),
(7, 1, 17, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 0, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, 60, 50, 57, 50, NULL),
(8, 1, 19, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 0, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, 60, 50, 57, 50, 72),
(9, 1, 20, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 15, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, 60, 50, 57, 50, 72),
(10, 1, 21, 60, '2', '', 36, 7, 4, 2, 1, 7, 8, 15, 2, 2, 3, 5, 1, 3, '47', 5, 2, 3, 1, 60, 50, 57, 50, 72),
(11, 1, 1, 20, '2', '', 36, 7, 4, 2, 1, 20, 10, 30, 2, 2, 5, 4, 5, 4, '65', 5, 2, 3, 1, 60, 50, 57, 50, 36);

-- --------------------------------------------------------

--
-- Structure de la table `match_rugby`
--

CREATE TABLE IF NOT EXISTS `match_rugby` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipe_id` int(11) NOT NULL,
  `type` varchar(5) DEFAULT NULL,
  `adversaire` varchar(150) NOT NULL,
  `score_equipe` int(4) DEFAULT NULL,
  `score_adversaire` int(4) DEFAULT NULL,
  `date_match` date NOT NULL,
  `date_timestamp` int(12) NOT NULL,
  `creat_by` int(11) NOT NULL,
  `creat_on` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  `edit_by` int(11) NOT NULL,
  `observation` text,
  `eq_touche` int(11) DEFAULT NULL,
  `eq_melee` int(11) DEFAULT NULL,
  `eq_penalite` int(11) DEFAULT NULL,
  `eq_ruck` int(11) DEFAULT NULL,
  `eq_cp_envoie` int(11) DEFAULT NULL,
  `eq_bc` int(11) DEFAULT NULL,
  `eq_franchissement` int(11) DEFAULT NULL,
  `ad_touche` int(11) DEFAULT NULL,
  `ad_melee` int(11) DEFAULT NULL,
  `ad_penalite` int(11) DEFAULT NULL,
  `ad_ruck` int(11) DEFAULT NULL,
  `ad_cp_envoie` int(11) DEFAULT NULL,
  `ad_bc` int(11) DEFAULT NULL,
  `ad_franchissement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipe_id` (`equipe_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `match_rugby`
--

INSERT INTO `match_rugby` (`id`, `equipe_id`, `type`, `adversaire`, `score_equipe`, `score_adversaire`, `date_match`, `date_timestamp`, `creat_by`, `creat_on`, `edit_on`, `edit_by`, `observation`, `eq_touche`, `eq_melee`, `eq_penalite`, `eq_ruck`, `eq_cp_envoie`, `eq_bc`, `eq_franchissement`, `ad_touche`, `ad_melee`, `ad_penalite`, `ad_ruck`, `ad_cp_envoie`, `ad_bc`, `ad_franchissement`) VALUES
(1, 1, NULL, 'Sancerre', 21, 12, '2012-11-25', 1353801600, 1, 1353844733, 1353844733, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, NULL, 'ISSOUDUM', 50, 60, '2012-11-30', 1354233600, 1, 1354050073, 1354050073, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, NULL, 'yenapas', 50, 20, '2012-11-14', 1352851200, 1, 1354051635, 1354051635, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, NULL, 'Clermont', 20, 60, '2012-12-22', 1356134400, 1, 1354812539, 1354812539, 1, 'Bon match quand meme', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, NULL, 'sancerre', 100, 20, '2012-12-13', 1355356800, 1, 1355060965, 1355060965, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, NULL, 'sancerre', 100, 20, '2012-12-13', 1355356800, 1, 1355060965, 1355060965, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, NULL, 'sancerre', 100, 20, '2012-12-13', 1355356800, 1, 1355060965, 1355060965, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, NULL, 'sancerre', 100, 20, '2012-12-13', 1355356800, 1, 1355060965, 1355060965, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, NULL, 'sancerre', 100, 20, '2012-12-13', 1355356800, 1, 1355060965, 1355060965, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, NULL, 'sancerre', 100, 20, '2012-12-13', 1355356800, 1, 1355060965, 1355060965, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 1, NULL, 'lala', 50, 30, '2012-12-03', 1354492800, 1, 1355062495, 1355062495, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, NULL, 'Voiron', 3, 10, '2013-04-28', 1367107200, 1, 1367407833, 1367407833, 1, '', 5, 3, 0, 30, 10, 30, 3, 6, 4, 2, 60, 0, 30, 5),
(23, 1, NULL, 'Voiron', 3, 10, '2013-04-28', 1367107200, 1, 1367407833, 1367407833, 1, '', 5, 3, 0, 30, 10, 30, 3, 6, 4, 2, 60, 0, 30, 5);

-- --------------------------------------------------------

--
-- Structure de la table `match_rugby_joueur`
--

CREATE TABLE IF NOT EXISTS `match_rugby_joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `temps_jeu` int(3) NOT NULL,
  `poste` varchar(50) NOT NULL,
  `essaie` int(3) NOT NULL,
  `penalite` int(3) NOT NULL,
  `transformation` int(3) DEFAULT '0',
  `c_blanc` int(1) NOT NULL DEFAULT '0' COMMENT 'carton blanc',
  `c_jaune` int(1) NOT NULL DEFAULT '0' COMMENT 'carton jaune',
  `c_rouge` int(1) NOT NULL DEFAULT '0' COMMENT 'carton rouge',
  `observation` text,
  `passes` int(11) DEFAULT NULL,
  `plaquage` int(11) DEFAULT NULL,
  `enavant` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mrj_joueur_id` (`joueur_id`),
  KEY `mrj_match_id` (`match_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `match_rugby_joueur`
--

INSERT INTO `match_rugby_joueur` (`id`, `joueur_id`, `match_id`, `temps_jeu`, `poste`, `essaie`, `penalite`, `transformation`, `c_blanc`, `c_jaune`, `c_rouge`, `observation`, `passes`, `plaquage`, `enavant`) VALUES
(1, 1, 1, 80, '9', 3, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(2, 4, 1, 80, '3', 0, 0, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(7, 1, 4, 50, '10', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(8, 1, 5, 75, '5', 0, 0, 0, 0, 0, 0, 'mon super commentaire sur un match tout ça dans le but de voir comment cela va rentre dans la fiche :/\r\nmon super commentaire sur un match tout ça dans le but de voir comment cela va rentre dans la fiche :/', NULL, NULL, NULL),
(9, 1, 6, 50, '10', 2, 1, 2, 0, 0, 0, 'OK ', NULL, NULL, NULL),
(10, 4, 6, 80, '9', 0, 0, 0, 0, 0, 0, 'Revoir passe a gauche', NULL, NULL, NULL),
(11, 1, 23, 80, '9', 0, 0, 0, 0, 0, 0, '', 30, 20, 0),
(12, 4, 23, 80, '10', 0, 1, 0, 1, 0, 0, '', 20, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matiere` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`id`, `matiere`) VALUES
(1, 'Français'),
(2, 'Math'),
(3, 'Anglais'),
(4, 'Espagnol'),
(5, 'Histoire-géographie'),
(6, 'Physique-chimie');

-- --------------------------------------------------------

--
-- Structure de la table `musculation_cycle`
--

CREATE TABLE IF NOT EXISTS `musculation_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL,
  `description` text,
  `date_debut` int(11) DEFAULT NULL,
  `date_fin` int(11) DEFAULT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `musculation_cycle`
--

INSERT INTO `musculation_cycle` (`id`, `nom`, `description`, `date_debut`, `date_fin`, `joueur_id`) VALUES
(20, 'renforcement haut', 'ktjkfhdsjkghdksjf', 1338681600, 1340496000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `musculation_cycle_exercice`
--

CREATE TABLE IF NOT EXISTS `musculation_cycle_exercice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercice_id` int(11) DEFAULT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  `poid` int(11) DEFAULT NULL,
  `repetition` int(11) DEFAULT NULL,
  `serie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_mce_cycle_id` (`cycle_id`),
  KEY `i_mce_exercice_id` (`exercice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Contenu de la table `musculation_cycle_exercice`
--

INSERT INTO `musculation_cycle_exercice` (`id`, `exercice_id`, `cycle_id`, `poid`, `repetition`, `serie`) VALUES
(39, 1, 20, 50, 10, 10),
(40, 2, 20, 60, 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `musculation_cycle_template`
--

CREATE TABLE IF NOT EXISTS `musculation_cycle_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `musculation_cycle_template`
--

INSERT INTO `musculation_cycle_template` (`id`, `nom`, `description`) VALUES
(3, 'renforcement haut', 'ktjkfhdsjkghdksjf');

-- --------------------------------------------------------

--
-- Structure de la table `musculation_cycle_template_exercice`
--

CREATE TABLE IF NOT EXISTS `musculation_cycle_template_exercice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  `repetition` int(11) DEFAULT NULL,
  `serie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cycle_id` (`cycle_id`),
  KEY `exercice_id` (`exercice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `musculation_cycle_template_exercice`
--

INSERT INTO `musculation_cycle_template_exercice` (`id`, `cycle_id`, `exercice_id`, `repetition`, `serie`) VALUES
(1, 18, 1, 20, 5),
(2, 18, 2, 20, 5),
(7, 3, 2, 10, 10),
(6, 3, 1, 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `musculation_exercice`
--

CREATE TABLE IF NOT EXISTS `musculation_exercice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaut` int(1) NOT NULL DEFAULT '0' COMMENT 'Exercice par defaut saisie par GOLIATH',
  `nom` varchar(255) DEFAULT NULL,
  `description` text,
  `progression` int(1) NOT NULL DEFAULT '2',
  `date_add` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Table contenant les exercices de musculation' AUTO_INCREMENT=125 ;

--
-- Contenu de la table `musculation_exercice`
--

INSERT INTO `musculation_exercice` (`id`, `defaut`, `nom`, `description`, `progression`, `date_add`) VALUES
(1, 0, 'Soulevé avec haltères', '', 2, 1354651955),
(2, 0, 'Soulevé avec barre, prise moyenne', '', 2, 1354651955),
(3, 0, 'Soulevé avec barre, prise large', '', 2, 1354651955),
(4, 0, 'Soulevé avec poulie basse, assis au sol', '', 2, 1354651955),
(5, 0, 'Soulevé avec haltères, jambes semi-fléchies', '', 2, 1354651955),
(6, 0, ' Accroupissement isométrique', '', 2, 1354651955),
(7, 0, 'Accroupissement, dos sur ballon', '', 2, 1354651955),
(8, 0, ' Accroupissement avec haltères', '', 2, 1354651955),
(9, 0, 'Accroupissement avec barre devant la tête', '', 2, 1354651955),
(10, 0, ' Accroupissement avec barre au-dessus de la tête', '', 2, 1354651955),
(11, 0, 'Accroupissement en fente, avec un haltère', '', 2, 1354651955),
(12, 0, ' Accroupissement en fente, avec haltères', '', 2, 1354651955),
(13, 0, 'Accroupissement en fente, avec barre derrière la tête', '', 2, 1354651955),
(14, 0, ' Avancée sans charge', '', 2, 1354651955),
(15, 0, 'Montée sur marche, avec haltères', '', 2, 1354651955),
(16, 0, ' Montée sur marche, avec barre derrière la tête', '', 2, 1354651955),
(17, 0, 'Montée latérale sur marche, avec haltères', '', 2, 1354651955),
(18, 0, ' Montée latérale sur marche, avec barre derrière la tête', '', 2, 1354651955),
(19, 0, 'Poussée des jambes, assis', '', 2, 1354651955),
(20, 0, ' Poussée des jambes, sur appareil à 45 °', '', 2, 1354651955),
(21, 0, 'Inclinaison du tronc avec un haltère, assis sur banc', '', 2, 1354651955),
(22, 0, ' Inclinaison du tronc avec un haltère, debout', '', 2, 1354651955),
(23, 0, 'Inclinaison du tronc avec barre, assis sur banc', '', 2, 1354651955),
(24, 0, ' Extension du tronc sur appareil', '', 2, 1354651955),
(25, 0, 'Élévation des jambes sur banc', '', 2, 1354651955),
(26, 0, ' Extension du tronc sur appareil incliné', '', 2, 1354651955),
(27, 0, 'Élévation des jambes sur ballon', '', 2, 1354651955),
(28, 0, ' Extension du tronc, couché', '', 2, 1354651955),
(29, 0, 'Extension des hanches, couché', '', 2, 1354651955),
(30, 0, ' Abduction des hanches, sur appareil', '', 2, 1354651955),
(31, 0, ' Adduction des hanches, sur appareil', '', 2, 1354651955),
(32, 0, ' Extension du pied, avec un haltère', '', 2, 1354651955),
(33, 0, 'Extension des pieds, avec haltères', '', 2, 1354651955),
(34, 0, ' Extension des pieds, avec barre derrière la tête', '', 2, 1354651955),
(35, 0, 'Flexion des pieds', '', 2, 1354651955),
(36, 0, ' Flexion des pieds, talons surélevés', '', 2, 1354651955),
(37, 0, 'Développé avec barre, prise moyenne', '', 2, 1354651955),
(38, 0, ' Développé avec barre, prise large', '', 2, 1354651955),
(39, 0, 'Développé avec barre, prise étroite', '', 2, 1354651955),
(40, 0, ' Développé avec barre, prise moyenne, sur banc incliné (-45°)', '', 2, 1354651955),
(41, 0, 'Développé avec barre, prise moyenne, sur banc décliné', '', 2, 1354651955),
(42, 0, ' Développé avec barre, prise large, sur banc décliné', '', 2, 1354651955),
(43, 0, 'Développé avec haltères, mains en pronation', '', 2, 1354651955),
(44, 0, ' Développé avec haltères, mains en pronation, sur banc incliné (-45°)', '', 2, 1354651955),
(45, 0, 'Développé avec haltères, mains en pronation, sur banc décliné', '', 2, 1354651955),
(46, 0, ' Développé avec haltères, dos sur ballon', '', 2, 1354651955),
(47, 0, 'Poussée à la barre parallèle, en excentrique', '', 2, 1354651955),
(48, 0, ' Poussée à la barre parallèle', '', 2, 1354651955),
(49, 0, 'Extension des bras et développé avec haltères', '', 2, 1354651955),
(50, 0, ' Extension des bras et développé avec barre', '', 2, 1354651955),
(51, 0, 'Poussée mains au sol', '', 2, 1354651955),
(52, 0, ' Poussée pieds sur banc', '', 2, 1354651955),
(53, 0, 'Poussée mains sur ballon', '', 2, 1354651955),
(54, 0, ' Adduction des bras avec haltères, mains en pronation', '', 2, 1354651955),
(55, 0, 'Adduction des bras avec haltères, mains en pronation, sur banc incliné', '', 2, 1354651955),
(56, 0, ' Adduction des bras avec haltères, mains en pronation, sur banc décliné', '', 2, 1354651955),
(57, 0, 'Adduction des bras avec haltères, dos sur ballon', '', 2, 1354651955),
(58, 0, ' Adduction des bras avec poulies hautes', '', 2, 1354651955),
(59, 0, 'Adduction des bras avec poulies basses, tronc fléchi', '', 2, 1354651955),
(60, 0, ' Extension des avant-bras, avec haltères, tronc fléchi', '', 2, 1354651955),
(61, 0, 'Extension des avant-bras, avec haltères, assis sur banc', '', 2, 1354651955),
(62, 0, ' Extension des avant-bras, avec haltères, debout', '', 2, 1354651955),
(63, 0, 'Extension des avant-bras, avec barre, debout', '', 2, 1354651955),
(64, 0, ' Extension des avant-bras, avec poulie haute, mains en pronation', '', 2, 1354651955),
(65, 0, 'Extension des avant-bras, avec poulie haute et corde', '', 2, 1354651955),
(66, 0, ' Tirage aux deltoïdes avec un haltère, en appui sur banc', '', 2, 1354651955),
(67, 0, 'Tirage aux deltoïdes avec barre. tronc fléchi', '', 2, 1354651955),
(68, 0, ' Tirage aux deltoïdes avec haltères, ventre sur ballon', '', 2, 1354651955),
(69, 0, 'Levée latérale avec haltères, tronc fléchi', '', 2, 1354651955),
(70, 0, ' Levée latérale avec poulies basses. tronc fléchi', '', 2, 1354651955),
(71, 0, 'Flexion des avant-bras avec barre, mains en supination, debout', '', 2, 1354651955),
(72, 0, ' Flexion des avant-bras avec barre, mains en pronation, debout', '', 2, 1354651955),
(73, 0, 'Flexion des avant-bras avec poulie basse, mains en pronation, debout', '', 2, 1354651955),
(74, 0, ' Flexion des avant-bras avec haltères, mains en supination, assis sur banc', '', 2, 1354651955),
(75, 0, 'Flexion des avant-bras avec haltères, mains en pronation, assis sur banc', '', 2, 1354651955),
(76, 0, ' Flexion des avant-bras avec haltères, mains en supination, sur banc incliné', '', 2, 1354651955),
(77, 0, 'Flexion des avant-bras avec haltères, mains en pronation, sur banc incliné', '', 2, 1354651955),
(78, 0, ' Flexion des avant-bras avec barre, mains en supination, assis sur banc Scott', '', 2, 1354651955),
(79, 0, 'Flexion des avant-bras avec barre, mains en pronation, assis sur banc Scott', '', 2, 1354651955),
(80, 0, ' Élévation des épaules avec haltères, debout', '', 2, 1354651955),
(81, 0, 'Élévation des épaules avec poulie basse, debout', '', 2, 1354651955),
(82, 0, ' Poussée avec barre, assis sur banc', '', 2, 1354651955),
(83, 0, 'Poussée avec barre, debout', '', 2, 1354651955),
(84, 0, ' Poussée avec barre, sur banc incliné (+45 °)', '', 2, 1354651955),
(85, 0, 'Poussée avec barre derrière la tête, assis sur banc', '', 2, 1354651955),
(86, 0, ' Poussée avec barre derrière la tête, debout', '', 2, 1354651955),
(87, 0, 'Poussée avec haltères, mains en pronation, assis sur banc', '', 2, 1354651955),
(88, 0, ' Poussée avec haltères, mains en pronation, debout', '', 2, 1354651955),
(89, 0, 'Poussée avec haltères, mains en pronation, sur banc incliné (+45 °)', '', 2, 1354651955),
(90, 0, ' Soulevé vertical avec barre, debout', '', 2, 1354651955),
(91, 0, 'Soulevé vertical avec haltères, debout', '', 2, 1354651955),
(92, 0, ' Soulevé vertical avec poulie basse, debout', '', 2, 1354651955),
(93, 0, 'Levée latérale avec haltères, debout', '', 2, 1354651955),
(94, 0, ' Levée latérale à une main, avec poulie basse, debout', '', 2, 1354651955),
(95, 0, 'Levée en L avec haltères, debout', '', 2, 1354651955),
(96, 0, ' Levée frontale avec barre, debout', '', 2, 1354651955),
(97, 0, 'Levée frontale avec haltères, debout', '', 2, 1354651955),
(98, 0, ' Traction avant avec poulie haute, prise moyenne', '', 2, 1354651955),
(99, 0, 'Traction arrière avec poulie haute,  prise moyenne', '', 2, 1354651955),
(100, 0, ' Traction aux abdominaux avec poulie basse', '', 2, 1354651955),
(101, 0, 'Traction aux abdominaux avec poulie basse, assis sur banc', '', 2, 1354651955),
(102, 0, ' Traction aux abdominaux avec haltères, tronc fléchi', '', 2, 1354651955),
(103, 0, 'Traction à la barre fixe, mains en supination', '', 2, 1354651955),
(104, 0, ' Traction à la barre fixe, mains en pronation', '', 2, 1354651955),
(105, 0, 'Extension des bras avec un haltère, couché sur banc', '', 2, 1354651955),
(106, 0, ' Extension des bras avec barre, couché sur banc', '', 2, 1354651955),
(107, 0, 'Creux abdominal, couché', '', 2, 1354651955),
(108, 0, ' Bascule du bassin, couché, jambes fléchies', '', 2, 1354651955),
(109, 0, 'Bascule du bassin, debout dos au mur, jambes tendues', '', 2, 1354651955),
(110, 0, ' Bascule latérale du bassin, à la barre fixe', '', 2, 1354651955),
(111, 0, ' Extension des hanches, couché', '', 2, 1354651955),
(112, 0, 'Enroulement du bassin avec ballon, couché', '', 2, 1354651955),
(113, 0, ' Enroulement du bassin à la barre fixe', '', 2, 1354651955),
(114, 0, 'Rotation des hanches avec ballon, couché', '', 2, 1354651955),
(115, 0, ' Élévation latérale des jambes, à la barre fixe', '', 2, 1354651955),
(116, 0, 'Flexion latérale du tronc, sur ballon', '', 2, 1354651955),
(117, 0, ' Flexion du tronc avec ballon, couché', '', 2, 1354651955),
(118, 0, 'Stabilisation abdominale, avant-bras au sol', '', 2, 1354651955),
(119, 0, ' Stabilisation abdominale, avant-bras sur ballon', '', 2, 1354651955),
(120, 0, 'Flexion du tronc, dos sur ballon', '', 2, 1354651955),
(121, 0, ' Roulement sur ballon', '', 2, 1354651955),
(122, 0, 'Flexion de la tête, avec bande élastique, debout', '', 2, 1354651955),
(123, 0, ' Extension de la tête, avec bande élastique, debout', '', 2, 1354651955),
(124, 0, 'Extension de la tête, avec disque, à plat ventre sur banc', '', 2, 1354651955);

-- --------------------------------------------------------

--
-- Structure de la table `musculation_exercice_zone`
--

CREATE TABLE IF NOT EXISTS `musculation_exercice_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercice_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mez_exercice` (`exercice_id`),
  KEY `mez_zone` (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=262 ;

--
-- Contenu de la table `musculation_exercice_zone`
--

INSERT INTO `musculation_exercice_zone` (`id`, `exercice_id`, `zone_id`) VALUES
(1, 1, 15),
(2, 1, 16),
(3, 1, 14),
(4, 2, 15),
(5, 2, 16),
(6, 2, 14),
(7, 3, 15),
(8, 3, 16),
(9, 3, 14),
(10, 4, 15),
(11, 4, 16),
(12, 4, 14),
(13, 5, 15),
(14, 5, 16),
(15, 5, 14),
(16, 6, 9),
(17, 6, 16),
(18, 6, 15),
(19, 7, 9),
(20, 7, 16),
(21, 7, 15),
(22, 8, 9),
(23, 8, 16),
(24, 8, 15),
(25, 9, 9),
(26, 9, 16),
(27, 9, 15),
(28, 10, 9),
(29, 10, 16),
(30, 10, 15),
(31, 11, 9),
(32, 11, 16),
(33, 11, 15),
(34, 12, 9),
(35, 12, 16),
(36, 12, 15),
(37, 13, 9),
(38, 13, 16),
(39, 13, 15),
(40, 14, 9),
(41, 14, 16),
(42, 14, 15),
(43, 15, 9),
(44, 15, 16),
(45, 15, 15),
(46, 16, 9),
(47, 16, 16),
(48, 16, 15),
(49, 17, 9),
(50, 17, 16),
(51, 17, 15),
(52, 18, 9),
(53, 18, 16),
(54, 18, 15),
(55, 19, 9),
(56, 19, 15),
(57, 19, 16),
(58, 20, 9),
(59, 20, 15),
(60, 20, 16),
(61, 21, 15),
(62, 21, 16),
(63, 21, 14),
(64, 22, 16),
(65, 22, 15),
(66, 22, 14),
(67, 23, 15),
(68, 23, 16),
(69, 23, 14),
(70, 24, 16),
(71, 24, 15),
(72, 24, 14),
(73, 25, 16),
(74, 25, 15),
(75, 25, 14),
(76, 26, 16),
(77, 26, 15),
(78, 26, 14),
(79, 27, 16),
(80, 27, 15),
(81, 27, 14),
(82, 28, 14),
(83, 28, 15),
(84, 29, 16),
(85, 29, 15),
(86, 29, 14),
(87, 30, 15),
(88, 0, 15),
(89, 31, 9),
(90, 0, 9),
(91, 32, 17),
(92, 33, 17),
(93, 34, 17),
(94, 35, 8),
(95, 36, 8),
(96, 37, 1),
(97, 37, 12),
(98, 37, 3),
(99, 38, 1),
(100, 38, 12),
(101, 38, 3),
(102, 39, 12),
(103, 39, 3),
(104, 39, 1),
(105, 40, 1),
(106, 40, 12),
(107, 40, 3),
(108, 41, 1),
(109, 41, 12),
(110, 41, 3),
(111, 42, 1),
(112, 42, 12),
(113, 42, 3),
(114, 43, 1),
(115, 43, 12),
(116, 43, 3),
(117, 44, 1),
(118, 44, 12),
(119, 44, 3),
(120, 45, 1),
(121, 45, 12),
(122, 45, 3),
(123, 46, 1),
(124, 46, 12),
(125, 46, 3),
(126, 47, 12),
(127, 47, 3),
(128, 47, 1),
(129, 48, 12),
(130, 48, 3),
(131, 48, 1),
(132, 49, 12),
(133, 49, 1),
(134, 49, 13),
(135, 50, 12),
(136, 50, 1),
(137, 50, 13),
(138, 51, 12),
(139, 51, 3),
(140, 51, 1),
(141, 52, 12),
(142, 52, 3),
(143, 52, 1),
(144, 53, 12),
(145, 53, 3),
(146, 53, 1),
(147, 54, 1),
(148, 54, 3),
(149, 55, 1),
(150, 55, 3),
(151, 56, 1),
(152, 56, 3),
(153, 57, 1),
(154, 57, 3),
(155, 58, 1),
(156, 58, 13),
(157, 59, 1),
(158, 59, 3),
(159, 60, 12),
(160, 61, 12),
(161, 62, 12),
(162, 63, 12),
(163, 64, 12),
(164, 65, 12),
(165, 66, 13),
(166, 66, 4),
(167, 66, 11),
(168, 67, 13),
(169, 67, 4),
(170, 67, 11),
(171, 68, 13),
(172, 68, 4),
(173, 68, 11),
(174, 69, 13),
(175, 69, 11),
(176, 70, 13),
(177, 70, 11),
(178, 71, 4),
(179, 72, 4),
(180, 73, 4),
(181, 74, 4),
(182, 75, 4),
(183, 76, 4),
(184, 77, 4),
(185, 78, 4),
(186, 79, 4),
(187, 80, 13),
(188, 81, 13),
(189, 82, 3),
(190, 82, 12),
(191, 82, 13),
(192, 83, 3),
(193, 83, 12),
(194, 83, 13),
(195, 84, 3),
(196, 84, 12),
(197, 84, 13),
(198, 85, 3),
(199, 85, 12),
(200, 85, 13),
(201, 86, 3),
(202, 86, 12),
(203, 86, 13),
(204, 87, 3),
(205, 87, 12),
(206, 87, 13),
(207, 88, 3),
(208, 88, 12),
(209, 88, 13),
(210, 89, 3),
(211, 89, 12),
(212, 89, 13),
(213, 90, 3),
(214, 90, 13),
(215, 91, 3),
(216, 91, 13),
(217, 92, 3),
(218, 92, 13),
(219, 93, 3),
(220, 94, 3),
(221, 95, 3),
(222, 96, 3),
(223, 97, 3),
(224, 98, 13),
(225, 98, 4),
(226, 99, 13),
(227, 99, 4),
(228, 100, 13),
(229, 100, 4),
(230, 101, 13),
(231, 101, 4),
(232, 102, 13),
(233, 102, 4),
(234, 103, 13),
(235, 103, 4),
(236, 104, 13),
(237, 104, 4),
(238, 105, 13),
(239, 105, 12),
(240, 105, 1),
(241, 106, 13),
(242, 106, 12),
(243, 106, 1),
(244, 107, 0),
(245, 108, 0),
(246, 109, 0),
(247, 110, 0),
(248, 111, 9),
(249, 112, 0),
(250, 113, 0),
(251, 114, 0),
(252, 115, 0),
(253, 116, 0),
(254, 117, 0),
(255, 118, 0),
(256, 119, 0),
(257, 120, 0),
(258, 121, 0),
(259, 122, 7),
(260, 123, 10),
(261, 124, 10);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_cycle`
--

CREATE TABLE IF NOT EXISTS `muscu_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) DEFAULT NULL,
  `description` text,
  `date_debut` int(11) DEFAULT NULL,
  `date_fin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `muscu_cycle`
--

INSERT INTO `muscu_cycle` (`id`, `nom`, `description`, `date_debut`, `date_fin`) VALUES
(1, 'Cycle de reprise', 'Cycle de reprise en debut de saison', 1346457600, 1348963200),
(2, 'Fin de saison', 'Fin de saison', 1338508800, 1341014400),
(3, 'fghfgh', 'fghfhfgh', 1350000000, 1351641600),
(4, 'Test pour fiche', 'qsdqdqsdqsd\r\nqsddqsdqsdsq\r\nqsdqsdqdqsd', 1351728000, 1359590400);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_cycle_joueur`
--

CREATE TABLE IF NOT EXISTS `muscu_cycle_joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) DEFAULT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `muscu_cycle_joueur`
--

INSERT INTO `muscu_cycle_joueur` (`id`, `cycle_id`, `joueur_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 7),
(7, 3, 4),
(8, 3, 9),
(9, 4, 1),
(10, 4, 2),
(11, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_cycle_seance`
--

CREATE TABLE IF NOT EXISTS `muscu_cycle_seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) DEFAULT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `description` text,
  `is_model` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `muscu_cycle_seance`
--

INSERT INTO `muscu_cycle_seance` (`id`, `cycle_id`, `nom`, `description`, `is_model`) VALUES
(1, 1, 'Haut force', 'Permet de reprendre la force', 1),
(2, 2, 'Haut force', 'Permet de reprendre la force', 0),
(3, 1, 'Haut endurance', 'Haut endurance\r\nHaut endurance', 1),
(4, 3, 'Haut endurance', 'Haut endurance\r\nHaut endurance', 0),
(5, 3, 'fgdgdfg', 'fdgdfgdfgd', 1),
(6, 0, 'tes test', 'test\r\ntest\r\n', 0),
(7, 4, 'Haut force', 'Permet de reprendre la force', 0),
(8, 4, 'Haut endurance', 'Haut endurance\r\nHaut endurance', 0),
(9, 0, 'Test', 'seance de test', 1),
(10, 0, 'Test2', 'dfgdfgdfgdfg', 1),
(11, 0, 'Test3', 'gdfgdfgdfg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_cycle_seance_exercice`
--

CREATE TABLE IF NOT EXISTS `muscu_cycle_seance_exercice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercice_id` int(11) NOT NULL,
  `seance_id` int(11) NOT NULL,
  `poids` int(4) DEFAULT NULL,
  `repetition` int(3) DEFAULT NULL,
  `serie` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercice_id` (`exercice_id`),
  KEY `seance_id` (`seance_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contient les exercices d une seance' AUTO_INCREMENT=17 ;

--
-- Contenu de la table `muscu_cycle_seance_exercice`
--

INSERT INTO `muscu_cycle_seance_exercice` (`id`, `exercice_id`, `seance_id`, `poids`, `repetition`, `serie`) VALUES
(1, 2, 1, 70, 10, 5),
(2, 1, 1, 70, 10, 5),
(3, 2, 2, 70, 10, 5),
(4, 1, 2, 70, 10, 5),
(5, 2, 3, 50, 30, 10),
(6, 2, 5, 10, 10, 10),
(7, 1, 5, 10, 10, 10),
(8, 2, 6, 10, 10, 10),
(9, 1, 6, 10, 10, 10),
(10, 2, 7, 70, 10, 5),
(11, 1, 7, 70, 10, 5),
(12, 2, 8, 50, 30, 10),
(13, 9, 10, 50, 50, 50),
(14, 8, 10, 50, 50, 50),
(15, 1, 11, 80, 20, 50),
(16, 2, 11, 80, 20, 50);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_exercice_photo`
--

CREATE TABLE IF NOT EXISTS `muscu_exercice_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercice_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `ordre` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercice_id` (`exercice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `muscu_exercice_photo`
--

INSERT INTO `muscu_exercice_photo` (`id`, `exercice_id`, `photo`, `ordre`) VALUES
(2, 8, '13519476702.jpg', 2),
(3, 8, '13519476703.jpg', 3),
(4, 8, '13519476704.png', 4),
(5, 8, '13519487271.jpg', 5),
(6, 8, '13519487272.png', 6);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_seance`
--

CREATE TABLE IF NOT EXISTS `muscu_seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) DEFAULT NULL,
  `date_seance` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  `seance_id` int(11) DEFAULT NULL COMMENT 'Correspond a l ID de la seance du cycle dans muscu_cycle_seance',
  `date_s` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `muscu_seance`
--

INSERT INTO `muscu_seance` (`id`, `joueur_id`, `date_seance`, `model_id`, `cycle_id`, `seance_id`, `date_s`) VALUES
(1, 1, 1346544000, NULL, 1, 1, NULL),
(2, 2, 1346544000, NULL, 1, 1, NULL),
(3, 1, 1343088000, NULL, 1, 3, NULL),
(4, 2, 1343088000, NULL, 1, 3, NULL),
(5, 2, 1351209600, NULL, NULL, NULL, NULL),
(6, 1, 1352764800, NULL, NULL, NULL, NULL),
(7, 1, 1352937600, NULL, 4, 7, NULL),
(8, 4, 1352937600, NULL, 4, 7, NULL),
(9, 2, 1352937600, NULL, 4, 7, NULL),
(10, 1, 1353542400, NULL, 4, 7, NULL),
(11, 4, 1353542400, NULL, 4, 7, NULL),
(12, 2, 1353542400, NULL, 4, 7, NULL),
(13, 2, 1354492800, NULL, NULL, NULL, '2012-12-03'),
(14, 2, 1358380800, NULL, NULL, NULL, NULL),
(15, 2, 1358640000, NULL, NULL, NULL, NULL),
(16, 1, 1358726400, NULL, 4, 7, NULL),
(17, 4, 1358726400, NULL, 4, 7, NULL),
(18, 2, 1358726400, NULL, 4, 7, NULL),
(19, 2, 1358553600, NULL, NULL, NULL, NULL),
(20, 1, 1358467200, NULL, 4, 7, NULL),
(21, 2, 1358467200, NULL, 4, 7, NULL),
(22, 4, 1358467200, NULL, 4, 7, NULL),
(23, 2, 1359244800, NULL, NULL, NULL, '2013-01-27'),
(24, 1, 1359331200, NULL, 4, 7, '2013-01-28'),
(25, 2, 1359331200, NULL, 4, 7, '2013-01-28'),
(26, 4, 1359331200, NULL, 4, 7, '2013-01-28');

-- --------------------------------------------------------

--
-- Structure de la table `muscu_seance_exo_resultat`
--

CREATE TABLE IF NOT EXISTS `muscu_seance_exo_resultat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seance_id` int(11) DEFAULT NULL COMMENT 'Liaison avec l ID dans muscu_seance',
  `exercice_id` int(11) DEFAULT NULL COMMENT 'Liaison avec l ID dans muscu_cycle_seance_exo',
  `poids` varchar(45) DEFAULT NULL,
  `repetition` varchar(45) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `muscu_seance_exo_resultat`
--

INSERT INTO `muscu_seance_exo_resultat` (`id`, `seance_id`, `exercice_id`, `poids`, `repetition`, `serie`) VALUES
(1, 1, 1, '70', '10', '5'),
(2, 2, 1, '70', '10', '5'),
(3, 1, 2, '70', '10', '5'),
(4, 2, 2, '70', '10', '5'),
(5, 3, 5, '50', '30', '10'),
(6, 4, 5, '50', '30', '10'),
(7, 5, 2, '80', '10', '3'),
(8, 5, 4, '100', '30', '3'),
(9, 6, 2, '60', '15', '3'),
(10, 6, 1, '60', '15', '3'),
(11, 7, 10, '70', '10', '5'),
(12, 8, 10, '70', '10', '5'),
(13, 9, 10, '70', '10', '5'),
(14, 7, 11, '70', '10', '5'),
(15, 8, 11, '70', '10', '5'),
(16, 9, 11, '70', '10', '5'),
(17, 10, 10, '70', '10', '5'),
(18, 12, 10, '70', '10', '5'),
(19, 11, 10, '70', '10', '5'),
(20, 10, 11, '70', '10', '5'),
(21, 12, 11, '70', '10', '5'),
(22, 11, 11, '70', '10', '5'),
(23, 13, 10, '50', '10', '3'),
(24, 13, 2, '80', '5', '10'),
(25, 14, 12, '10', '10', '10'),
(26, 14, 46, '10', '10', '10'),
(27, 14, 108, '10', '10', '10'),
(28, 15, 30, '10', '10', '10'),
(29, 16, 10, '70', '10', '5'),
(30, 17, 10, '70', '10', '5'),
(31, 18, 10, '70', '10', '5'),
(32, 16, 11, '70', '10', '5'),
(33, 17, 11, '70', '10', '5'),
(34, 18, 11, '70', '10', '5'),
(35, 19, 8, '20', '20', '20'),
(36, 20, 10, '70', '10', '5'),
(37, 21, 10, '70', '10', '5'),
(38, 22, 10, '70', '10', '5'),
(39, 20, 11, '70', '10', '5'),
(40, 21, 11, '70', '10', '5'),
(41, 22, 11, '70', '10', '5'),
(42, 23, 44, '10', '10', '10'),
(43, 24, 10, '70', '10', '5'),
(44, 25, 10, '70', '10', '5'),
(45, 26, 10, '70', '10', '5'),
(46, 24, 11, '70', '10', '5'),
(47, 25, 11, '70', '10', '5'),
(48, 26, 11, '70', '10', '5');

-- --------------------------------------------------------

--
-- Structure de la table `muscu_test`
--

CREATE TABLE IF NOT EXISTS `muscu_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_test` int(11) NOT NULL,
  `creat_by` int(11) NOT NULL,
  `creat_on` int(11) NOT NULL,
  `edit_by` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  `exo_liste` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `muscu_test`
--

INSERT INTO `muscu_test` (`id`, `date_test`, `creat_by`, `creat_on`, `edit_by`, `edit_on`, `exo_liste`) VALUES
(1, 1354492800, 1, 1354749046, 1, 1354749046, NULL),
(2, 1355702400, 1, 1354749613, 1, 1354749613, NULL),
(3, 1356566400, 1, 1354749929, 1, 1354749929, NULL),
(4, 1356566400, 1, 1354749929, 1, 1354749929, NULL),
(5, 1356566400, 1, 1354749929, 1, 1354749929, NULL),
(6, 1355788800, 1, 1354750266, 1, 1354750266, NULL),
(7, 1356912000, 1, 1354752737, 1, 1354752737, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_test_joueur`
--

CREATE TABLE IF NOT EXISTS `muscu_test_joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `joueur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_id` (`test_id`,`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Liaison entre le test et le joueur' AUTO_INCREMENT=104 ;

--
-- Contenu de la table `muscu_test_joueur`
--

INSERT INTO `muscu_test_joueur` (`id`, `test_id`, `joueur_id`) VALUES
(1, 1, 1),
(2, 1, 7),
(3, 1, 2),
(4, 1, 4),
(5, 1, 11),
(6, 1, 10),
(7, 1, 3),
(8, 1, 9),
(9, 1, 12),
(10, 1, 8),
(11, 1, 13),
(12, 1, 14),
(13, 1, 15),
(14, 1, 16),
(15, 1, 17),
(16, 1, 18),
(17, 2, 1),
(18, 2, 7),
(19, 2, 2),
(20, 2, 4),
(21, 2, 11),
(22, 2, 10),
(23, 2, 3),
(24, 2, 9),
(25, 2, 12),
(26, 2, 8),
(27, 2, 13),
(28, 2, 14),
(29, 2, 15),
(30, 2, 16),
(31, 2, 17),
(32, 2, 18),
(33, 3, 1),
(34, 3, 7),
(35, 3, 2),
(36, 3, 4),
(37, 3, 11),
(38, 3, 10),
(39, 3, 3),
(40, 3, 9),
(41, 3, 12),
(42, 3, 8),
(43, 3, 13),
(44, 3, 14),
(45, 3, 15),
(46, 3, 16),
(47, 3, 17),
(48, 3, 18),
(49, 4, 1),
(50, 4, 7),
(51, 4, 2),
(52, 4, 4),
(53, 4, 11),
(54, 4, 10),
(55, 4, 3),
(56, 4, 9),
(57, 4, 12),
(58, 4, 8),
(59, 4, 13),
(60, 4, 14),
(61, 4, 15),
(62, 4, 16),
(63, 4, 17),
(64, 4, 18),
(65, 5, 1),
(66, 5, 7),
(67, 5, 2),
(68, 5, 4),
(69, 5, 11),
(70, 5, 10),
(71, 5, 3),
(72, 5, 9),
(73, 5, 12),
(74, 5, 8),
(75, 5, 13),
(76, 5, 14),
(77, 5, 15),
(78, 5, 16),
(79, 5, 17),
(80, 5, 18),
(81, 6, 1),
(82, 6, 7),
(83, 6, 2),
(84, 6, 4),
(85, 6, 11),
(86, 6, 10),
(87, 6, 3),
(88, 6, 9),
(89, 6, 12),
(90, 6, 8),
(91, 6, 13),
(92, 6, 14),
(93, 6, 15),
(94, 6, 16),
(95, 6, 17),
(96, 6, 18),
(97, 7, 1),
(98, 7, 14),
(99, 7, 15),
(100, 7, 16),
(101, 7, 17),
(102, 7, 18),
(103, 7, 8);

-- --------------------------------------------------------

--
-- Structure de la table `muscu_test_resultat`
--

CREATE TABLE IF NOT EXISTS `muscu_test_resultat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  `joueur_id` int(11) NOT NULL,
  `resultat` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=655 ;

--
-- Contenu de la table `muscu_test_resultat`
--

INSERT INTO `muscu_test_resultat` (`id`, `test_id`, `exercice_id`, `joueur_id`, `resultat`) VALUES
(1, 1, 1, 1, ''),
(2, 1, 2, 1, ''),
(3, 1, 3, 1, ''),
(4, 1, 4, 1, ''),
(5, 1, 1, 7, ''),
(6, 1, 2, 7, ''),
(7, 1, 3, 7, ''),
(8, 1, 4, 7, ''),
(9, 1, 1, 2, ''),
(10, 1, 2, 2, ''),
(11, 1, 3, 2, ''),
(12, 1, 4, 2, ''),
(13, 1, 1, 4, ''),
(14, 1, 2, 4, ''),
(15, 1, 3, 4, ''),
(16, 1, 4, 4, ''),
(17, 1, 1, 11, ''),
(18, 1, 2, 11, ''),
(19, 1, 3, 11, ''),
(20, 1, 4, 11, ''),
(21, 1, 1, 10, ''),
(22, 1, 2, 10, ''),
(23, 1, 3, 10, ''),
(24, 1, 4, 10, ''),
(25, 1, 1, 3, ''),
(26, 1, 2, 3, ''),
(27, 1, 3, 3, ''),
(28, 1, 4, 3, ''),
(29, 1, 1, 9, ''),
(30, 1, 2, 9, ''),
(31, 1, 3, 9, ''),
(32, 1, 4, 9, ''),
(33, 1, 1, 12, ''),
(34, 1, 2, 12, ''),
(35, 1, 3, 12, ''),
(36, 1, 4, 12, ''),
(37, 1, 1, 8, ''),
(38, 1, 2, 8, ''),
(39, 1, 3, 8, ''),
(40, 1, 4, 8, ''),
(41, 1, 1, 13, ''),
(42, 1, 2, 13, ''),
(43, 1, 3, 13, ''),
(44, 1, 4, 13, ''),
(45, 1, 1, 14, ''),
(46, 1, 2, 14, ''),
(47, 1, 3, 14, ''),
(48, 1, 4, 14, ''),
(49, 1, 1, 15, ''),
(50, 1, 2, 15, ''),
(51, 1, 3, 15, ''),
(52, 1, 4, 15, ''),
(53, 1, 1, 16, ''),
(54, 1, 2, 16, ''),
(55, 1, 3, 16, ''),
(56, 1, 4, 16, ''),
(57, 1, 1, 17, ''),
(58, 1, 2, 17, ''),
(59, 1, 3, 17, ''),
(60, 1, 4, 17, ''),
(61, 1, 1, 18, ''),
(62, 1, 2, 18, ''),
(63, 1, 3, 18, ''),
(64, 1, 4, 18, ''),
(65, 2, 1, 1, ''),
(66, 2, 3, 1, ''),
(67, 2, 14, 1, ''),
(68, 2, 10, 1, ''),
(69, 2, 19, 1, ''),
(70, 2, 1, 7, ''),
(71, 2, 3, 7, ''),
(72, 2, 14, 7, ''),
(73, 2, 10, 7, ''),
(74, 2, 19, 7, ''),
(75, 2, 1, 2, ''),
(76, 2, 3, 2, ''),
(77, 2, 14, 2, ''),
(78, 2, 10, 2, ''),
(79, 2, 19, 2, ''),
(80, 2, 1, 4, ''),
(81, 2, 3, 4, ''),
(82, 2, 14, 4, ''),
(83, 2, 10, 4, ''),
(84, 2, 19, 4, ''),
(85, 2, 1, 11, ''),
(86, 2, 3, 11, ''),
(87, 2, 14, 11, ''),
(88, 2, 10, 11, ''),
(89, 2, 19, 11, ''),
(90, 2, 1, 10, ''),
(91, 2, 3, 10, ''),
(92, 2, 14, 10, ''),
(93, 2, 10, 10, ''),
(94, 2, 19, 10, ''),
(95, 2, 1, 3, ''),
(96, 2, 3, 3, ''),
(97, 2, 14, 3, ''),
(98, 2, 10, 3, ''),
(99, 2, 19, 3, ''),
(100, 2, 1, 9, ''),
(101, 2, 3, 9, ''),
(102, 2, 14, 9, ''),
(103, 2, 10, 9, ''),
(104, 2, 19, 9, ''),
(105, 2, 1, 12, ''),
(106, 2, 3, 12, ''),
(107, 2, 14, 12, ''),
(108, 2, 10, 12, ''),
(109, 2, 19, 12, ''),
(110, 2, 1, 8, ''),
(111, 2, 3, 8, ''),
(112, 2, 14, 8, ''),
(113, 2, 10, 8, ''),
(114, 2, 19, 8, ''),
(115, 2, 1, 13, ''),
(116, 2, 3, 13, ''),
(117, 2, 14, 13, ''),
(118, 2, 10, 13, ''),
(119, 2, 19, 13, ''),
(120, 2, 1, 14, ''),
(121, 2, 3, 14, ''),
(122, 2, 14, 14, ''),
(123, 2, 10, 14, ''),
(124, 2, 19, 14, ''),
(125, 2, 1, 15, ''),
(126, 2, 3, 15, ''),
(127, 2, 14, 15, ''),
(128, 2, 10, 15, ''),
(129, 2, 19, 15, ''),
(130, 2, 1, 16, ''),
(131, 2, 3, 16, ''),
(132, 2, 14, 16, ''),
(133, 2, 10, 16, ''),
(134, 2, 19, 16, ''),
(135, 2, 1, 17, ''),
(136, 2, 3, 17, ''),
(137, 2, 14, 17, ''),
(138, 2, 10, 17, ''),
(139, 2, 19, 17, ''),
(140, 2, 1, 18, ''),
(141, 2, 3, 18, ''),
(142, 2, 14, 18, ''),
(143, 2, 10, 18, ''),
(144, 2, 19, 18, ''),
(145, 3, 4, 1, ''),
(146, 3, 45, 1, ''),
(147, 3, 40, 1, ''),
(148, 3, 27, 1, ''),
(149, 3, 57, 1, ''),
(150, 3, 63, 1, ''),
(151, 3, 73, 1, ''),
(152, 3, 90, 1, ''),
(153, 3, 101, 1, ''),
(154, 3, 4, 7, ''),
(155, 3, 45, 7, ''),
(156, 3, 40, 7, ''),
(157, 3, 27, 7, ''),
(158, 3, 57, 7, ''),
(159, 3, 63, 7, ''),
(160, 3, 73, 7, ''),
(161, 3, 90, 7, ''),
(162, 3, 101, 7, ''),
(163, 3, 4, 2, ''),
(164, 3, 45, 2, ''),
(165, 3, 40, 2, ''),
(166, 3, 27, 2, ''),
(167, 3, 57, 2, ''),
(168, 3, 63, 2, ''),
(169, 3, 73, 2, ''),
(170, 3, 90, 2, ''),
(171, 3, 101, 2, ''),
(172, 3, 4, 4, ''),
(173, 3, 45, 4, ''),
(174, 3, 40, 4, ''),
(175, 3, 27, 4, ''),
(176, 3, 57, 4, ''),
(177, 3, 63, 4, ''),
(178, 3, 73, 4, ''),
(179, 3, 90, 4, ''),
(180, 3, 101, 4, ''),
(181, 3, 4, 11, ''),
(182, 3, 45, 11, ''),
(183, 3, 40, 11, ''),
(184, 3, 27, 11, ''),
(185, 3, 57, 11, ''),
(186, 3, 63, 11, ''),
(187, 3, 73, 11, ''),
(188, 3, 90, 11, ''),
(189, 3, 101, 11, ''),
(190, 3, 4, 10, ''),
(191, 3, 45, 10, ''),
(192, 3, 40, 10, ''),
(193, 3, 27, 10, ''),
(194, 3, 57, 10, ''),
(195, 3, 63, 10, ''),
(196, 3, 73, 10, ''),
(197, 3, 90, 10, ''),
(198, 3, 101, 10, ''),
(199, 3, 4, 3, ''),
(200, 3, 45, 3, ''),
(201, 3, 40, 3, ''),
(202, 3, 27, 3, ''),
(203, 3, 57, 3, ''),
(204, 3, 63, 3, ''),
(205, 3, 73, 3, ''),
(206, 3, 90, 3, ''),
(207, 3, 101, 3, ''),
(208, 3, 4, 9, ''),
(209, 3, 45, 9, ''),
(210, 3, 40, 9, ''),
(211, 3, 27, 9, ''),
(212, 3, 57, 9, ''),
(213, 3, 63, 9, ''),
(214, 3, 73, 9, ''),
(215, 3, 90, 9, ''),
(216, 3, 101, 9, ''),
(217, 3, 4, 12, ''),
(218, 3, 45, 12, ''),
(219, 3, 40, 12, ''),
(220, 3, 27, 12, ''),
(221, 3, 57, 12, ''),
(222, 3, 63, 12, ''),
(223, 3, 73, 12, ''),
(224, 3, 90, 12, ''),
(225, 3, 101, 12, ''),
(226, 3, 4, 8, ''),
(227, 3, 45, 8, ''),
(228, 3, 40, 8, ''),
(229, 3, 27, 8, ''),
(230, 3, 57, 8, ''),
(231, 3, 63, 8, ''),
(232, 3, 73, 8, ''),
(233, 3, 90, 8, ''),
(234, 3, 101, 8, ''),
(235, 3, 4, 13, ''),
(236, 3, 45, 13, ''),
(237, 3, 40, 13, ''),
(238, 3, 27, 13, ''),
(239, 3, 57, 13, ''),
(240, 3, 63, 13, ''),
(241, 3, 73, 13, ''),
(242, 3, 90, 13, ''),
(243, 3, 101, 13, ''),
(244, 3, 4, 14, ''),
(245, 3, 45, 14, ''),
(246, 3, 40, 14, ''),
(247, 3, 27, 14, ''),
(248, 3, 57, 14, ''),
(249, 3, 63, 14, ''),
(250, 3, 73, 14, ''),
(251, 3, 90, 14, ''),
(252, 3, 101, 14, ''),
(253, 3, 4, 15, ''),
(254, 3, 45, 15, ''),
(255, 3, 40, 15, ''),
(256, 3, 27, 15, ''),
(257, 3, 57, 15, ''),
(258, 3, 63, 15, ''),
(259, 3, 73, 15, ''),
(260, 3, 90, 15, ''),
(261, 3, 101, 15, ''),
(262, 3, 4, 16, ''),
(263, 3, 45, 16, ''),
(264, 3, 40, 16, ''),
(265, 3, 27, 16, ''),
(266, 3, 57, 16, ''),
(267, 3, 63, 16, ''),
(268, 3, 73, 16, ''),
(269, 3, 90, 16, ''),
(270, 3, 101, 16, ''),
(271, 3, 4, 17, ''),
(272, 3, 45, 17, ''),
(273, 3, 40, 17, ''),
(274, 3, 27, 17, ''),
(275, 3, 57, 17, ''),
(276, 3, 63, 17, ''),
(277, 3, 73, 17, ''),
(278, 3, 90, 17, ''),
(279, 3, 101, 17, ''),
(280, 3, 4, 18, ''),
(281, 3, 45, 18, ''),
(282, 3, 40, 18, ''),
(283, 3, 27, 18, ''),
(284, 3, 57, 18, ''),
(285, 3, 63, 18, ''),
(286, 3, 73, 18, ''),
(287, 3, 90, 18, ''),
(288, 3, 101, 18, ''),
(289, 4, 4, 1, ''),
(290, 4, 45, 1, ''),
(291, 4, 40, 1, ''),
(292, 4, 27, 1, ''),
(293, 4, 57, 1, ''),
(294, 4, 63, 1, ''),
(295, 4, 73, 1, ''),
(296, 4, 90, 1, ''),
(297, 4, 101, 1, ''),
(298, 4, 4, 7, ''),
(299, 4, 45, 7, ''),
(300, 4, 40, 7, ''),
(301, 4, 27, 7, ''),
(302, 4, 57, 7, ''),
(303, 4, 63, 7, ''),
(304, 4, 73, 7, ''),
(305, 4, 90, 7, ''),
(306, 4, 101, 7, ''),
(307, 4, 4, 2, ''),
(308, 4, 45, 2, ''),
(309, 4, 40, 2, ''),
(310, 4, 27, 2, ''),
(311, 4, 57, 2, ''),
(312, 4, 63, 2, ''),
(313, 4, 73, 2, ''),
(314, 4, 90, 2, ''),
(315, 4, 101, 2, ''),
(316, 4, 4, 4, ''),
(317, 4, 45, 4, ''),
(318, 4, 40, 4, ''),
(319, 4, 27, 4, ''),
(320, 4, 57, 4, ''),
(321, 4, 63, 4, ''),
(322, 4, 73, 4, ''),
(323, 4, 90, 4, ''),
(324, 4, 101, 4, ''),
(325, 4, 4, 11, ''),
(326, 4, 45, 11, ''),
(327, 4, 40, 11, ''),
(328, 4, 27, 11, ''),
(329, 4, 57, 11, ''),
(330, 4, 63, 11, ''),
(331, 4, 73, 11, ''),
(332, 4, 90, 11, ''),
(333, 4, 101, 11, ''),
(334, 4, 4, 10, ''),
(335, 4, 45, 10, ''),
(336, 4, 40, 10, ''),
(337, 4, 27, 10, ''),
(338, 4, 57, 10, ''),
(339, 4, 63, 10, ''),
(340, 4, 73, 10, ''),
(341, 4, 90, 10, ''),
(342, 4, 101, 10, ''),
(343, 4, 4, 3, ''),
(344, 4, 45, 3, ''),
(345, 4, 40, 3, ''),
(346, 4, 27, 3, ''),
(347, 4, 57, 3, ''),
(348, 4, 63, 3, ''),
(349, 4, 73, 3, ''),
(350, 4, 90, 3, ''),
(351, 4, 101, 3, ''),
(352, 4, 4, 9, ''),
(353, 4, 45, 9, ''),
(354, 4, 40, 9, ''),
(355, 4, 27, 9, ''),
(356, 4, 57, 9, ''),
(357, 4, 63, 9, ''),
(358, 4, 73, 9, ''),
(359, 4, 90, 9, ''),
(360, 4, 101, 9, ''),
(361, 4, 4, 12, ''),
(362, 4, 45, 12, ''),
(363, 4, 40, 12, ''),
(364, 4, 27, 12, ''),
(365, 4, 57, 12, ''),
(366, 4, 63, 12, ''),
(367, 4, 73, 12, ''),
(368, 4, 90, 12, ''),
(369, 4, 101, 12, ''),
(370, 4, 4, 8, ''),
(371, 4, 45, 8, ''),
(372, 4, 40, 8, ''),
(373, 4, 27, 8, ''),
(374, 4, 57, 8, ''),
(375, 4, 63, 8, ''),
(376, 4, 73, 8, ''),
(377, 4, 90, 8, ''),
(378, 4, 101, 8, ''),
(379, 4, 4, 13, ''),
(380, 4, 45, 13, ''),
(381, 4, 40, 13, ''),
(382, 4, 27, 13, ''),
(383, 4, 57, 13, ''),
(384, 4, 63, 13, ''),
(385, 4, 73, 13, ''),
(386, 4, 90, 13, ''),
(387, 4, 101, 13, ''),
(388, 4, 4, 14, ''),
(389, 4, 45, 14, ''),
(390, 4, 40, 14, ''),
(391, 4, 27, 14, ''),
(392, 4, 57, 14, ''),
(393, 4, 63, 14, ''),
(394, 4, 73, 14, ''),
(395, 4, 90, 14, ''),
(396, 4, 101, 14, ''),
(397, 4, 4, 15, ''),
(398, 4, 45, 15, ''),
(399, 4, 40, 15, ''),
(400, 4, 27, 15, ''),
(401, 4, 57, 15, ''),
(402, 4, 63, 15, ''),
(403, 4, 73, 15, ''),
(404, 4, 90, 15, ''),
(405, 4, 101, 15, ''),
(406, 4, 4, 16, ''),
(407, 4, 45, 16, ''),
(408, 4, 40, 16, ''),
(409, 4, 27, 16, ''),
(410, 4, 57, 16, ''),
(411, 4, 63, 16, ''),
(412, 4, 73, 16, ''),
(413, 4, 90, 16, ''),
(414, 4, 101, 16, ''),
(415, 4, 4, 17, ''),
(416, 4, 45, 17, ''),
(417, 4, 40, 17, ''),
(418, 4, 27, 17, ''),
(419, 4, 57, 17, ''),
(420, 4, 63, 17, ''),
(421, 4, 73, 17, ''),
(422, 4, 90, 17, ''),
(423, 4, 101, 17, ''),
(424, 4, 4, 18, ''),
(425, 4, 45, 18, ''),
(426, 4, 40, 18, ''),
(427, 4, 27, 18, ''),
(428, 4, 57, 18, ''),
(429, 4, 63, 18, ''),
(430, 4, 73, 18, ''),
(431, 4, 90, 18, ''),
(432, 4, 101, 18, ''),
(433, 5, 4, 1, ''),
(434, 5, 45, 1, ''),
(435, 5, 40, 1, ''),
(436, 5, 27, 1, ''),
(437, 5, 57, 1, ''),
(438, 5, 63, 1, ''),
(439, 5, 73, 1, ''),
(440, 5, 90, 1, ''),
(441, 5, 101, 1, ''),
(442, 5, 4, 7, ''),
(443, 5, 45, 7, ''),
(444, 5, 40, 7, ''),
(445, 5, 27, 7, ''),
(446, 5, 57, 7, ''),
(447, 5, 63, 7, ''),
(448, 5, 73, 7, ''),
(449, 5, 90, 7, ''),
(450, 5, 101, 7, ''),
(451, 5, 4, 2, ''),
(452, 5, 45, 2, ''),
(453, 5, 40, 2, ''),
(454, 5, 27, 2, ''),
(455, 5, 57, 2, ''),
(456, 5, 63, 2, ''),
(457, 5, 73, 2, ''),
(458, 5, 90, 2, ''),
(459, 5, 101, 2, ''),
(460, 5, 4, 4, ''),
(461, 5, 45, 4, ''),
(462, 5, 40, 4, ''),
(463, 5, 27, 4, ''),
(464, 5, 57, 4, ''),
(465, 5, 63, 4, ''),
(466, 5, 73, 4, ''),
(467, 5, 90, 4, ''),
(468, 5, 101, 4, ''),
(469, 5, 4, 11, ''),
(470, 5, 45, 11, ''),
(471, 5, 40, 11, ''),
(472, 5, 27, 11, ''),
(473, 5, 57, 11, ''),
(474, 5, 63, 11, ''),
(475, 5, 73, 11, ''),
(476, 5, 90, 11, ''),
(477, 5, 101, 11, ''),
(478, 5, 4, 10, ''),
(479, 5, 45, 10, ''),
(480, 5, 40, 10, ''),
(481, 5, 27, 10, ''),
(482, 5, 57, 10, ''),
(483, 5, 63, 10, ''),
(484, 5, 73, 10, ''),
(485, 5, 90, 10, ''),
(486, 5, 101, 10, ''),
(487, 5, 4, 3, ''),
(488, 5, 45, 3, ''),
(489, 5, 40, 3, ''),
(490, 5, 27, 3, ''),
(491, 5, 57, 3, ''),
(492, 5, 63, 3, ''),
(493, 5, 73, 3, ''),
(494, 5, 90, 3, ''),
(495, 5, 101, 3, ''),
(496, 5, 4, 9, ''),
(497, 5, 45, 9, ''),
(498, 5, 40, 9, ''),
(499, 5, 27, 9, ''),
(500, 5, 57, 9, ''),
(501, 5, 63, 9, ''),
(502, 5, 73, 9, ''),
(503, 5, 90, 9, ''),
(504, 5, 101, 9, ''),
(505, 5, 4, 12, ''),
(506, 5, 45, 12, ''),
(507, 5, 40, 12, ''),
(508, 5, 27, 12, ''),
(509, 5, 57, 12, ''),
(510, 5, 63, 12, ''),
(511, 5, 73, 12, ''),
(512, 5, 90, 12, ''),
(513, 5, 101, 12, ''),
(514, 5, 4, 8, ''),
(515, 5, 45, 8, ''),
(516, 5, 40, 8, ''),
(517, 5, 27, 8, ''),
(518, 5, 57, 8, ''),
(519, 5, 63, 8, ''),
(520, 5, 73, 8, ''),
(521, 5, 90, 8, ''),
(522, 5, 101, 8, ''),
(523, 5, 4, 13, ''),
(524, 5, 45, 13, ''),
(525, 5, 40, 13, ''),
(526, 5, 27, 13, ''),
(527, 5, 57, 13, ''),
(528, 5, 63, 13, ''),
(529, 5, 73, 13, ''),
(530, 5, 90, 13, ''),
(531, 5, 101, 13, ''),
(532, 5, 4, 14, ''),
(533, 5, 45, 14, ''),
(534, 5, 40, 14, ''),
(535, 5, 27, 14, ''),
(536, 5, 57, 14, ''),
(537, 5, 63, 14, ''),
(538, 5, 73, 14, ''),
(539, 5, 90, 14, ''),
(540, 5, 101, 14, ''),
(541, 5, 4, 15, ''),
(542, 5, 45, 15, ''),
(543, 5, 40, 15, ''),
(544, 5, 27, 15, ''),
(545, 5, 57, 15, ''),
(546, 5, 63, 15, ''),
(547, 5, 73, 15, ''),
(548, 5, 90, 15, ''),
(549, 5, 101, 15, ''),
(550, 5, 4, 16, ''),
(551, 5, 45, 16, ''),
(552, 5, 40, 16, ''),
(553, 5, 27, 16, ''),
(554, 5, 57, 16, ''),
(555, 5, 63, 16, ''),
(556, 5, 73, 16, ''),
(557, 5, 90, 16, ''),
(558, 5, 101, 16, ''),
(559, 5, 4, 17, ''),
(560, 5, 45, 17, ''),
(561, 5, 40, 17, ''),
(562, 5, 27, 17, ''),
(563, 5, 57, 17, ''),
(564, 5, 63, 17, ''),
(565, 5, 73, 17, ''),
(566, 5, 90, 17, ''),
(567, 5, 101, 17, ''),
(568, 5, 4, 18, ''),
(569, 5, 45, 18, ''),
(570, 5, 40, 18, ''),
(571, 5, 27, 18, ''),
(572, 5, 57, 18, ''),
(573, 5, 63, 18, ''),
(574, 5, 73, 18, ''),
(575, 5, 90, 18, ''),
(576, 5, 101, 18, ''),
(577, 6, 2, 1, ''),
(578, 6, 3, 1, ''),
(579, 6, 5, 1, ''),
(580, 6, 8, 1, ''),
(581, 6, 2, 7, ''),
(582, 6, 3, 7, ''),
(583, 6, 5, 7, ''),
(584, 6, 8, 7, ''),
(585, 6, 2, 2, ''),
(586, 6, 3, 2, ''),
(587, 6, 5, 2, ''),
(588, 6, 8, 2, ''),
(589, 6, 2, 4, ''),
(590, 6, 3, 4, ''),
(591, 6, 5, 4, ''),
(592, 6, 8, 4, ''),
(593, 6, 2, 11, ''),
(594, 6, 3, 11, ''),
(595, 6, 5, 11, ''),
(596, 6, 8, 11, ''),
(597, 6, 2, 10, ''),
(598, 6, 3, 10, ''),
(599, 6, 5, 10, ''),
(600, 6, 8, 10, ''),
(601, 6, 2, 3, ''),
(602, 6, 3, 3, ''),
(603, 6, 5, 3, ''),
(604, 6, 8, 3, ''),
(605, 6, 2, 9, ''),
(606, 6, 3, 9, ''),
(607, 6, 5, 9, ''),
(608, 6, 8, 9, ''),
(609, 6, 2, 12, ''),
(610, 6, 3, 12, ''),
(611, 6, 5, 12, ''),
(612, 6, 8, 12, ''),
(613, 6, 2, 8, ''),
(614, 6, 3, 8, ''),
(615, 6, 5, 8, ''),
(616, 6, 8, 8, ''),
(617, 6, 2, 13, ''),
(618, 6, 3, 13, ''),
(619, 6, 5, 13, ''),
(620, 6, 8, 13, ''),
(621, 6, 2, 14, ''),
(622, 6, 3, 14, ''),
(623, 6, 5, 14, ''),
(624, 6, 8, 14, ''),
(625, 6, 2, 15, ''),
(626, 6, 3, 15, ''),
(627, 6, 5, 15, ''),
(628, 6, 8, 15, ''),
(629, 6, 2, 16, ''),
(630, 6, 3, 16, ''),
(631, 6, 5, 16, ''),
(632, 6, 8, 16, ''),
(633, 6, 2, 17, ''),
(634, 6, 3, 17, ''),
(635, 6, 5, 17, ''),
(636, 6, 8, 17, ''),
(637, 6, 2, 18, ''),
(638, 6, 3, 18, ''),
(639, 6, 5, 18, ''),
(640, 6, 8, 18, ''),
(641, 7, 2, 1, ''),
(642, 7, 4, 1, ''),
(643, 7, 2, 14, ''),
(644, 7, 4, 14, ''),
(645, 7, 2, 15, ''),
(646, 7, 4, 15, ''),
(647, 7, 2, 16, ''),
(648, 7, 4, 16, ''),
(649, 7, 2, 17, ''),
(650, 7, 4, 17, ''),
(651, 7, 2, 18, ''),
(652, 7, 4, 18, ''),
(653, 7, 2, 8, '50'),
(654, 7, 4, 8, '10');

-- --------------------------------------------------------

--
-- Structure de la table `muscu_zone`
--

CREATE TABLE IF NOT EXISTS `muscu_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `muscle` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `muscu_zone`
--

INSERT INTO `muscu_zone` (`id`, `nom`, `muscle`) VALUES
(1, 'zone1', 'Pectoraux, Rotateurs internes à l''épaule'),
(2, 'zone2', 'Abdominaux'),
(3, 'zone3', 'Deltoide lateral, deltoide anterieure'),
(4, 'zone4', 'Bicep brachial, brachial anterieure'),
(0, '', ''),
(5, 'zone5', 'Fléchisseur de la main'),
(6, 'zone6', 'Extenseur de la main'),
(7, 'zone7', 'Fléchisseurs de la tête, fléchisseurs latéraux de la tête'),
(8, 'zone8', 'Fléchisseur du pied'),
(9, 'zone9', 'Quadriceps, adducteur de la cuisse, psoas-iliaque'),
(10, 'zone10', 'Extenseurs de la tête'),
(11, 'zone11', 'Deltoide posterieure'),
(12, 'zone12', 'Triceps brachial'),
(13, 'zone13', 'Grand Dorsal, Trapeze, Rotateurs externes de l épaule'),
(14, 'zone14', 'Région lombaire'),
(15, 'zone15', 'Fessier'),
(16, 'zone16', 'Ischio-jambier'),
(17, 'zone17', 'Triceps sural, Soleaire');

-- --------------------------------------------------------

--
-- Structure de la table `organigramme_personne`
--

CREATE TABLE IF NOT EXISTS `organigramme_personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `fonction` int(3) unsigned zerofill NOT NULL,
  `ordre` int(2) NOT NULL DEFAULT '0',
  `creat_by` int(11) NOT NULL,
  `creat_on` int(11) NOT NULL,
  `edit_by` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fonction` (`fonction`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `organigramme_personne`
--

INSERT INTO `organigramme_personne` (`id`, `nom`, `prenom`, `email`, `telephone`, `fonction`, `ordre`, `creat_by`, `creat_on`, `edit_by`, `edit_on`, `site_id`) VALUES
(1, 'Directeur', 'ahah', 'sdfsdf@sdfdf.fd', '02154556', 001, 0, 1, 1352469337, 1, 1353271076, 5),
(7, 'entrainteur', '01', '', '', 003, 0, 1, 1352483272, 1, 1352483272, 0),
(8, 'entrainteur', '02', '', '', 003, 0, 1, 1352483311, 1, 1352483311, 0),
(4, 'Directeur', 'ahah', 'sdfsdf@sdfdf.fd', '02154556', 002, 0, 1, 1352469436, 1, 1352477202, 0),
(9, 'responsable', 'muscu', '', '', 005, 0, 1, 1352485232, 1, 1352485232, 0),
(10, 'prepareteur', 'physique', '', '', 004, 0, 1, 1352485251, 1, 1352485251, 0),
(11, 'coordinateur', 'medicale', '', '', 006, 0, 1, 1352485275, 1, 1352485275, 0),
(12, 'kine', '01', '', '', 007, 0, 1, 1352485869, 1, 1352485869, 0),
(13, 'kine', '02', '', '', 007, 0, 1, 1352485883, 1, 1352485883, 0),
(14, 'medecin', '01', '', '', 008, 0, 1, 1352485906, 1, 1352486161, 0),
(15, 'Diete', '01', '', '', 009, 0, 1, 1352486176, 1, 1352486176, 0),
(16, 'psy', '01', '', '', 010, 0, 1, 1352486609, 1, 1352486609, 0),
(17, 'podo', '01', '', '', 011, 0, 1, 1352486622, 1, 1352486622, 0),
(18, 'den', 'tiste', '', '', 012, 0, 1, 1352486876, 1, 1352486876, 0),
(19, 'sui', 'scolaire', '', '', 013, 0, 1, 1352486888, 1, 1352486888, 0);

-- --------------------------------------------------------

--
-- Structure de la table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL COMMENT 'p : pere // m : mere',
  `nom` varchar(150) DEFAULT NULL,
  `prenom` varchar(150) DEFAULT NULL,
  `adresse` text,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `portable` varchar(45) DEFAULT NULL,
  `telephone_pro` varchar(45) DEFAULT NULL,
  `emploi` text,
  `joueur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_tparent_joueur_id` (`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `parent`
--

INSERT INTO `parent` (`id`, `type`, `nom`, `prenom`, `adresse`, `code_postal`, `ville`, `telephone`, `portable`, `telephone_pro`, `emploi`, `joueur_id`) VALUES
(1, 'p', 'Bonnet', 'David', '8 allée du maine', '18000', 'Bourges', '0248210079', '', '', 'Gerant tabac', 1),
(2, 'm', 'Drouche', 'Pascale', '8 allée du maine', '18000', 'Bourges', '0248210079', '', '', 'gerant nana', 1),
(3, 'm', 'Drouche', 'Pascale', 'Allée du maine', '18000', 'Bourges', '0248210079', '0616797370', '', 'Gerant', 2),
(6, 'p', 'sdfsdf', 'sdf', 'hfghfg', '14562', 'dfgfdg', '0248210079', '', '', '', 3),
(7, 'm', 'test', 'test', 'fdsmdlsqmdqmslù', '18000', 'BOURGES', '0248210079', '', '', '', 2),
(8, 'm', 'maman m', 'de romain m', 'kKDMQLKDQ', '18000', 'Bourges', '', '', '', '', 22);

-- --------------------------------------------------------

--
-- Structure de la table `programmation`
--

CREATE TABLE IF NOT EXISTS `programmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_prog` date DEFAULT NULL,
  `moment_jour` int(2) DEFAULT NULL COMMENT '1:?, 2:matin, 3: aprem midi, 4: ?',
  `journee_entiere` int(1) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `description` text,
  `creat_by` int(11) DEFAULT NULL,
  `creat_on` int(11) DEFAULT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_on` int(11) DEFAULT NULL,
  `equipe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Contenu de la table `programmation`
--

INSERT INTO `programmation` (`id`, `date_prog`, `moment_jour`, `journee_entiere`, `type`, `description`, `creat_by`, `creat_on`, `edit_by`, `edit_on`, `equipe_id`) VALUES
(1, '2012-11-27', 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2012-11-27', 3, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2012-11-30', 2, 0, 4, 'fsfsdfsd', NULL, NULL, NULL, NULL, NULL),
(10, '2012-11-30', 2, 0, 4, 'fsfsdfsd', NULL, NULL, NULL, NULL, NULL),
(11, '2012-11-30', 3, 0, 3, 'hkhjkjh', NULL, NULL, NULL, NULL, NULL),
(13, '2012-12-31', 2, 0, 4, 'fsdfsd  fdsfsd sd fsdsfd', NULL, NULL, 1, 1354461685, NULL),
(14, '2012-12-31', 3, 0, 2, 'fsdfsd  fdsfsd sd fsdsfd fsdfsd  fdsfsd sd fsdsfd fsdfsd  fdsfsd sd fsdsfd fsdfsd  fdsfsd sd fsdsfd', NULL, NULL, 1, 1354461704, NULL),
(17, '2012-11-28', 3, 0, 1, 'un description et passage en soin', NULL, NULL, 1, 1354278518, NULL),
(18, '2012-11-26', 2, 0, 4, '', NULL, NULL, NULL, NULL, NULL),
(19, '2012-11-26', 3, 0, 4, '', NULL, NULL, NULL, NULL, NULL),
(20, '2012-11-28', 2, 0, 4, '', NULL, NULL, NULL, NULL, NULL),
(22, '2012-11-05', 2, 0, 2, '', NULL, NULL, NULL, NULL, NULL),
(23, '2012-11-19', 2, 0, 4, 'jhggjh', NULL, NULL, NULL, NULL, NULL),
(24, '2012-11-12', 3, 0, 2, 'ghgh', NULL, NULL, NULL, NULL, NULL),
(25, '2012-12-01', 2, 0, 2, '', NULL, NULL, NULL, NULL, NULL),
(26, '2012-12-19', 2, 1, 4, '', NULL, NULL, NULL, NULL, NULL),
(27, '2012-12-19', 3, 1, 4, '', NULL, NULL, NULL, NULL, NULL),
(28, '2012-12-21', 2, 1, 3, '', NULL, NULL, NULL, NULL, NULL),
(29, '2012-12-21', 3, 1, 3, '', NULL, NULL, NULL, NULL, NULL),
(30, '2012-12-20', 2, 1, 4, '', NULL, NULL, NULL, NULL, NULL),
(31, '2012-12-20', 3, 1, 4, '', NULL, NULL, NULL, NULL, NULL),
(32, '2012-12-26', 2, 0, 3, '', NULL, NULL, NULL, NULL, NULL),
(33, '2013-01-02', 3, 0, 3, 'description', NULL, NULL, 1, 1358802234, 3),
(34, '2013-02-01', 2, 0, 2, '', NULL, NULL, NULL, NULL, 0),
(35, '2013-02-09', 3, 0, 4, '', NULL, NULL, NULL, NULL, 3),
(36, '2013-02-02', 3, 0, 3, '', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `programmation_type`
--

CREATE TABLE IF NOT EXISTS `programmation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `couleur` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `programmation_type`
--

INSERT INTO `programmation_type` (`id`, `nom`, `couleur`) VALUES
(1, 'Soin', '#44C4FF'),
(2, 'leger', '#97FF3D'),
(3, 'Moyen', '#FF9742'),
(4, 'Intense', '#DD0400');

-- --------------------------------------------------------

--
-- Structure de la table `projet_formation`
--

CREATE TABLE IF NOT EXISTS `projet_formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  `year` int(1) NOT NULL,
  `terme` int(1) NOT NULL,
  `intitule` varchar(200) NOT NULL,
  `observation` text NOT NULL,
  `projection_cycle` text NOT NULL,
  `creat_on` int(15) NOT NULL,
  `edit_on` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `projet_formation`
--

INSERT INTO `projet_formation` (`id`, `joueur_id`, `auteur_id`, `year`, `terme`, `intitule`, `observation`, `projection_cycle`, `creat_on`, `edit_on`) VALUES
(1, 1, 0, 1, 1, 'apprentissage', 'apprentissage\r\napprentissage\r\napprentissage\r\nModification', 'apprentissage\r\napprentissage\r\napprentissage\r\napprentissage\r\napprentissage\r\nModification\r\nModification\r\nModification\r\nModification', 1351805877, 1351852495),
(3, 1, 0, 1, 1, 'apprentissage', 'apprentissage\r\napprentissage\r\napprentissage\r\nModification', 'apprentissage\r\napprentissage\r\napprentissage\r\napprentissage\r\napprentissage\r\nModification\r\nModification\r\nModification', 1351805877, 1351852395),
(4, 2, 0, 1, 2, 'hgjhjgj', 'ghjghjg', 'ghjghg', 1366004566, 1366004566);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `reply_choice` text NOT NULL,
  `multi_reply` int(1) NOT NULL DEFAULT '0',
  `questionnaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `question`, `reply_choice`, `multi_reply`, `questionnaire_id`) VALUES
(1, 'Ma question', '', 0, 1),
(2, 'Ma question 2', 'chx1;chx2;', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE IF NOT EXISTS `questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text,
  `creat_by` int(11) NOT NULL,
  `date_creat` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `name`, `description`, `creat_by`, `date_creat`) VALUES
(1, 'Questionnaire 1', 'Ma super description', 1, 1347913462);

-- --------------------------------------------------------

--
-- Structure de la table `rugby_match`
--

CREATE TABLE IF NOT EXISTS `rugby_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_date` int(11) DEFAULT NULL,
  `equipe_a` varchar(50) DEFAULT NULL,
  `equipe_b` varchar(50) DEFAULT NULL,
  `score_a` int(4) DEFAULT NULL,
  `score_b` int(4) DEFAULT NULL,
  `commentaire` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `rugby_match`
--

INSERT INTO `rugby_match` (`id`, `m_date`, `equipe_a`, `equipe_b`, `score_a`, `score_b`, `commentaire`) VALUES
(1, 1349827200, 'BOURGES XV', 'SANCERRE', 30, 25, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rugby_match_joueur`
--

CREATE TABLE IF NOT EXISTS `rugby_match_joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) DEFAULT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  `equipe` varchar(1) DEFAULT NULL,
  `temps_jeu` int(4) DEFAULT NULL,
  `poste` text,
  `points` int(4) DEFAULT NULL,
  `commentaire` text,
  PRIMARY KEY (`id`),
  KEY `rmj_joueur` (`joueur_id`),
  KEY `rmj_match` (`match_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `rugby_match_joueur`
--

INSERT INTO `rugby_match_joueur` (`id`, `match_id`, `joueur_id`, `equipe`, `temps_jeu`, `poste`, `points`, `commentaire`) VALUES
(1, 1, 1, 'A', 80, '9', 5, 'Bon match'),
(2, 1, 4, 'A', 80, '15', 0, 'Bon match manque endurance sur la fin');

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE IF NOT EXISTS `saison` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique',
  `name` varchar(100) NOT NULL COMMENT 'Nom de la saison',
  `date_start` date NOT NULL COMMENT 'Date de debut de la saison',
  `date_end` date NOT NULL COMMENT 'Date de fin de la saison',
  `add_by` int(11) DEFAULT NULL COMMENT 'Utilisateur qui a ajoute la saison dans la base',
  `add_on` date DEFAULT NULL COMMENT 'Date d ajout de la saison dans la base',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Table contenant les saisons' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `saison`
--

INSERT INTO `saison` (`id`, `name`, `date_start`, `date_end`, `add_by`, `add_on`) VALUES
(1, '2012-2013', '2012-08-01', '2013-07-31', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_bfs`
--

CREATE TABLE IF NOT EXISTS `scolaire_bfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formation_id` int(11) DEFAULT NULL,
  `sportif_id` int(11) DEFAULT NULL,
  `annee` varchar(9) DEFAULT NULL,
  `date_bfs` date DEFAULT NULL,
  `attendu` text,
  `modifie` text,
  `resultat` text,
  `remarque` text,
  `avis_equipe_peda` text,
  `add_by` int(11) DEFAULT NULL,
  `add_on` int(11) DEFAULT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sbfs_sportif` (`sportif_id`),
  KEY `sbfs_formation` (`formation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Bilan de fin de formation' AUTO_INCREMENT=3 ;

--
-- Contenu de la table `scolaire_bfs`
--

INSERT INTO `scolaire_bfs` (`id`, `formation_id`, `sportif_id`, `annee`, `date_bfs`, `attendu`, `modifie`, `resultat`, `remarque`, `avis_equipe_peda`, `add_by`, `add_on`, `edit_by`, `edit_on`) VALUES
(2, 3, 1, '2012/2013', '2012-12-11', '', '', '', '', '', 1, 1356456561, 1, 1356456947);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_bfs_note`
--

CREATE TABLE IF NOT EXISTS `scolaire_bfs_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bfs_id` int(11) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL,
  `note` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sbfsnote_bfs` (`bfs_id`),
  KEY `sbfsnote_mat` (`matiere_id`),
  KEY `sbfsnote_bfsmat` (`bfs_id`,`matiere_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='note du bilan de fin de saison' AUTO_INCREMENT=25 ;

--
-- Contenu de la table `scolaire_bfs_note`
--

INSERT INTO `scolaire_bfs_note` (`id`, `bfs_id`, `matiere_id`, `note`) VALUES
(24, 2, 6, 4),
(23, 2, 2, 5),
(22, 2, 5, 6),
(21, 2, 1, 7),
(20, 2, 4, 8),
(19, 2, 3, 9);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_boc`
--

CREATE TABLE IF NOT EXISTS `scolaire_boc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sportif_id` int(11) NOT NULL,
  `formation_id` int(11) DEFAULT '0',
  `diplome_obtenu` text,
  `formation_effectuee` text,
  `objectif_stagiaire` text,
  `experience_pro` text NOT NULL,
  `remarque` text,
  `avis_equipe_peda` text,
  `add_by` int(11) DEFAULT NULL,
  `add_on` int(11) DEFAULT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_on` int(11) DEFAULT NULL,
  `annee` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sc_sportif` (`sportif_id`),
  KEY `sc_formation` (`formation_id`),
  KEY `sc_sportif_formation` (`sportif_id`,`formation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Table contenant les bilan d orientation	' AUTO_INCREMENT=10 ;

--
-- Contenu de la table `scolaire_boc`
--

INSERT INTO `scolaire_boc` (`id`, `sportif_id`, `formation_id`, `diplome_obtenu`, `formation_effectuee`, `objectif_stagiaire`, `experience_pro`, `remarque`, `avis_equipe_peda`, `add_by`, `add_on`, `edit_by`, `edit_on`, `annee`) VALUES
(1, 0, 3, 'Brevet des collegie', 'aucune', 'Devenir prof de sport', '', '', 'Vu le niveau scolaire cela risque d etre difficile', 1, 1356258094, 1, 1356258094, '2012/2013'),
(3, 1, 3, 'Brevet des collegie', 'aucune', 'Devenir prof de sport', '', 'remarque', 'Vu le niveau scolaire cela risque d etre difficile', 1, 1356258094, 1, 1356366032, '2012/2013'),
(5, 1, 3, '', '', '', '', '', '', 1, 1356454689, 1, 1356454689, '2012/2013'),
(6, 1, 4, '', '', '', '', '', '', 1, 1356454721, 1, 1356454721, '2013/2014'),
(7, 1, 3, '', '', '', '', '', '', 1, 1356454767, 1, 1356454767, '2014/2015'),
(8, 1, 3, 'diplome', 'formation', 'objectif', '', 'Remarque', 'avis', 1, 1356455363, 1, 1356455363, '2015/2016'),
(9, 1, 3, 'diplome', 'formation', 'objectif', 'experience pro', 'Remarque', 'avis', 1, 1356455363, 1, 1356519011, '2015/2016');

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_boc_note`
--

CREATE TABLE IF NOT EXISTS `scolaire_boc_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boc_id` int(11) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL,
  `note` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sbocnote_boc` (`boc_id`),
  KEY `sbocnote_mat` (`matiere_id`),
  KEY `sbocnote_bocmat` (`boc_id`,`matiere_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='note du bilan de competence' AUTO_INCREMENT=17 ;

--
-- Contenu de la table `scolaire_boc_note`
--

INSERT INTO `scolaire_boc_note` (`id`, `boc_id`, `matiere_id`, `note`) VALUES
(1, 8, 3, 5),
(16, 9, 2, 8),
(15, 9, 5, 2),
(14, 9, 1, 5),
(13, 9, 4, 3),
(12, 9, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_dpp`
--

CREATE TABLE IF NOT EXISTS `scolaire_dpp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sportif_id` int(11) DEFAULT NULL,
  `formation_id_current` int(11) DEFAULT NULL,
  `date_dpp` date DEFAULT NULL,
  `personne_cf_1` int(11) DEFAULT NULL,
  `personne_cf_2` int(11) DEFAULT NULL,
  `personne_cf_3` int(11) DEFAULT NULL,
  `personne_conseil_ped` text,
  `diplome_obtenu` text,
  `formation_effectuee` text,
  `definition_projet` text,
  `objectif_plan_formation` text,
  `plan_n0` text,
  `plan_n1` text,
  `add_on` int(11) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `edit_on` int(11) DEFAULT NULL,
  `edit_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sdpp_formation` (`formation_id_current`),
  KEY `sdpp_sportif` (`sportif_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Definition du projet pro' AUTO_INCREMENT=3 ;

--
-- Contenu de la table `scolaire_dpp`
--

INSERT INTO `scolaire_dpp` (`id`, `sportif_id`, `formation_id_current`, `date_dpp`, `personne_cf_1`, `personne_cf_2`, `personne_cf_3`, `personne_conseil_ped`, `diplome_obtenu`, `formation_effectuee`, `definition_projet`, `objectif_plan_formation`, `plan_n0`, `plan_n1`, `add_on`, `add_by`, `edit_on`, `edit_by`) VALUES
(2, 1, 3, '2012-09-01', 19, 1, 15, 'qsdsqdqsd modif', 'jgjgjgg modif', 'pouiouio modif', 'uiouiouio modif', 'yiyirthggfhh modif', 'fhfhfhfghf modif', 'ezttreter modif', NULL, NULL, 1356364105, 1);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_formation`
--

CREATE TABLE IF NOT EXISTS `scolaire_formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sportif_id` int(11) DEFAULT NULL,
  `etablissement_id` int(11) DEFAULT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `description` text,
  `duree` int(3) DEFAULT NULL,
  `resultat` int(1) DEFAULT '0' COMMENT '0 = en cours\\n1 = ok\\n2 = echec',
  `bilan` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `timestamp_debut` int(11) DEFAULT NULL,
  `timestamp_fin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sf_sportif` (`sportif_id`),
  KEY `sf_etablissement` (`etablissement_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Table contenant les informations sur les formations des sportifs' AUTO_INCREMENT=6 ;

--
-- Contenu de la table `scolaire_formation`
--

INSERT INTO `scolaire_formation` (`id`, `sportif_id`, `etablissement_id`, `nom`, `description`, `duree`, `resultat`, `bilan`, `date_debut`, `date_fin`, `timestamp_debut`, `timestamp_fin`) VALUES
(3, 1, NULL, 'bp geps', 'equivalence bac', 2, 0, '', '2012-09-01', '2014-06-30', 1346457600, 1404086400),
(4, 1, NULL, 'bp geps', 'equivalence bac', 2, 0, '', '2012-09-01', '2014-06-30', 1346457600, 1404086400),
(5, 1, 2, 'bp geps', 'equivalence bac', 2, 1, 'sdqdqsdq', '2012-09-01', '2014-06-30', 1346457600, 1404086400);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_suivi`
--

CREATE TABLE IF NOT EXISTS `scolaire_suivi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trimestre_id` int(11) NOT NULL,
  `sportif_id` int(11) DEFAULT NULL,
  `date_suivi` date DEFAULT NULL,
  `timestamp_suivi` int(11) DEFAULT NULL,
  `observation_structure` text,
  `observation_etablissement` text,
  `remarque` text,
  `add_by` int(11) DEFAULT NULL,
  `add_on` int(11) DEFAULT NULL,
  `edit_by` int(11) DEFAULT NULL,
  `edit_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ss_sportif` (`sportif_id`),
  KEY `ss_add` (`add_by`),
  KEY `ss_edit` (`edit_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `scolaire_suivi`
--

INSERT INTO `scolaire_suivi` (`id`, `trimestre_id`, `sportif_id`, `date_suivi`, `timestamp_suivi`, `observation_structure`, `observation_etablissement`, `remarque`, `add_by`, `add_on`, `edit_by`, `edit_on`) VALUES
(3, 2, 1, '2013-01-23', 1358899200, 'dfgdfg', 'dfgdfgdfg', 'dfgdfg', 1, 1359108457, 1, 1359108457),
(4, 2, 1, '2013-01-31', 1359590400, 'sdfsf', 'sdfsfsdf', 'sdfsf', 1, 1359108474, 1, 1359108474);

-- --------------------------------------------------------

--
-- Structure de la table `scolaire_trimestre`
--

CREATE TABLE IF NOT EXISTS `scolaire_trimestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joueur_id` int(11) DEFAULT NULL,
  `formation_id` int(11) DEFAULT NULL,
  `trimestre` varchar(200) DEFAULT NULL,
  `observation_etablissement` text,
  `observation_structure` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `scolaire_trimestre`
--

INSERT INTO `scolaire_trimestre` (`id`, `joueur_id`, `formation_id`, `trimestre`, `observation_etablissement`, `observation_structure`) VALUES
(2, 1, NULL, '2|2012-2013', NULL, NULL),
(3, 1, NULL, '3|2012-2013', 'sdfsfsdfsdfsdfsfsdfs\r\nfsdfsdfsdf', 'sdfsdfsdfsdfsdfsd\r\nfsdfsdfsdfsd\r\nfsdfdsfsdf'),
(4, 1, NULL, '1|2013-2014', 'fghfghfghf', 'ghfghfgh'),
(5, 1, 3, '4|2015-2016', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_s` date NOT NULL COMMENT 'date format mysql ',
  `date_timestamp` int(11) NOT NULL COMMENT 'timesptamp jour sequence',
  `semaine` int(2) NOT NULL COMMENT 'numero de la semaine',
  `annee` int(4) NOT NULL COMMENT 'annee sur 4 chiffres',
  `sportif_id` int(11) NOT NULL COMMENT 'Liaison avec la table joueur',
  `numero` int(2) NOT NULL DEFAULT '0' COMMENT 'numero de la sequence dans la semaine',
  `fatigue` int(1) DEFAULT '0' COMMENT 'indice de fatigue',
  `ressentie_entrainement` int(1) DEFAULT '0' COMMENT 'indice ressentie entrainement',
  `entrainement_liaison` varchar(11) DEFAULT NULL COMMENT 'liaison avec les entrainements et la musculation',
  PRIMARY KEY (`id`),
  KEY `s_i_semaine` (`semaine`),
  KEY `s_i_semaineanneesportif` (`semaine`,`annee`,`sportif_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`id`, `date_s`, `date_timestamp`, `semaine`, `annee`, `sportif_id`, `numero`, `fatigue`, `ressentie_entrainement`, `entrainement_liaison`) VALUES
(7, '2012-11-27', 1353974400, 48, 2012, 2, 3, 1, 1, NULL),
(6, '2012-11-26', 1353888000, 48, 2012, 2, 2, 2, 1, NULL),
(5, '2012-11-26', 1353888000, 48, 2012, 2, 1, 2, 3, NULL),
(8, '2012-11-27', 1353974400, 48, 2012, 2, 4, 2, 1, NULL),
(9, '2012-12-19', 1355875200, 51, 2012, 2, 1, 2, 2, NULL),
(10, '2012-12-17', 1355702400, 51, 2012, 2, 2, 2, 3, NULL),
(11, '2012-12-03', 1354492800, 49, 2012, 2, 1, 2, 2, 'm13'),
(12, '2013-01-07', 1357516800, 2, 2013, 2, 1, 7, 9, NULL),
(13, '2013-01-07', 1357516800, 2, 2013, 2, 2, 6, 10, NULL),
(14, '2013-01-08', 1357603200, 2, 2013, 2, 3, 7, 7, NULL),
(15, '2013-01-14', 1358121600, 3, 2013, 2, 1, 7, 7, 'e10');

-- --------------------------------------------------------

--
-- Structure de la table `sequence_note_entraineur`
--

CREATE TABLE IF NOT EXISTS `sequence_note_entraineur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_sne_sequence` (`sequence_id`),
  KEY `i_sne_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `sequence_note_entraineur`
--

INSERT INTO `sequence_note_entraineur` (`id`, `sequence_id`, `user_id`, `note`) VALUES
(1, 5, 1, 3),
(2, 6, 1, 2),
(3, 5, 1, 2),
(4, 7, 1, 1),
(5, 8, 1, 1),
(6, 11, 1, 3),
(7, 9, 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ip` varchar(50) CHARACTER SET latin1 NOT NULL,
  `create_on` int(11) NOT NULL,
  `last_used` int(11) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip`, `create_on`, `last_used`) VALUES
('3231abf706caa38d601aeaa652878c50', 'Visiteur', '127.0.0.1', 1370323768, 1370323770),
('b5066c0adcadb89a16d7fe5b915052cb', '1', '127.0.0.1', 1370323770, 1370325396),
('86678515b91ec8589cdf94bf6f692c08', 'Visiteur', '127.0.0.1', 1370323770, 1370323770);

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `adresse` text NOT NULL,
  `code_postal` varchar(30) NOT NULL,
  `ville` varchar(200) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `site`
--

INSERT INTO `site` (`id`, `nom`, `adresse`, `code_postal`, `ville`, `telephone`) VALUES
(6, 'Cerf Tours', '', '37000', 'Tours', ''),
(7, 'Cerf Orleans', '', '45000', 'Orleans', ''),
(5, 'Cerf Bourges', 'rue des lilas', '18000', 'BOURGES', '0248203040');

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

CREATE TABLE IF NOT EXISTS `structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) DEFAULT NULL,
  `adresse` tinytext,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `structure`
--

INSERT INTO `structure` (`id`, `nom`, `adresse`, `code_postal`, `ville`, `telephone`, `email`) VALUES
(1, 'Bourges XV', 'rue de seraucourt', '18000', 'Bourges', '', NULL),
(2, 'Test modification', 'Modification adresse', '18000', 'BOURGES', '0248484848', NULL),
(3, 'dqsdqsd', 'qsdqsdqsdqsd', '18230', 'St Doulchard', '', NULL),
(4, 'dqsdqsd', 'qsdqsdqsdqsd', '18230', 'St Doulchard', '', NULL),
(5, 'jhkjhkhjkjhk', 'jhkhjkjhk', '18000', 'BOURGES', '', NULL),
(9, 'sdfsdfsdfsd', 'fsdfsdfsdfsdf', '36000', 'CHATEAUROUX', '', NULL),
(10, 'sdfsdfsdfsd', 'fsdfsdfsdfsdf', '36000', 'CHATEAUROUX', '', NULL),
(11, 'sdfsdfsdfsd', 'fsdfsdfsdfsdf', '36000', 'CHATEAUROUX', '', NULL),
(12, 'sdfsdfsdfsd', 'fsdfsdfsdfsdf', '36000', 'CHATEAUROUX', '', NULL),
(13, 'TEST S', 'TEST ADRESSE', '18000', 'BOURGES', '0248210079', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_test` int(11) NOT NULL,
  `creat_by` int(11) NOT NULL,
  `creat_on` int(11) NOT NULL,
  `edit_by` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `test`
--

INSERT INTO `test` (`id`, `date_test`, `creat_by`, `creat_on`, `edit_by`, `edit_on`) VALUES
(1, 1351728000, 0, 0, 0, 0),
(2, 1346457600, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `test_exercices`
--

CREATE TABLE IF NOT EXISTS `test_exercices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `unite` varchar(6) NOT NULL,
  `progression` int(1) NOT NULL,
  `date_add` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `test_exercices`
--

INSERT INTO `test_exercices` (`id`, `nom`, `description`, `unite`, `progression`, `date_add`) VALUES
(1, '50 metres', '', 'sec', 1, 1351784174),
(2, '100 metres', '', 'sec', 1, 1351784187);

-- --------------------------------------------------------

--
-- Structure de la table `test_joueur`
--

CREATE TABLE IF NOT EXISTS `test_joueur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `joueur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_joueur_id` (`test_id`,`joueur_id`),
  KEY `test_id` (`test_id`),
  KEY `joueur_id` (`joueur_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Liaison entre le test et le joueur' AUTO_INCREMENT=9 ;

--
-- Contenu de la table `test_joueur`
--

INSERT INTO `test_joueur` (`id`, `test_id`, `joueur_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(8, 2, 4),
(7, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `test_resultat`
--

CREATE TABLE IF NOT EXISTS `test_resultat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  `joueur_id` int(11) NOT NULL,
  `resultat` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `test_resultat`
--

INSERT INTO `test_resultat` (`id`, `test_id`, `exercice_id`, `joueur_id`, `resultat`) VALUES
(1, 1, 1, 1, '7'),
(2, 1, 2, 1, '12'),
(3, 1, 1, 2, '8'),
(4, 1, 2, 2, '15'),
(5, 2, 1, 1, '8'),
(6, 2, 2, 1, '16'),
(14, 2, 2, 4, '1'),
(13, 2, 1, 4, '50'),
(11, 2, 1, 3, '9'),
(12, 2, 2, 3, '14');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(150) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `last_connexion` int(11) DEFAULT NULL,
  `actif` int(1) DEFAULT '1',
  `type` varchar(15) DEFAULT NULL COMMENT 'admin;medic;joueur;parent',
  `id_liaison` int(11) DEFAULT NULL,
  `suivi_medical_show_prive` tinyint(1) NOT NULL,
  `widget_index_alerte` int(1) NOT NULL DEFAULT '0',
  `suivi_medical_add_commentaire` int(11) NOT NULL DEFAULT '0',
  `widget_index_rss` int(1) DEFAULT '0',
  `flux_rss_1` varchar(255) DEFAULT NULL,
  `flux_rss_2` varchar(255) DEFAULT NULL,
  `joueur_trombi` int(1) NOT NULL DEFAULT '0',
  `email` varchar(250) DEFAULT NULL,
  `register_on` int(15) NOT NULL,
  `index_trombi` int(1) NOT NULL DEFAULT '0',
  `widget_index_blessure` int(1) NOT NULL DEFAULT '0',
  `gmail_adr` varchar(250) DEFAULT NULL,
  `gmail_password` varchar(250) DEFAULT NULL,
  `gmail_id_prv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifiant` (`identifiant`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `identifiant`, `password`, `last_connexion`, `actif`, `type`, `id_liaison`, `suivi_medical_show_prive`, `widget_index_alerte`, `suivi_medical_add_commentaire`, `widget_index_rss`, `flux_rss_1`, `flux_rss_2`, `joueur_trombi`, `email`, `register_on`, `index_trombi`, `widget_index_blessure`, `gmail_adr`, `gmail_password`, `gmail_id_prv`) VALUES
(1, 'admin', '57523434ff2530da7303ce87d4bfce1a204b2470', 1370323770, 1, 'admin', NULL, 1, 1, 1, 1, 'http://www.lerugbynistere.fr/rss.php', '', 1, 'w.shark@hotmail.fr', 0, 1, 1, 'w.shark@hotmail.fr', 'romain1986', 'private-edc5131a358187fa9f93ba7d2f2c8b4c'),
(5, 'mjourdaine', 'ea739d6c860b699af95ed4a38f54e68c4a5f1a4c', NULL, 1, 'admin', NULL, 1, 1, 1, 0, NULL, NULL, 0, NULL, 0, 0, 0, NULL, NULL, NULL),
(8, 'chrom', 'caabea41fe2a0af413df1a7cec7f14597f7ecbc4', 1353949832, 1, 'admin', NULL, 0, 1, 0, 1, 'http://www.lerugbynistere.fr/rss.php', 'http://www.lerugbynistere.fr/rss.php', 0, '', 1349625224, 1, 1, NULL, NULL, NULL),
(9, 'medic', '980b152e63b69d455d5e44f8e71c267ec840e35b', 1350050417, 1, 'medic', NULL, 0, 0, 0, NULL, NULL, NULL, 0, '', 1350050394, 0, 0, NULL, NULL, NULL),
(10, 'rdrouche', '14366645c9b8d7f66d91e18e4ab2127e5d4e191d', 1358803193, 1, 'joueur', 2, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, NULL, 52, 0, 0, '', '', ''),
(12, 'test', '24b5dca585b6a3d11723f2a24af5e31e0ff8f895', 1350421423, 1, 'joueur', 1, 0, 0, 0, NULL, NULL, NULL, 0, '', 1350421399, 0, 0, NULL, NULL, NULL),
(21, 'fghftesthfghfghfgh', '7a2ed5e0956bf48f8642d95f0d8e83a9ee51246c', 1, 1, 'joueur', 16, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, '', 1354893065, 0, 0, NULL, NULL, NULL),
(20, 'fghtesthfghfghfgh', '011bd92852e08aa067eb2d2ecfe1d5e0e437344b', 1, 1, 'joueur', 15, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, '', 1354893060, 0, 0, NULL, NULL, NULL),
(19, 'fgtesthfghfghfgh', '6bac2e78edcd8a409e9f19c3260903b2fd80e016', 1, 1, 'joueur', 14, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, '', 1354893057, 0, 0, NULL, NULL, NULL),
(18, 'ftesthfghfghfgh', 'ef82435abb3fb243442f8bbf5351944128744bfb', 1, 1, 'joueur', 13, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, '', 1354893051, 0, 0, NULL, NULL, NULL),
(22, 'fghfgtesthfghfghfgh', '56d216b1b3a4f6cd602edd22483f21706caacf72', 1, 1, 'joueur', 17, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, '', 1354893164, 0, 0, NULL, NULL, NULL),
(23, 'hdqds', 'af65ce4cd5f0611f60da5c373c63de88b7ad00b4', 1, 1, 'joueur', 7, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, 'dqdqs@sqds.ds', 1354895079, 0, 0, NULL, NULL, NULL),
(24, 'ttest', 'ee95f79e97287ed4644a8beaee3c04024567f61c', 1, 1, 'joueur', 8, 0, 0, 0, 1, 'http://www.lerugbynistere.fr/rss.php', '', 0, '', 1356435542, 0, 0, NULL, NULL, NULL),
(25, 'testtest', '0555077fc280bb1cabfb2f4ab26742b68941a704', 0, 1, 'admin', NULL, 1, 0, 1, NULL, NULL, NULL, 0, 'TESTTEST@TEST.FR', 1361229684, 0, 0, NULL, NULL, NULL),
(26, 'kfjslkfjskldjfl', '908d478ac14684104c1b160bc97166f9c5d80cba', 0, 1, 'admin', NULL, 1, 0, 1, NULL, NULL, NULL, 0, 'sdqkldqlkdqskmlkdqm@ksskljd.fd', 1361229755, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `view_template`
--

CREATE TABLE IF NOT EXISTS `view_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `real_dir` varchar(150) NOT NULL,
  `tpl` text NOT NULL,
  `creat_on` int(11) NOT NULL,
  `edit_on` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
