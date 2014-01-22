<?php

class clubsController extends Controller{
	
	public function equipeIndex(){
		
		$Equipes = $this->app->db->get(PREFIX . 'equipe');
		
		$this->app->smarty->assign(array(
			'Equipes'		=>	$Equipes,
		));
		
		return	$this->app->smarty->fetch( VIEW_PATH . 'clubs' . DS . 'equipe_index.tpl');
		
	}
	
	public function equipeAddAction(){
		
		if( $this->app->HTTPRequest->postExists('equipe') ):
			
			$Equipe = $this->app->HTTPRequest->postData('equipe');
			
			if( empty($Equipe['name']) ):
				goto printform;
			endif;
			
			$this->app->db->insert(PREFIX . 'equipe', $Equipe);
			
			return $this->redirect( getLink('equipeIndex'), 3, $this->lang['Equipe_ajoutee'] );
			
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		return	$this->app->smarty->fetch( VIEW_PATH . 'clubs' . DS . 'equipe_add.tpl');
		
	}
	
	public function equipeEditAction(){}
	public function equipeDeleteAction(){}
	
	public function matchAddAction(){}
	public function matchEditAction(){}
	public function matchDeleteAction(){}
		
}