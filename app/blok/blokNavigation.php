<?php

function blokNavigation($app, $blok){

	$blok['contenu'] = preg_replace("(\r\n|\n|\r)",'',$blok['contenu']);
	$links = explode(';', $blok['contenu']);
	
	if( $links !== false && !empty($links) ){
		$liens = array();

		foreach($links as $k => $v){			
			if( !empty($v) && $v != ''){
				$tmp = explode('|', $v);
				$liens[$tmp[0]] = $tmp[1];
			}			
		}
		
		$app->smarty->assign('links', $liens);
	}

	return $app->smarty->fetch(VIEW_PATH . 'blok' . DS . 'blokNavigation.tpl');
}