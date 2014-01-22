<?php

class noteController extends Controller{
	
	public function indexAction(){}
	
	public function addAction(){
	
		if( $this->app->HTTPRequest->postExists('note') ):
		
		endif;
		
		printform:
		
		return $this->app->smarty->fech( VIEW_PATH . 'note' . DS . 'add.tpl');
	}
}