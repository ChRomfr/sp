<?php
/**
 * SP
 * v2
 * @author : drouche romain
 * @website: http://www.goliath-software.com
 * @email : goliathsoftwarefr@gmail.com
 */

$version = "2.0.20140120";

$chrono1 = microtime();
define('IN_VA', TRUE);
define('ROOT_PATH', str_replace('index.php','',__FILE__));
define('DS', DIRECTORY_SEPARATOR); 
define('APP_PATH', ROOT_PATH . 'app' . DS);
define('CACHE_PATH', ROOT_PATH . 'cache' . DS);
define('VIEW_PATH', ROOT_PATH . 'app' . DS . 'view' . DS);
define('CONTROLLER_PATH', ROOT_PATH . 'app' . DS . 'controller' . DS);
define('MODEL_PATH', ROOT_PATH . 'app' . DS . 'model' . DS);
define('ADM_MODEL_PATH','');

// Inclusion du noyau
require_once ROOT_PATH . 'kernel' . DS . 'core'. DS . 'core.php';

// Code specifique a l app
require_once ROOT_PATH . 'app.php';

// On verification que l utilisateur est bien identifie sinon on force la page login
if( $_SESSION['utilisateur']['identifiant'] == 'Visiteur' && $registry->router->controller != 'connexion' ){
    $registry->router->controller = 'connexion';
}

// Envoie des vars a smarty
/*
$registry->smarty->assign('config',$config);
$registry->config = $config;
*/

//	APL des JS et CSS supplementaire
$jquery_theme = 'overcast';

//JQUERY
registry::load_web_lib('jquery/jquery-1.9.1.min.js','js');
registry::load_web_lib('jquery/jquery-migrate-1.1.1.min.js','js');
//JQUERYUI
registry::load_web_lib('jqueryui/jquery-ui-1.10.2.custom.min.js','js');
registry::load_web_lib('jqueryui/overcast/jquery-ui-1.10.2.custom.min.css','css');

registry::load_web_lib('validation/jquery.validate.min.js','js');

$registry->addJS('fancybox/jquery.mousewheel-3.0.4.pack.js');
$registry->addJS('fancybox/jquery.fancybox-1.3.4.pack.js');
$registry->addCSS('fancybox/jquery.fancybox-1.3.4.css');
$registry->addJS('jquery.maskedinput.min.js');
$registry->addJS('mustache.js');

//
// DEFINTION CHEMIN APPLICATION
//
$registry->router->setPath(array(ROOT_PATH . 'MyApp' . DS . 'controller' .DS,  ROOT_PATH . 'app' . DS . 'controller' .DS) );

require_once APP_PATH . 'include' . DS . 'function_rugby.php';

//
// Si version imprimable on envoie les JS supplementaire
//
if( $registry->HTTPRequest->getExists('print') ):
	$registry->smarty->assign('js_add', registry::$js);	
endif;


// Traitemnt de la page appelé
$Content = $registry->router->loader();

// GESTION AFFICHAGE
if( !$registry->HTTPRequest->getExists('nohtml') && !$registry->HTTPRequest->getExists('printer') ):
    
    $registry->smarty->assign('app', $registry);
	$registry->smarty->assign('css_add', registry::$css);
	$registry->smarty->assign('js_add', registry::$js);
	$registry->smarty->assign('content', $Content);
	
	echo $registry->smarty->display(ROOT_PATH . 'themes' . DS . $config->config['theme'] . DS . 'layout.tpl');
	
elseif( $registry->HTTPRequest->getExists('printer') && !$registry->HTTPRequest->getExists('nohtml')):
	$registry->smarty->assign('css_add', registry::$css);
	$registry->smarty->assign('js_add', registry::$js);
	$registry->smarty->assign('content', $Content);
	echo $registry->smarty->display(ROOT_PATH . 'themes' . DS . $config['theme'] . DS . 'layout_printer.tpl');
else:
	echo $Content;
endif;

// Activation du mode dvlp
if( $InfosInstall['i_in_prod'] == 0 && !$registry->HTTPRequest->getExists('nohtml') ):
	// Affichage du debug en pied de page
	echo	'<div style="size:9px; margin:auto; width:1000px;">';
	echo	'<div>
			Page generee en : '. round( microtime() - $chrono1, 6) . ' sec | 
			Requete SQL : '. $db->num_queries .' | 
			Utilisation memoire : ' . round(memory_get_usage() / (1024*1024),2) .' mo
			</div>';
	
	echo	'<div style="margin:auto; width:1000px;"><hr/>SESSION :';		
	var_dump($_SESSION);
	echo	'<hr/>SERVER :';		
	//var_dump($_SERVER);
	echo	'<hr/>POST :<pre><small>'; 
	print_r($_POST);
	echo	'<hr/>Requetes :<pre>';
	print_r($registry->db->queries);
	echo 	'<hr/>CONFIG :<pre><small>';
	print_r($config);
	echo"<hr/>Template<pre><small>"; 
	print_r($registry->smarty->tpls_used);
	echo	'</small></pre></div>';
		
endif;