<?php
/**
 * SCRIPT INSTALLATION
 * 
 * */

define('IN_VA', TRUE);
define('IN_INSTALL', TRUE);
define('DS', DIRECTORY_SEPARATOR); 
define('ROOT_PATH', str_replace('install'. DS .'index.php','',__FILE__));

if( isset( $_GET['action'] ) ) $action = $_GET['action']; else $action = 'index';

switch ($action){
	
	case 'install_step1':
		install_step1();
	break;
	
	case 'update_step1':
		update_step1();
	break;
	
	case 'update_step2':
		update_step2();
	break;
	
	default:
		index();
	break;
}

function index(){
	
	// On determine si SharkVA est deja installer
	$InstallOrUpdate = checkInstallOrUpdate();
	
	if( $InstallOrUpdate == 'update' ){
		echo '<a href="index.php?action=update_step1" title="">Mettre a jour</a>';
	}else{
		echo '<a href="index.php?action=install_step1" title="">Installation</a>';
	}
}

/**
 * Verification des pre requis
 * 
 */
function install_step1(){
	
}

/**
 * Information base de donnée et test de connexion.
 * Si test ok ecriture du fichier de config et installation de la base
 */
function install_step2(){
	
}

/**
 * Configuration du site
 */
function install_step3(){
	
}

function install_step4(){
	
}

function checkInstallOrUpdate(){
	if( is_file(ROOT_PATH . 'config' . DS . 'config.php') )
		return 'update';
	else
		return 'install';
}

////////////////////////////////////////////////////
//
//	UPDATE
//
////////////////////////////////////////////////////
function update_step1(){
	// Inclusion fichier de config
	require_once ROOT_PATH . 'config' . DS . 'config.php';
	
	// Connexion a la base
	$dsn = 'mysql:host=' . $DB_Configuration['serveur'] .'; dbname='. $DB_Configuration['base'];
	$db = new PDO($dsn, $DB_Configuration['utilisateur'], $DB_Configuration['password'], array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8") );
	
	// Recuperation de la version
	getVersion($db);
	
	echo '<div>Avant de mettre a jour votre site, effectuer une sauvegarde de votre base de donnees</div><div><a href="index.php?action=update_step2" title="">Mettre a jour</a></div>';
}

function update_step2(){
	// Inclusion fichier de config
	require_once ROOT_PATH . 'config' . DS . 'config.php';
	
	// Connexion a la base
	$dsn = 'mysql:host=' . $DB_Configuration['serveur'] .'; dbname='. $DB_Configuration['base'];
	$db = new PDO($dsn, $DB_Configuration['utilisateur'], $DB_Configuration['password'], array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8") );
	
	// Recuperation de la version
	$version = getVersion($db);
	
	switch ($version){
		default:
			echo "Impossible de mettre a jour votre site !";
			break;
	}
	
}

////////////////////////////////////////////////////
//
//	FONCTIONS GENERIQUES
//
////////////////////////////////////////////////////
function getVersion($db){
	
	$Sql = $db->query('SELECT valeur FROM '. PREFIX . 'config WHERE cle = "version" LIMIT 1');
	$version = $Sql->fetchColumn();
	$Sql->closeCursor();
	
	return $version;
}
