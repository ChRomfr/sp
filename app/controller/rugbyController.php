<?php

class rugbyController extends Controller{
	
	public function indexAction(){
		return $this->matchIndexAction();
	}
	
	public function matchIndexAction(){
		
		$Matchs = $this->app->db->get(PREFIX . 'rugby_match',null,'m_date DESC');
		
		$this->app->smarty->assign(array(
			'Matchs'		=>	$Matchs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'rugby' . DS . 'match_index.tpl');
	}
	
	public function matchAddAction(){
		
		if( $this->app->HTTPRequest->postExists('match') ):
		
			$Match = $this->app->HTTPRequest->postData('match');			
			$Joueurs = $Match['joueur'];
			unset($Match['joueur']);
			
			if( count($Joueurs) == 0):
				goto printform;
			endif;
			
			$Match['m_date'] = FormatDateToTimestamp($Match['m_date']);
			$Match_ID = $this->app->db->insert(PREFIX . 'rugby_match',$Match);
			
			foreach( $Joueurs as $Row ):
				if( !empty($Row['joueur_id']) ):
					$Row['match_id'] = $Match_ID;
					$this->app->db->insert(PREFIX . 'rugby_match_joueur', $Row);
				endif;
			endforeach;
			
			return $this->redirect( getLink('rugby/matchIndex'), 3, $this->lang['Match_enregistre'] );
			
		endif;
		
		printform:
		$this->getFormValidatorJs();
		return $this->app->smarty->fetch( VIEW_PATH . 'rugby' . DS . 'match_add.tpl' );
		
	}
	
	public function matchJoueurAddAction(){
		
		$nb_joueur = $this->app->HTTPRequest->getData('nb_joueur');
		
		$this->load_manager('joueur');
		
		$this->app->smarty->assign(array(
			'i_joueur'	=>	$nb_joueur,
			'Joueurs'	=>	$this->manager->joueur->getAll(),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'rugby' . DS . 'match_joueur_add.tpl' );
	}
	
	public function matchDetailAction( $match_id ){
		
		$Match		= 	$this->app->db->get_one(PREFIX . 'rugby_match', array('id =' => $match_id) );
		$Joueurs	=	$this->app->db->select('rmj.*, j.nom, j.prenom')
						->from(PREFIX . 'rugby_match_joueur rmj')
						->left_join(PREFIX . 'joueur j','rmj.joueur_id = j.id')
						->where(array('match_id =' => $match_id) )
						->get();
		
		$this->app->smarty->assign(array(
			'Match'		=>	$Match,
			'Joueurs'	=>	$Joueurs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'rugby' . DS . 'match_detail.tpl' );
	}
	
	public function tabFicheAction(){
		$joueur_id	=	$this->app->HTTPRequest->getData('joueur_id');
		
		// Recuperation des matchs du joueurs
		$Matchs		=	$this->app->db->select('rm.*,rmj.*,rm.id as m_id, rmj.id as rmj_id')
						->from(PREFIX . 'rugby_match rm')
						->left_join(PREFIX . 'rugby_match_joueur rmj','rmj.match_id = rm.id')
						->where(array('rmj.joueur_id =' => $joueur_id))
						->order('rm.m_date DESC')
						->get();
						
		// Calcul du temps de jeu sur le mois en cours
		$TpsMois	=	$this->app->db->select('SUM(rmj.temps_jeu) as temps')
						->from(PREFIX . 'rugby_match_joueur rmj')
						->left_join(PREFIX . 'rugby_match rm','rmj.match_id = rm.id')
						->where(array('rmj.joueur_id =' => $joueur_id, 'm_date >' => mktime(0,0,0,date('n'),1,date('Y') ), 'm_date <' => mktime(0,0,0,date('n'),date('t'),date('Y') )))
						->get_one();
		
		// Calcul du temps moyen par match
		$AvgMatch	=	$this->app->db->select('AVG(rmj.temps_jeu) as temps')
						->from(PREFIX . 'rugby_match_joueur rmj')
						->left_join(PREFIX . 'rugby_match rm','rmj.match_id = rm.id')
						->where(array('rmj.joueur_id =' => $joueur_id))
						->get_one();
						
		$this->app->smarty->assign(array(
			'Matchs'	=>	$Matchs,
			'TpsMois'	=>	$TpsMois,
			'AvgMatch'	=>	$AvgMatch,
		));
										
		return $this->app->smarty->fetch( VIEW_PATH . 'rugby' . DS . 'tab_fiche.tpl' );
	}
	
	public function ajaxGetObservationAction($id){
		$Data	=	$this->app->db->get_one(PREFIX . 'match_rugby_joueur', array('id =' => $id));
		
		$this->app->smarty->assign(array(
			'Data'		=>	$Data,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'rugby' . DS . 'ajax_fiche_observation.tpl' );
	}
}