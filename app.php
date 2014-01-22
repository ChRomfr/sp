<?php
/**
*	Code spécifique à l app
*/

// Fichier lang spécifique a l app
require ROOT_PATH.'app'.DS .'local'.DS.'french.php';
$registry->smarty->assign('lang', $lang);