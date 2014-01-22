-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 18 Septembre 2013 à 23:09
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `sport_gestion`
--

-- --------------------------------------------------------

--
-- Structure de la table `changelog`
--

CREATE TABLE IF NOT EXISTS `changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_version` varchar(50) NOT NULL,
  `c_changelog` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `changelog`
--

INSERT INTO `changelog` (`id`, `c_date`, `c_version`, `c_changelog`) VALUES
(1, '2012-11-13 23:00:00', '1.20121114', '- Correction de bug\n- Optimisation des requetes et du traitement des resultats de test physique/musculation\n- Ajout d''un champ dans la table joueur\n- Uniformisation du design dans les vues');

-- --------------------------------------------------------

--
-- Structure de la table `changelogs`
--

CREATE TABLE IF NOT EXISTS `changelogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `numero_version` varchar(30) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `changelogs`
--

INSERT INTO `changelogs` (`id`, `nom`, `description`, `date`, `numero_version`, `type`) VALUES
(1, 'Mise a jour 6 janviers', '<ul>\r\n<li>Modif 1</li>\r\n<li>Modif 2</li>\r\n<li>Modif 3</li>\r\n<li>Modif 4</li>\r\n</ul>', '2013-01-06', '20130106', 'update');

-- --------------------------------------------------------

--
-- Structure de la table `installation`
--

CREATE TABLE IF NOT EXISTS `installation` (
  `id` varchar(50) NOT NULL,
  `i_date_install` int(15) NOT NULL,
  `i_date_expire` int(15) NOT NULL,
  `i_url` varchar(255) NOT NULL,
  `i_in_prod` int(1) NOT NULL DEFAULT '1' COMMENT 'determine si site est en prod ou en dev',
  `i_open` int(1) NOT NULL DEFAULT '1' COMMENT 'bool determine si le site est ouvert ou ferme',
  `i_demo` int(1) NOT NULL DEFAULT '0' COMMENT 'determine si le site est mode demo ou non',
  `limit_user` int(5) NOT NULL DEFAULT '99999' COMMENT 'nb max utilisateur in db',
  `limit_joueur` int(5) NOT NULL DEFAULT '99999' COMMENT 'nb max joueur in db',
  `i_show_pub` int(1) NOT NULL DEFAULT '0',
  `i_show_pub_login` int(1) NOT NULL DEFAULT '0' COMMENT 'Affichage de la pub en page de login',
  `i_type` varchar(50) NOT NULL DEFAULT 'full',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `installation`
--

INSERT INTO `installation` (`id`, `i_date_install`, `i_date_expire`, `i_url`, `i_in_prod`, `i_open`, `i_demo`, `limit_user`, `limit_joueur`, `i_show_pub`, `i_show_pub_login`, `i_type`) VALUES
('507af1bf8c0b3', 1350234559, 1381770559, 'http://chrom-pc/rugby', 0, 1, 0, 99999, 99999, 0, 1, 'light');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_i_id` varchar(50) NOT NULL,
  `m_module` varchar(250) NOT NULL,
  `m_active` int(11) NOT NULL DEFAULT '0',
  `m_name` varchar(100) DEFAULT NULL,
  `m_demo` int(1) NOT NULL DEFAULT '0',
  `m_view_in_menu` int(1) NOT NULL DEFAULT '0',
  `m_admin_module` int(1) NOT NULL DEFAULT '0',
  `m_view_in_fiche` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_i_id` (`fk_i_id`,`m_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `modules`
--

INSERT INTO `modules` (`id`, `fk_i_id`, `m_module`, `m_active`, `m_name`, `m_demo`, `m_view_in_menu`, `m_admin_module`, `m_view_in_fiche`) VALUES
(2, '507af1bf8c0b3', 'form_custom', 1, 'Personnalisation des formulaires', 0, 0, 1, 0),
(3, '507af1bf8c0b3', 'projetFormation', 1, 'Projet formation', 0, 0, 0, 1),
(4, '507af1bf8c0b3', 'matchRugby', 1, 'Match', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pub_code`
--

CREATE TABLE IF NOT EXISTS `pub_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taille` varchar(200) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `pub_code`
--

INSERT INTO `pub_code` (`id`, `taille`, `code`) VALUES
(1, '720x90', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-1710313297381782";\r\n/* 728x90, date de création 31/10/10 */\r\ngoogle_ad_slot = "8894677279";\r\ngoogle_ad_width = 728;\r\ngoogle_ad_height = 90;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>'),
(2, '468x60', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-1710313297381782";\r\n/* carpe 468x60 */\r\ngoogle_ad_slot = "4753583552";\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>'),
(3, '250x250', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-1710313297381782";\r\n/* carpe carre 250 */\r\ngoogle_ad_slot = "3061928018";\r\ngoogle_ad_width = 250;\r\ngoogle_ad_height = 250;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
