<?php

class matchBasketController extends Controller{

	public function indexAction(){
		
		$Matchs	=	$this->app->db->select('mb.id, mb.date_timestamp, mb.adversaire, mb.score_equipe, mb.score_adversaire, e.nom as equipe, s.nom as structure')
					->from(PREFIX . 'match_basket mb')
					->left_join(PREFIX . 'equipe e', 'mb.equipe_id = e.id')
					->left_join(PREFIX . 'structure s','e.structure_id = s.id')
					->order('mb.date_timestamp DESC')
					->get();
					
		$this->app->smarty->assign(array(
			'Matchs'		=>	$Matchs,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'matchBasket' . DS . 'index.tpl');
	}
	
	public function addAction(){
		
		$this->load_manager('equipe');
		
		
		if( $this->app->HTTPRequest->postExists('match') ):
			$Error = 0;
			
			$Match = $this->app->HTTPRequest->postData('match');
			
			// Verification de la validite du match
			if( empty($Match['equipe_id']) ):
				$Error++;
			endif;
			
			if( empty($Match['adversaire']) ):
				$Error++;
			endif;
			
			if( empty($Match['date_match']) ):
				$Error++;
			endif;
			
			if( $Error > 0 ):
				goto printform;
			endif;
			
			// On formate les donnees
			$Match['date_timestamp'] = FormatDateToTimestamp($Match['date_match']);		// Timestamp du match
			$Match['date_match'] = FormatDateToMySQL($Match['date_match']);				// Format MySQL
			
			$Match_id = $this->app->db->insert(PREFIX . 'match_basket', $Match);
			
			// Traitement des joueurs
			$Sportifs = $this->app->HTTPRequest->postData('sportif');
			
			foreach( $Sportifs as $Row ):
				if( !empty($Row['poste']) && !empty($Row['temps_jeu']) ):
					$Row['match_id'] = $Match_id;
					
					// Calcul des totaux et des %
					
					// Tir a 2 points
					$Row['tir_2_percent'] = round(($Row['tir_2_reussis']*100)/$Row['tir_2']);
					
					// Tir a 3 points
					$Row['tir_3_percent'] = round(($Row['tir_3_reussis']*100)/$Row['tir_3']);
					
					// Cumul tir
					$Row['tir'] = $Row['tir_2'] + $Row['tir_3'];
					$Row['tir_reussis'] = $Row['tir_2_reussis'] + $Row['tir_3_reussis'];
					$Row['tir_percent'] = round(($Row['tir_reussis']*100)/$Row['tir']);
					
					// lance franc
					$Row['lfranc_percent'] = round(($Row['lfranc_reussis']*100)/$Row['lfranc']);
					
					// Percent de point du match
					$Row['points_percent'] = round(($Row['points']*100)/$Match['score_equipe']);
					
					// Rebond total
					$Row['rebond_total'] = $Row['rebond_offensif'] + $Row['rebond_deffensif'];
					
					// Calcul de l eval du jour
					//	Évaluation = 	((Points + Rebonds + Passes décisives + Interceptions + Contres) - 								
					//					((Tirs tentés - Tirs réussis) + (Lancers-francs tentés - Lancers-francs réussis) + Balles perdues))							
				
					$Row['observation']	=	htmlentities($Row['observation']);
					$Row['evaluation']	= 	((($Row['points'] + ($Row['rebond_offensif'] + $Row['rebond_deffensif']) + $Row['interception'] + $Row['contre'])) - ( ($Row['tir'] - $Row['tir_reussis']) + ($Row['lfranc'] - $Row['lfranc_reussis']) + $Row['balle_perdu'] )) ;
					var_dump($Row);
					$this->app->db->insert(PREFIX . 'match_basket_joueur', $Row);
				endif;
			endforeach;
			
			//return $this->redirect( getLink('matchBacket/index'), 3, $this->lang['Match_ajoute']);
		endif;
		
		printform:
		$this->app->smarty->assign(array(
			'Equipes'		=>	$this->manager->equipe->getAll(),
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'matchBasket' . DS . 'add.tpl');
	}	
	
	public function detailAction( $match_id ){
		
		// Recuperation information match
		$Match	=	$this->app->db->select('mb.id, mb.date_timestamp, mb.adversaire, mb.score_equipe, mb.score_adversaire, e.nom as equipe, s.nom as structure, mb.observation')
					->from(PREFIX . 'match_basket mb')
					->left_join(PREFIX . 'equipe e', 'mb.equipe_id = e.id')
					->left_join(PREFIX . 'structure s','e.structure_id = s.id')
					->where(array('mb.id =' => $match_id))
					->get_one();
					
		// Recuperation information joueur
		$Joueurs	=	$this->app->db->select('mbj.*, e.nom as equipe, j.nom, j.prenom')
						->from(PREFIX . 'match_basket_joueur mbj')
						->left_join(PREFIX . 'match_basket mb','mbj.match_id = mb.id')
						->left_join(PREFIX . 'equipe e','mb.equipe_id = e.id')
						->left_join(PREFIX . 'joueur j','mbj.joueur_id = j.id')
						->where(array('mbj.match_id = ' => $match_id))
						->get();
		
		
		$this->app->smarty->assign(array(
			'Match'		=>	$Match,
			'Joueurs'	=>	$Joueurs,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'matchBasket' . DS . 'detail.tpl');		
		var_dump($Match);
		var_dump($Joueurs);
	}
	
	public function deleteAction($match_id){
		
		if( $_SESSION['acl']['gest_match'] == 0):
			return $this->redirect( getLink("index/index"),0,'');
		endif;
		
		$this->app->db->delete(PREFIX . 'match_rugby', $match_id);
		$this->app->db->delete(PREFIX . 'match_rugby_joueur',null, array('match_id =' => $match_id));
		
		return $this->redirect( getLink("matchRugby/index"), 3, $this->lang['Match_supprime']);
	}
	
	public function ajaxGetJoueurAddMatchAction(){
		
		$Equipe_id = $this->app->HTTPRequest->getData('equipe_id');
		$Date = $this->app->HTTPRequest->getData('date');
		
		// Recuperation des joueurs
		$Sportifs	=	$this->app->db->select('j.id, j.nom, j.prenom')
						->from(PREFIX . 'joueur_equipe je')
						->left_join(PREFIX . 'joueur j','je.joueur_id = j.id')
						->where(array('j.actif =' => 1, 'je.equipe_id = ' => $Equipe_id))
						->order('j.nom')
						->get();
						
		$this->app->smarty->assign(array(
			'Sportifs'		=>	$Sportifs,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'matchBasket' . DS . 'ajax_tab_joueur_match.tpl');
	}
	
	public function tabFicheAction(){
		$joueur_id	=	$this->app->HTTPRequest->getData('joueur_id');
		
		// Recuperation des matchs ou le sportif est present
		$Matchs	=	$this->app->db->select('*, mr.id as match_id, e.nom as equipe, s.nom as structure, mrj.id as mrj_id')
					->from(PREFIX . 'match_basket_joueur mrj')
					->left_join(PREFIX . 'match_basket mr','mrj.match_id = mr.id')
					->left_join(PREFIX . 'equipe e','mr.equipe_id = e.id')
					->left_join(PREFIX . 'structure s','e.structure_id = s.id')
					->where(array('mrj.joueur_id = ' => $joueur_id))
					->order('mr.date_timestamp DESC')
					->get();
					
		/*$Stats =  	$this->app->db->select('SUM(mrj.essaie) as tot_essai, SUM(mrj.transformation) as tot_transformation, SUM(mrj.penalite) as tot_penalite, AVG(mrj.essaie) as avg_essai, AVG(mrj.transformation) as avg_transformation, AVG(mrj.penalite) as avg_penalite, SUM(temps_jeu) as tot_tps_jeu, AVG(temps_jeu) as avg_tps_jeu')
					->from(PREFIX . 'match_rugby_joueur mrj')
					->left_join(PREFIX . 'match_rugby mr','mrj.match_id = mr.id')
					->left_join(PREFIX . 'equipe e','mr.equipe_id = e.id')
					->left_join(PREFIX . 'structure s','e.structure_id = s.id')
					->where(array('mrj.joueur_id = ' => $joueur_id))
					->order('mr.date_timestamp DESC')
						->get_one();*/
					
		$this->app->smarty->assign(array(
			'Matchs'		=>	$Matchs,
			//'Stats'			=>	$Stats,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'matchBasket' . DS . 'fiche_tab.tpl');
	}
	
	public function ajaxGetObservationAction($id){
		$Data	=	$this->app->db->get_one(PREFIX . 'match_basket_joueur', array('id =' => $id));
		
		$this->app->smarty->assign(array(
			'Data'		=>	$Data,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'matchRugby' . DS . 'ajax_fiche_observation.tpl' );
	}
}