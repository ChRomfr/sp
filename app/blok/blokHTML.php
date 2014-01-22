<?php
function blokHTML($blok, $app){
	$app->smarty->assign('blok', $blok);
	return $app->smarty->fetch(VIEW_PATH . 'blok' . DS . 'blokHTML.tpl');
}