<?php

// Verification si ligne existe
$Result = $registry->db->count('sport_gestion.installation', array('id =' => $config['id_install']) );

if( $Result == 0 ) exit('Installation ID not found in DB');

// Recuperation des informations
$InfosInstall = $registry->db->get_one('sport_gestion.installation', array('id =' => $config['id_install']) );

if( $InfosInstall['i_date_expire'] < time() ) exit("Installation expired !!");

// Recuperation des modules actifs
$Modules = $registry->db->get('sport_gestion.modules', array('fk_i_id =' => $config['id_install'], 'm_active =' => 1) );

$config['modules'] = $Modules;

//var_dump($config['modules']);

// TEST SI RECUP PUB GOOGLE
if( $InfosInstall['i_show_pub'] == 1 ||  $InfosInstall['i_show_pub_login'] == 1):
	$InfosInstall['pubs'] = $registry->db->get('sport_gestion.pub_code');
endif;

$registry->infosinstall = $InfosInstall;

if( !isset($config['version']) ):
	# On insere la version dans la base
	$registry->db->insert(PREFIX . 'config', array('cle' => 'version',  'valeur' => $version) );
	$registry->cache->remove('config');
else:
	# Traitement de la mise a jour auto

	# On recupere les fichiers de mise a jour dans un tableau
	$Files = getFilesInDir( ROOT_PATH . 'app' . DS . 'update' . DS . 'sql' . DS );
	
	foreach( $Files as $k => $v ):
		$VersionTest = str_replace('.php', '', $k);

		if( $VersionTest > $config['version'] ):
			# On inclue le fichier qui fait la mise a jour
			require ROOT_PATH . 'app' . DS . 'update' . DS . 'sql' . DS . $VersionTest . '.php';
		endif;

	endforeach;
	
endif;

function WriteInFileUpdate($txt){
	$file_name = date("Y-m-d") .'.log';
	// On verifie si le fichier du jour existe
	$file = ROOT_PATH . 'log' . DS . 'update' . DS . $file_name;

	// On verifie sur le fichier existe
	// Si celui ci n existe pas on le créer
	if( !is_file($file) ){
		$f = fopen($file, 'a+');
		fclose($f);
	}

	// On stock l ancien contenu du fichier
	$ancien_contenu = @file($file);

	// On ajoute la nouvelle ligne au debut du tableau
	@array_unshift($ancien_contenu,$txt);

	// ressort les lignes du tableau
    $nouveau_contenu = @join('',$ancien_contenu);
    $fp = @fopen($file,'w');
    // ecrit la chaine dans le fichier
    $write = @fwrite($fp, $nouveau_contenu);
    @fclose($fp);
}
