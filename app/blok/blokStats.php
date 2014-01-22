<?php
if(! defined('IN_VA') ) exit;

function blokStats($app){
	$Query = "
		SELECT COUNT(id) AS nbPirep,
		(SELECT COUNT(id) FROM ". PREFIX ."user WHERE pilot = 1) AS nbPilot,
		(SELECT COUNT(id) FROM ". PREFIX ."flotte) AS nbAvion
		FROM ". PREFIX . "pirep
	";
	
	$Sql = $app->db->query($Query);
	$Stats = $Sql->fetch(PDO::FETCH_ASSOC);
	$Sql->closeCursor();
	
	$app->smarty->assign('stats', $Stats);
	
	return $app->smarty->fetch(VIEW_PATH . 'blok' . DS . 'blokStats.tpl');
}