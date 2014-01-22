<?php
/**
 * Script mise a jour juin
 */

$registry->cache->remove('config');

# Suppression du cache
$version = '2013060101';

# Mise a jour de la version directement
$registry->db->exec(' UPDATE '. PREFIX . 'config SET valeur = "'. $version .'" WHERE cle = "version"');

# Suppression du cache
$registry->cache->remove('config');

# Creation du dossier log de mise a jour
@mkdir( ROOT_PATH . 'log' . DS . 'update' );

WriteInFileUpdate("Debut de la mise a jour ...\r\n");
WriteInFileUpdate("Version : " . $version . "\r\n");
WriteInFileUpdate("Creation du dossier pour stocker les logs\r\n");

# Requetes a effectuees
$queries = array();

$queries[] = "ALTER TABLE `match_rugby` ADD COLUMN `eq_touche` INT NULL  AFTER `observation` , ADD COLUMN `eq_melee` INT NULL  AFTER `eq_touche` , ADD COLUMN `eq_penalite` INT NULL  AFTER `eq_melee` , ADD COLUMN `eq_ruck` INT NULL  AFTER `eq_penalite` , ADD COLUMN `eq_cp_envoie` INT NULL  AFTER `eq_ruck` , ADD COLUMN `eq_bc` INT NULL  AFTER `eq_cp_envoie` , ADD COLUMN `eq_franchissement` INT NULL  AFTER `eq_bc` , ADD COLUMN `ad_touche` INT NULL  AFTER `eq_franchissement` , ADD COLUMN `ad_melee` INT NULL  AFTER `ad_touche` , ADD COLUMN `ad_penalite` INT NULL  AFTER `ad_melee` , ADD COLUMN `ad_ruck` INT NULL  AFTER `ad_penalite` , ADD COLUMN `ad_cp_envoie` INT NULL  AFTER `ad_ruck` , ADD COLUMN `ad_bc` INT NULL  AFTER `ad_cp_envoie` , ADD COLUMN `ad_franchissement` INT NULL  AFTER `ad_bc` ;";

$queries[] = "ALTER TABLE `match_rugby_joueur` ADD COLUMN `passes` INT NULL  AFTER `observation` , ADD COLUMN `plaquage` INT NULL  AFTER `passes` , ADD COLUMN `enavant` INT NULL  AFTER `plaquage` ;";

$queries[] = "CREATE  TABLE `saison` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique' ,
  `name` VARCHAR(100) NOT NULL COMMENT 'Nom de la saison' ,
  `date_start` DATE NOT NULL COMMENT 'Date de debut de la saison' ,
  `date_end` DATE NOT NULL COMMENT 'Date de fin de la saison' ,
  `add_by` INT NULL COMMENT 'Utilisateur qui a ajoute la saison dans la base' ,
  `add_on` DATE NULL COMMENT 'Date d ajout de la saison dans la base' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
COMMENT = 'Table contenant les saisons';";

# On met a jour la version
$queries[] = ' UPDATE '. PREFIX . 'config SET valeur = "'. $version .'" WHERE cle = "version"';

foreach( $queries as $k => $query ):

	try{
		$registry->db->exec($query);
	}

	catch (Exception $e){
		WriteInFileUpdate("Erreur sur la requete : ". $query ." #Infos : ". $e->getMessage() ."\r\n");
		exit("ERROR DURING UPDATE ...");
	}
	
	WriteInFileUpdate($query . " #OK\r\n");

endforeach;

WriteInFileUpdate("Mise a jour termine\r\n");

# Suppression du cache
$registry->cache->remove('config');