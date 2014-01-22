<?php

class entraineurController extends Controller{

	public function indexAction(){
		
		$this->load_manager('entraineur');
		
		$Entraineurs = $this->manager->entraineur->getAll();
		
		$this->app->smarty->assign(array(
			'c_titre'		=>	$this->lang['Entraineur'],
			'Entraineurs'	=>	$Entraineurs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'entraineur' . DS . 'index.tpl' );	
	}
	
    /**
     * Affiche et traite le formulaire
     * 
     * 
     */
	public function addAction(){
	
		if( $_SESSION['acl']['gest_entraineur'] != 1 ) return $this->indexAction();
		
		$this->load_manager('entraineur');
		$this->load_model('entraineur');
		
		if( $this->app->HTTPRequest->postExists('Entraineur') ):
		
			$Entraineur = new entraineur( $this->app->HTTPRequest->postData('Entraineur') );
			if( $Entraineur->isValid() !== true ) goto printform;
			$this->manager->entraineur->save($Entraineur);
			return $this->redirect( getLink('entraineur'),3,$this->lang['Entraineur_ajoute']);
			
		endif;
		
		printform:
		
        $this->app->smarty->assign(array(
            'Structures'    =>  $this->app->db->get(PREFIX . 'structure', null, 'nom'),
        ));
        
		return $this->app->smarty->fetch( VIEW_PATH . 'entraineur' . DS . 'add.tpl' );
	}
	
	public function editAction( $Entraineur_id ){
		$this->load_manager('entraineur');
		$this->load_model('entraineur');
		
		if( $this->app->HTTPRequest->postExists('Entraineur') ):
		
			$Entraineur = new entraineur( $this->app->HTTPRequest->postData('Entraineur') );
			if( $Entraineur->isValid() !== true ) goto printform;
			$this->manager->entraineur->save($Entraineur);
			return $this->redirect( getLink('entraineur'),3,$this->lang['Entraineur_modifie']);
			
		endif;
		
		printform:
		
		$Entraineur = new entraineur( $this->manager->entraineur->getById( $Entraineur_id ) );
		
		$this->app->smarty->assign(array(
			'Entraineur'	=>	$Entraineur,
            'Structures'    =>  $this->app->db->get(PREFIX . 'structure', null, 'nom'),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'entraineur' . DS . 'edit.tpl' );
	}
	
	public function deleteAction( $Entraineur_id ){
		$this->load_manager('entraineur');
		$this->manager->entraineur->delete($Entraineur_id);
		return $this->redirect( getLink('entraineur'), 3, $this->lang['Entraineur_supprime'] );
	}
}