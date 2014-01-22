<?php 

class projetFormationController extends Controller{
	
	public function addAction( $joueur_id ){
		
		if( $_SESSION['acl']['gest_joueur'] != 1) exit;
		
		if( $this->app->HTTPRequest->postExists('projet') ):
		
			$this->load_model('projetFormation');
			$this->load_manager('projetFormation');
		
			$projet = new projetFormation( $this->app->HTTPRequest->postData('projet') );
		
			if( $projet->isValid() !== true):
				goto printform;
			endif;
			
			$this->manager->projetFormation->save($projet);
			
			return $this->redirect( getLink("joueur/fiche/" . $joueur_id), 3, $this->lang['Projet_enregistre'] );
			
		endif;
		
		printform:
		$this->load_model('joueur');
		$this->load_manager('joueur');
		
		$this->getFormValidatorJs();
		
		$this->app->smarty->assign(array(
			'Joueur_id'			=>	$joueur_id,		
			'Joueur'			=>	new joueur( $this->manager->joueur->getById($joueur_id) ),			
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'projetFormation' . DS . 'add.tpl');
	}
	
	public function editAction( $projet_id ){
		
		if( $_SESSION['acl']['gest_joueur'] != 1) exit;
		
		$this->load_model('projetFormation');
		$this->load_manager('projetFormation');
	
		if( $this->app->HTTPRequest->postExists('projet') ):
	
			$projet = new projetFormation( $this->app->HTTPRequest->postData('projet') );
		
			if( $projet->isValid() !== true):
				goto printform;
			endif;
				
			$this->manager->projetFormation->save($projet);
				
			return $this->redirect( getLink("joueur/fiche/" . $projet->joueur_id), 3, $this->lang['Projet_enregistre'] );
			
		endif;
	
		printform:
		$this->load_model('joueur');
		$this->load_manager('joueur');
	
		$this->getFormValidatorJs();
		
		$projet = new projetFormation( $this->manager->projetFormation->getById($projet_id) );
	
		$this->app->smarty->assign(array(
				'projet'			=>	$projet,
				'Joueur'			=>	new joueur( $this->manager->joueur->getById($projet->joueur_id) ),
		));
	
		return $this->app->smarty->fetch(VIEW_PATH . 'projetFormation' . DS . 'edit.tpl');
	}
	
	public function deleteAction($projet_id){
		
		if( $_SESSION['acl']['gest_joueur'] != 1) exit;
		
		$this->load_model('projetFormation');
		$this->load_manager('projetFormation');
		
		$projet = new projetFormation( $this->manager->projetFormation->getById($projet_id) );
		
		$this->manager->projetFormation->delete($projet_id);
		
		return $this->redirect( getLink("joueur/fiche/" . $projet->joueur_id), 3, $this->lang['Projet_supprime'] );
	}
	
	public function tabFicheAction(){
		
		$Joueur_id = $this->app->HTTPRequest->getData('joueur_id');
		
		// Init var
		$Projets = array();
		
		// Load model
		$this->load_manager('projetFormation');
		
		// Recupertion des donnees methodes je me casse pas la tete et je fais 9 requetes :/
		$Projets[0] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, '1', '1');
		$Projets[1] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, '1', '2');
		$Projets[2] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 1, 3);
		$Projets[3] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 2, 1);
		$Projets[4] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 2, 2);
		$Projets[5] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 2, 3);
		$Projets[6] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 3, 1);
		$Projets[7] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 3, 2);
		$Projets[8] = $this->manager->projetFormation->getByJoueurIdTermeYear($Joueur_id, 3, 3);
		
		// Assignation des donnees a smarty
		$this->app->smarty->assign(array(
			'Projets'		=>	$Projets,	
			'Joueur_id'		=>	$Joueur_id
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'projetFormation' . DS . 'tab_fiche.tpl');
		
		var_dump($this->app->db->queries);
		var_dump($Projets);
	}
	
	public function detailInFicheAction($projet_id){
		
		// Load model
		$this->load_manager('projetFormation');
		
		$Projet	=	$this->manager->projetFormation->getById($projet_id);
		
		// Assignation des donnees a smarty
		$this->app->smarty->assign(array(
				'Projet'		=>	$Projet,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'projetFormation' . DS . 'detail_in_fiche.tpl');
		
	}
}