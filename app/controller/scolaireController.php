<?php 

class scolaireController extends Controller{

	public function bocIndexAction(){}
	
	public function bocInPdfAction($boc_id){
		
		// Recuperation des informations BOCs
		$Boc =	$this->app->db->select('sc.*, sf.nom as formation')
				->from(PREFIX . 'scolaire_boc sc')
				->left_join(PREFIX . 'scolaire_formation sf', 'sc.formation_id = sf.id')
				->where(array('sc.id =' => $boc_id))
				->get_one();
		
		// Information du sportifs
		$Sportif = $this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Boc['sportif_id']) );
		
		// Recuperation des matieres et des notes
		$Matieres = $this->app->db->get(PREFIX . 'matiere', null, 'matiere');
		$Notes = $this->app->db->get(PREFIX . 'scolaire_boc_note', array('boc_id =' => $boc_id)	);
		
		// Envoie a smarty
		$this->app->smarty->assign(array(
			'Boc'		=>	$Boc,
			'Sportif'	=>	$Sportif,
			'Matieres'	=>	$Matieres,
			'Notes'		=>	$Notes,
		));
		
		$HTML = $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'boc_in_pdf.tpl');
		
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'mpdf' . DS . 'mpdf.php';
		$mpdf=new mPDF('c');
		$mpdf->WriteHTML(utf8_encode($HTML),2);
		$mpdf->Output();
		exit;
		
		//echo $HTML;
	}
	
	/**
	*	Traite le formulaire pour ajouter un bilan
	*
	*/
	public function bocAddAction($sportif_id){
		
		if( $this->app->HTTPRequest->postExists('boc') ):
			
			$Boc = $this->app->HTTPRequest->postData('boc');
			$Boc['sportif_id'] = $sportif_id;
			$Boc_id = $this->app->db->insert(PREFIX . 'scolaire_boc', $Boc);
			
			// Traitement des matieres
			$Matieres = $this->app->HTTPRequest->postData('matieres');
			foreach($Matieres as $Matiere):
				if( !empty($Matiere['note']) ):
					$Matiere['boc_id'] = $Boc_id;
					$this->app->db->insert(PREFIX . 'scolaire_boc_note', $Matiere);
				endif;
			endforeach;
			
		endif;
	
		return $this->redirect( getLink('joueur/fiche/'. $sportif_id.'?tab=scolaire'), 3, $this->lang['Boc_ajoute']);
	}
	
	public function bocEditAction($boc_id){
		
		if( $this->app->HTTPRequest->postExists('boc') ):
			
			$Boc = $this->app->HTTPRequest->postData('boc');
			$this->app->db->update(PREFIX . 'scolaire_boc', $Boc, array('id =' => $Boc['id']) );
			
			// Traitement des matieres
			$Matieres = $this->app->HTTPRequest->postData('matieres');
			$this->app->db->delete(PREFIX . 'scolaire_boc_note', null, array('boc_id =' => $Boc['id']));
			foreach($Matieres as $Matiere):
				if( !empty($Matiere['note']) ):
					$Matiere['boc_id'] = $boc_id;
					$this->app->db->insert(PREFIX . 'scolaire_boc_note', $Matiere);
				endif;
			endforeach;
			
		endif;
	
		return $this->redirect( getLink('joueur/fiche/'. $Boc['sportif_id'] .'?tab=scolaire'), 3, $this->lang['Boc_modifie']);
	
	}
	
	public function bocDeleteAction($boc_id){
		$Boc = $this->app->db->get_one(PREFIX . 'scolaire_boc', array('id =' => $boc_id)); 
		$this->app->db->delete(PREFIX . 'scolaire_boc', $boc_id);
		return $this->redirect( getLink('joueur/fiche/'. $Boc['sportif_id'].'?tab=scolaire'), 3, $this->lang['Boc_supprime']);
	}
	
	/**
	*	Affiche le formulaire de boc
	*
	*/
	public function bocGetFormAddAction($sportif_id){
		
		
		$this->app->smarty->assign(array(
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $sportif_id)),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $sportif_id)),
			'Matieres'		=>	$this->app->db->get(PREFIX . 'matiere', null, 'matiere'),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'boc_ajax_form_add.tpl');
	}
	
	public function bocGetFormEditAction($boc_id){
		$Boc = $this->app->db->get_one(PREFIX . 'scolaire_boc', array('id =' => $boc_id));
		$this->app->smarty->assign(array(
			'Boc'			=>	$Boc,
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Boc['sportif_id'])),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $Boc['sportif_id'])),
			'Matieres'		=>	$this->app->db->get(PREFIX . 'matiere', null, 'matiere'),
			'Notes'			=>	$this->app->db->get(PREFIX . 'scolaire_boc_note', array('boc_id =' => $boc_id)),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'boc_ajax_form_edit.tpl');
	}
	
	public function bocGetForFicheAction($sportif_id){
		$BOCs	=	$this->app->db->select('sb.*')
					->from(PREFIX . 'scolaire_boc sb')
					->where(array('sportif_id =' => $sportif_id))
					->order('sb.id DESC')
					->get();
					
		$this->app->smarty->assign(array(
			'BOCs'			=>	$BOCs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'boc_ajax_fiche_sportif.tpl');
	}
	
		
	/**
	*	Traite le formulaire pour ajouter un DPP
	*
	*/
	public function dppAddAction($sportif_id){
		
		if( $this->app->HTTPRequest->postExists('dpp') ):
			
			$Dpp = $this->app->HTTPRequest->postData('dpp');
			$Dpp['sportif_id'] = $sportif_id;
			$Dpp['date_dpp'] = FormatDateToMySQL($Dpp['date_dpp']);
			$Dpp_id = $this->app->db->insert(PREFIX . 'scolaire_dpp', $Dpp);
		endif;
	
		return $this->redirect( getLink('joueur/fiche/'. $sportif_id.'?tab=scolaire'), 3, $this->lang['Dpp_ajoute']);
	}
	
	/**
	*	Traite le formulaire pour modifier un DPP
	*
	*/
	public function dppEditAction($dpp_id){
		
		if( $this->app->HTTPRequest->postExists('dpp') ):
			
			$Dpp = $this->app->HTTPRequest->postData('dpp');
			$Dpp['date_dpp'] = FormatDateToMySQL($Dpp['date_dpp']);
			$Dpp_id = $this->app->db->update(PREFIX . 'scolaire_dpp', $Dpp, array('id =' => $Dpp['id']) );
			
		endif;
	
		return $this->redirect( getLink('joueur/fiche/'. $Dpp['sportif_id'] .'?tab=scolaire'), 3, $this->lang['Dpp_modifie']);
	}
	
	/**
	*	Affiche le formulaire de dpp
	*
	*/
	public function dppGetFormAddAction($sportif_id){
		
		
		$this->app->smarty->assign(array(
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $sportif_id)),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $sportif_id)),
			'Personnes'		=>	$this->app->db->get(PREFIX . 'organigramme_personne',null,'nom'),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'dpp_ajax_form_add.tpl');
	}
	
	/**
	*	Recupere les dpp et retourne le code HTML pour etre afficher dans la fiche
	*
	*/
	public function dppGetForFicheAction($sportif_id){
		$DPPs	=	$this->app->db->select('sd.*')
					->from(PREFIX . 'scolaire_dpp sd')
					->where(array('sd.sportif_id =' => $sportif_id))
					->order('sd.id DESC')
					->get();
					
		$this->app->smarty->assign(array(
			'DPPs'			=>	$DPPs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'dpp_ajax_fiche_sportif.tpl');
	}
	
	/**
	*	Affiche le formulaire d edition de plan de formation
	*
	*/
	public function dppGetFormEditAction($dpp_id){
		$Dpp = $this->app->db->get_one(PREFIX . 'scolaire_dpp', array('id =' => $dpp_id));
		
		// Formatage de la date Mysql TO FR
		$Dpp['date_dpp'] = FormatDateFromMySql($Dpp['date_dpp']);
		
		$this->app->smarty->assign(array(
			'Dpp'			=>	$Dpp,
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Dpp['sportif_id'])),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $Dpp['sportif_id'])),
			'Personnes'		=>	$this->app->db->get(PREFIX . 'organigramme_personne',null,'nom'),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'dpp_ajax_form_edit.tpl');
	}
	
	/**
	*	Traite la suppression des DPP
	*/
	public function dppDeleteAction($dpp_id){
		$Dpp = $this->app->db->get_one(PREFIX . 'scolaire_dpp', array('id =' => $dpp_id)); 
		$this->app->db->delete(PREFIX . 'scolaire_dpp', $dpp_id);
		return $this->redirect( getLink('joueur/fiche/'. $Dpp['sportif_id'].'?tab=scolaire'), 3, $this->lang['Dpp_supprime']);
	}
	
	public function bfsAddAction( $sportif_id ){
	
		if( $this->app->HTTPRequest->postExists('bfs') ):
			
			$Bfs = $this->app->HTTPRequest->postData('bfs');
			$Bfs['sportif_id'] = $sportif_id;
			$Bfs['date_bfs'] = FormatDateToMySQL($Bfs['date_bfs']);
			$Bfs_id = $this->app->db->insert(PREFIX . 'scolaire_bfs', $Bfs);
			
			// Traitement des matieres
			$Matieres = $this->app->HTTPRequest->postData('matieres');
			foreach($Matieres as $Matiere):
				if( !empty($Matiere['note']) ):
					$Matiere['bfs_id'] = $Bfs_id;
					$this->app->db->insert(PREFIX . 'scolaire_bfs_note', $Matiere);
				endif;
			endforeach;
			
		endif;
	
		return $this->redirect( getLink('joueur/fiche/'. $sportif_id.'?tab=scolaire'), 3, $this->lang['Bfs_ajoute']);
	}
	
	public function bfsEditAction( $bfs_id ){
		if( $this->app->HTTPRequest->postExists('bfs') ):
			
			$Bfs = $this->app->HTTPRequest->postData('bfs');
			$Bfs['date_bfs'] = FormatDateToMySQL($Bfs['date_bfs']);
			$this->app->db->update(PREFIX . 'scolaire_bfs', $Bfs, array('id =' => $Bfs['id']));
			
			// Traitement des matieres
			$Matieres = $this->app->HTTPRequest->postData('matieres');
			$this->app->db->delete(PREFIX . 'scolaire_bfs_note', null, array('bfs_id =' => $bfs_id));
			foreach($Matieres as $Matiere):
				if( !empty($Matiere['note']) ):
					$Matiere['bfs_id'] = $bfs_id;
					$this->app->db->insert(PREFIX . 'scolaire_bfs_note', $Matiere);
				endif;
			endforeach;
			
		endif;
	
		return $this->redirect( getLink('joueur/fiche/'. $Bfs['sportif_id'] .'?tab=scolaire'), 3, $this->lang['Bfs_modifie']);
	}
	
	
	public function bfsDeleteAction( $bfs_id ){
		$Bfs = $this->app->db->get_one(PREFIX . 'scolaire_bfs', array('id =' => $bfs_id));
		$this->app->db->delete(PREFIX . 'scolaire_bfs', $bfs_id);
		return $this->redirect( getLink('joueur/fiche/'. $Bfs['sportif_id'] .'?tab=scolaire'), 3, $this->lang['Bfs_supprime']);
	}
	
	public function bfsGetFormAddAction( $sportif_id ){
		$this->app->smarty->assign(array(
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $sportif_id)),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $sportif_id)),
			'Matieres'		=>	$this->app->db->get(PREFIX . 'matiere', null, 'matiere'),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'bfs_ajax_form_add.tpl');
	}
	
	public function bfsGetFormEditAction( $bfs_id ){
	
		$Bfs = $this->app->db->get_one(PREFIX . 'scolaire_bfs', array('id =' => $bfs_id));
		
		// Formatage de la date Mysql TO FR
		$Bfs['date_bfs'] = FormatDateFromMySql($Bfs['date_bfs']);
		
		$this->app->smarty->assign(array(
			'Bfs'			=>	$Bfs,
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Bfs['sportif_id'])),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $Bfs['sportif_id'])),
			'Matieres'		=>	$this->app->db->get(PREFIX . 'matiere', null, 'matiere'),
			'Notes'			=>	$this->app->db->get(PREFIX . 'scolaire_bfs_note', array('bfs_id =' => $bfs_id)),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'bfs_ajax_form_edit.tpl');		
	}
	
	public function bfsGetForFicheAction( $sportif_id ){
		$BFSs = $this->app->db->select('bfs.*')
				->from(PREFIX . 'scolaire_bfs bfs')
				->where(array('sportif_id =' => $sportif_id))
				->order('bfs.id DESC')
				->get();
				
		$this->app->smarty->assign(array(
			'BFSs'			=>	$BFSs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'bfs_ajax_fiche_sportif.tpl');
	}
	
	public function trimestreGetForFicheAction( $sportif_id ){
		
		$Trimestres	=	$this->app->db->get(PREFIX . 'scolaire_trimestre', array('joueur_id =' => $sportif_id));
        
        if( !empty($Trimestres) ):
            $i=0;
            foreach( $Trimestres as $Row ):
                $tmp = explode('|', $Row['trimestre']);
                $Trimestres[$i]['number'] = $tmp[0];
                $Trimestres[$i]['annee'] = $tmp[1];
				
				// Recuperation des suivis
				$Trimestres[$i]['suivis'] = $this->app->db->get(PREFIX . 'scolaire_suivi', array('trimestre_id =' => $Row['id']), 'timestamp_suivi DESC');
				
                $i++;
            endforeach;
        endif;
		
		$this->app->smarty->assign(array(
			'Trimestres'		=>	$Trimestres,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'trimestre_ajax_fiche_sportif.tpl' );
		
	}
	
	/**
	 * 
	 * @param type $dpp_id
	 * @return type
	 */
	public function printDPPAction($dpp_id){
		
		$Dpp = $this->app->db->get_one(PREFIX . 'scolaire_dpp', array('id =' => $dpp_id));
		
		// Formatage de la date Mysql TO FR
		$Dpp['date_dpp'] = FormatDateFromMySql($Dpp['date_dpp']);
		
		$this->app->smarty->assign(array(
			'Dpp'			=>	$Dpp,
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Dpp['sportif_id'])),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $Dpp['sportif_id'])),
			'Personnes'		=>	$this->app->db->get(PREFIX . 'organigramme_personne',null,'nom'),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'print_dpp.tpl');
		
	}
	
	public function printBFSAction( $bfs_id ){
		
		$Bfs = $this->app->db->get_one(PREFIX . 'scolaire_bfs', array('id =' => $bfs_id));
		
		// Formatage de la date Mysql TO FR
		$Bfs['date_bfs'] = FormatDateFromMySql($Bfs['date_bfs']);
		
		$this->app->smarty->assign(array(
			'Bfs'			=>	$Bfs,
			'Sportif'		=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Bfs['sportif_id'])),
			'Formations'	=>	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $Bfs['sportif_id'])),
			'Matieres'		=>	$this->app->db->get(PREFIX . 'matiere', null, 'matiere'),
			'Notes'			=>	$this->app->db->get(PREFIX . 'scolaire_bfs_note', array('bfs_id =' => $bfs_id)),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'print_bfs.tpl');		
	}
	
	public function printBOCAction( $boc_id ){
		
		// Recuperation des informations BOCs
		$Boc =	$this->app->db->select('sc.*, sf.nom as formation')
				->from(PREFIX . 'scolaire_boc sc')
				->left_join(PREFIX . 'scolaire_formation sf', 'sc.formation_id = sf.id')
				->where(array('sc.id =' => $boc_id))
				->get_one();
		
		// Information du sportifs
		$Sportif = $this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Boc['sportif_id']) );
		
		// Recuperation des matieres et des notes
		$Matieres = $this->app->db->get(PREFIX . 'matiere', null, 'matiere');
		$Notes = $this->app->db->get(PREFIX . 'scolaire_boc_note', array('boc_id =' => $boc_id)	);
		
		// Envoie a smarty
		$this->app->smarty->assign(array(
			'Boc'		=>	$Boc,
			'Sportif'	=>	$Sportif,
			'Matieres'	=>	$Matieres,
			'Notes'		=>	$Notes,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'print_boc.tpl');
	}


	/**
	 * Permet l affichage de l impression de la formation
	 * @param type $formation_id
	 * @return string
	 */
	public function printFormationDetailAction($formation_id){
		
		if( empty($formation_id) ) return "Error no data selected";
		
		$this->load_manager('formation');
		
		$Formation = $this->manager->formation->getById($formation_id);
		
		$this->app->smarty->assign(array(
			'Formation'		=>	$Formation,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'scolaire' . DS . 'print_formation_detail.tpl');		
	}
	
}
