<?php if( !defined('IN_VA') ) exit;
/**
*	FICHIER DE CONFIGURATION
*	CONTIENT LES INFORMATIONS POUR ACCEDER A LA BASE DE DONNEES
*/

date_default_timezone_set('Europe/Paris');

// DONNEE DE CONNEXION A LA BASE DE DONNEES
$DB_Configuration = array(
'type'			=> 'mysql',
'serveur' 		=> '127.0.0.1',
'utilisateur' 	=> 'root',
'password' 		=> '',
'base' 			=> 'sp',
);

define('PREFIX', '');		// Prefix des tables
define('IN_PRODUCTION', true);	// Active le mode developpeur
define('BREAD_SEP','&nbsp;<&nbsp;');
define('CONFIG_IN_DB',true);
# On definie si les sessions sont stocke en base de donnee
define('SESSION_IN_DB',false);
# Permet l identification d un utilisateur plusieurs fois
define('SESSION_MULTI',false);
// Determine si le script doit créer les constantes ACL ADMIN
define('ACL_ADMIN',false);

$config_file = array(
'theme'						=>	'sp',
'bootstrap_version'			=>	'3',
'format_date'				=>	"%d/%m/%Y - %H:%M",
'format_date_day'			=>	"%d/%m/%Y",
'url'						=>	'',
'url_dir'					=>	'',
'rewrite_url'				=>	0,

# News
'news_commentaire'			=>	0,
'news_nom'					=>	'News',	
# Utilisateur
'register_open'				=>	0,
#Article
'article_nom'				=>	'Articles',
'article_pager'				=>	0,
'article_commentaire'		=>	1,
# Download
'download_per_page'			=>	10,
# Utilisateur
'user_activation'			=>	'auto',	# Valeur possible : auto|mail|admin
'user_id'					=>	'int',	# Valeur possible : int|uniq dans le cas uniq modifier le type dans la base de donnee en varchar(50)
'user_edit_profil'			=>	1,
'user_register_by_fb'		=>	0,
# General
'use_ckeditor'				=>	0,
'use_sh'					=>	1,
'fb_app_id'					=>	'',		# Id application facebook

'per_page'					=>	30,
);

define('USE_TABLE_CONFIG', true);
define('ADM_BLOK_LEVEL',3);
define('BREAD',1);
define('USE_ENTRAINEMENT_CYCLE', true);