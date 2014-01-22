<?php

class equipeController extends Controller{
	
	public function ajaxDetailAction($equipe_id){
		
		$this->load_manager('equipe');
		
		$Equipe = $this->manager->equipe->getById($equipe_id);
		$Joueurs = $this->manager->equipe->getJoueurInEquipe($equipe_id);
		
		$this->app->smarty->assign(array(
			'Equipe'		=>	$Equipe,
			'Joueurs'		=>	$Joueurs,			
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'equipe' . DS . 'ajax_detail.tpl');
	}
	
	public function removeJoueurEquipeAction($jeid){
		$data = $this->app->db->get_one(PREFIX . 'joueur_equipe', array('id =' => $jeid) );
		$this->app->db->delete(PREFIX . 'joueur_equipe', null, array('id =' => $jeid) );
		return $this->redirect( getLink('joueur/fiche/'. $data['joueur_id'] .'?tab=structure'),3, $this->lang['Sportif_retire_de_l_equipe']);
	}
	
	public function ajaxReloadEquipeFormJoueurAction($structure_id){
		
		if( $structure_id == 'none'):
			$structure_id = '0';
		endif;
		
		$this->load_manager('equipe');
		$Equipes = $this->manager->equipe->getByStructureId($structure_id);
		$this->app->smarty->assign(array(
			'Equipes'	=>	$Equipes,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'equipe' . DS . 'ajax_reload_equipe_form_joueur.tpl');
	}
	
}