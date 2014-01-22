<?php


$registry->cache->remove('config');

# Suppression du cache
$version = '2013021802';

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
$Queries = array();

# On passe le site id a null pour eviter un probleme si pas de site
$Queries[] = "ALTER TABLE  `joueur` CHANGE  `site_id`  `site_id` INT( 11 ) NULL DEFAULT  '0'";

# On met a jour la version
$Queries[] = ' UPDATE '. PREFIX . 'config SET valeur = "'. $version .'" WHERE cle = "version"';

foreach( $Queries as $k => $query ):

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