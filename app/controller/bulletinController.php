<?php
class bulletinController extends Controller{
    
    public function addAction($trimestre_id){
        
        if( $_SESSION['acl']['gest_joueur'] != true) $this->redirect( getLink('index/index'),0,'');
        
        if( $this->app->HTTPRequest->postExists('matieres') ){
            $Matieres = $this->app->HTTPRequest->postData('matieres');
            $Trimestre = $this->app->HTTPRequest->postData('trimestre');
			
            $jid = $Matieres['joueur_id'];
            $tid = $Matieres['trimestre_id'];
            unset($Matieres['joueur_id'],$Matieres['trimestre_id']);
            
            foreach($Matieres as $Row):
                $Row['trimestre_id'] = $tid;
                $Row['joueur_id'] = $jid;
                if( !empty($Row['moyenne']) )
                    $this->app->db->insert(PREFIX . 'joueur_scolaire_matiere_note', $Row);
            endforeach;
			
			$this->app->db->update(PREFIX . 'scolaire_trimestre', $Trimestre, array('id =' => $Trimestre['id']));

            return $this->redirect( getLink('joueur/fiche/' . $jid), 3, $this->lang['Bulletin_ajoute']);
            
        }
        
        printform:
        
        $this->load_manager('joueur');
        
        // Recuperation information trimestre
        $Trimestre = $this->app->db->get_one(PREFIX . 'scolaire_trimestre', array('id =' => $trimestre_id));
        $tmp = explode('|', $Trimestre['trimestre']);
        $Trimestre['num'] = $tmp[0];
        $Trimestre['annee'] = $tmp[1];
        
        // Recuperation des matieres
        $Matieres = $this->app->db->get(PREFIX . 'matiere', null, 'matiere');
        
        $Joueur = $this->manager->joueur->getById( $Trimestre['joueur_id'] );
		        
        // Envoie des datas a smarty
        $this->app->smarty->assign(array(
            'Trimestre'     =>      $Trimestre,
            'Matieres'      =>      $Matieres,
            'Joueur'        =>      $Joueur,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'bulletin' . DS . 'add.tpl');
    }   
    
    public function detailAction(){
        
        /*if( $_SESSION['acl']['bulletin_view'] != true) $this->redirect( getLink('index/index'),0,'');*/
        
        $tid = $this->app->HTTPRequest->getData('tid');
        
        // Recuperation information trimestre
        $Trimestre = $this->app->db->get_one(PREFIX . 'scolaire_trimestre', array('id =' => $tid));
        $tmp = explode('|', $Trimestre['trimestre']);
        $Trimestre['num'] = $tmp[0];
        $Trimestre['annee'] = $tmp[1];

        $Notes = $this->app->db->select('jsmn.moyenne, jsmn.observation, m.matiere')->from(PREFIX . 'joueur_scolaire_matiere_note jsmn')->left_join(PREFIX . 'matiere m', 'jsmn.matiere_id = m.id')->where(array('jsmn.trimestre_id =' => $tid))->get();
        
        $this->app->smarty->assign(array(
            'Trimestre'     =>      $Trimestre,
            'Notes'         =>      $Notes,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'bulletin' . DS . 'detail.tpl');
        
    }
    
    public function editAction($trimestre_id){
        if( $_SESSION['acl']['gest_joueur'] != true) $this->redirect( getLink('index/index'),0,'');
        
        if( $this->app->HTTPRequest->postExists('matieres') ){
            
            $Matieres 	= $this->app->HTTPRequest->postData('matieres');			
			$Trimestre 	= $this->app->HTTPRequest->postData('trimestre');
            
            // Suppression des donnes deja existante
            $this->app->db->delete( PREFIX . 'joueur_scolaire_matiere_note', null, array('trimestre_id =' => $Matieres['trimestre_id']) );           
            
            $jid = $Matieres['joueur_id'];
            $tid = $Matieres['trimestre_id'];
            unset($Matieres['joueur_id'],$Matieres['trimestre_id']);
            
            foreach($Matieres as $Row):
                $Row['trimestre_id'] = $tid;
                $Row['joueur_id'] = $jid;
                if( !empty($Row['moyenne']) )
                    $this->app->db->insert(PREFIX . 'joueur_scolaire_matiere_note', $Row);
            endforeach;
			
			$this->app->db->update(PREFIX . 'scolaire_trimestre', $Trimestre, array('id =' => $Trimestre['id']));
			
            return $this->redirect( getLink('joueur/fiche/' . $jid), 3, $this->lang['Bulletin_modifie']);
            
        }
        
        printform:
        
        $this->load_manager('joueur');
        
        // Recuperation information trimestre
        $Trimestre = $this->app->db->get_one(PREFIX . 'scolaire_trimestre', array('id =' => $trimestre_id));
        $tmp = explode('|', $Trimestre['trimestre']);
        $Trimestre['num'] = $tmp[0];
        $Trimestre['annee'] = $tmp[1];
        
        // Recuperation des matieres
        $Matieres = $this->app->db->get(PREFIX . 'matiere', null, 'matiere');
        
        // Recuperation des notes pour les matieres.
        $i=0;
        foreach( $Matieres as $Row ):
            $Note = $this->app->db->get_one(PREFIX . 'joueur_scolaire_matiere_note', array('trimestre_id =' => $trimestre_id, 'matiere_id =' => $Row['id']) );
            $Matieres[$i]['moyenne'] = $Note['moyenne'];
            $Matieres[$i]['observation'] = $Note['observation'];
            $i++;
        endforeach;
        
        $Joueur = $this->manager->joueur->getById( $Trimestre['joueur_id'] );
        
        // Envoie des datas a smarty
        $this->app->smarty->assign(array(
            'Trimestre'     =>      $Trimestre,
            'Matieres'      =>      $Matieres,
            'Joueur'        =>      $Joueur,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'bulletin' . DS . 'edit.tpl');
    }
    
    public function deleteAction($trimestre_id){
        if( $_SESSION['acl']['gest_joueur'] != true) $this->redirect( getLink('index/index'),0,'');
        $Data = $this->app->db->get_one(PREFIX . 'scolaire_trimestre', array('id =' => $trimestre_id));
        $this->app->db->delete( PREFIX . 'scolaire_trimestre', $trimestre_id );
        $this->app->db->delete( PREFIX . 'joueur_scolaire_matiere_note', null, array('trimestre_id =' => $trimestre_id) );
        return $this->redirect( getLink('joueur/fiche/' . $Data['joueur_id']), 3, $this->lang['Bulletin_supprime']);
    }
	
	public function suiviAddAction($trimestre_id){
		
		if( $this->app->HTTPRequest->postExists('suivi') ):
			$Suivi = $this->app->HTTPRequest->postData('suivi');
			
			$Suivi['timestamp_suivi'] 	= FormatDateToTimestamp($Suivi['date_suivi']);
			$Suivi['date_suivi'] 		= FormatDateToMySQL($Suivi['date_suivi']);
			
			$this->app->db->insert(PREFIX . 'scolaire_suivi', $Suivi);
			
			return $this->redirect( getLink('joueur/fiche/' . $Suivi['sportif_id'] . '?tab=scolaire'), 3, $this->lang['Suivi_ajoute']);		
			
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		// Recuperation des informations du trimestre
		$Trimestre = $this->app->db->get_one(PREFIX . 'scolaire_trimestre', array('id =' => $trimestre_id) );
		
		$tmp = explode('|', $Trimestre['trimestre']);
        $Trimestre['num'] = $tmp[0];
        $Trimestre['annee'] = $tmp[1];
		
		// Envoie au template
		$this->app->smarty->assign(array(
			'Trimestre'		=>	$Trimestre,
		));
		
		// Generation de la vue
		return $this->app->smarty->fetch( VIEW_PATH . 'bulletin' . DS . 'suivi_add.tpl');
		
	}
	
	public function suiviEditAction($suivi_id){
		
		if( $this->app->HTTPRequest->postExists('suivi') ):
			$Suivi = $this->app->HTTPRequest->postData('suivi');
			
			$Suivi['timestamp_suivi'] 	= FormatDateToTimestamp($Suivi['date_suivi']);
			$Suivi['date_suivi'] 		= FormatDateToMySQL($Suivi['date_suivi']);
			
			$this->app->db->update(PREFIX . 'scolaire_suivi', $Suivi, array('id =' => $Suivi['id']));
			
			$Suivi = $this->app->db->select('ss.*')->from(PREFIX . 'scolaire_suivi ss')->where(array('id =' => $Suivi['id']))->get_one();
			
			return $this->redirect( getLink('joueur/fiche/' . $Suivi['sportif_id'] . '?tab=scolaire'), 3, $this->lang['Suivi_modifie']);		
			
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		$Suivi = $this->app->db->get_one(PREFIX . 'scolaire_suivi', array('id =' => $suivi_id));
		
		// Recuperation des informations du trimestre
		$Trimestre = $this->app->db->get_one(PREFIX . 'scolaire_trimestre', array('id =' => $Suivi['trimestre_id']) );
		
		$tmp = explode('|', $Trimestre['trimestre']);
        $Trimestre['num'] = $tmp[0];
        $Trimestre['annee'] = $tmp[1];
		
		// Envoie au template
		$this->app->smarty->assign(array(
			'Trimestre'		=>	$Trimestre,
			'Suivi'			=>	$Suivi,
		));
		
		// Generation de la vue
		return $this->app->smarty->fetch( VIEW_PATH . 'bulletin' . DS . 'suivi_edit.tpl');
		
	}
	
	public function suiviDeleteAction($suivi_id){
		$Suivi = $this->app->db->select('ss.*')->from(PREFIX . 'scolaire_suivi ss')->where(array('id =' => $suivi_id))->get_one();
		$this->app->db->delete(PREFIX . 'scolaire_suivi', $suivi_id);
		return $this->redirect( getLink('joueur/fiche/' . $Suivi['sportif_id'] . '?tab=scolaire'), 3, $this->lang['Suivi_supprime']);
	}
	
	public function suiviDetailAction($suivi_id){
		$Suivi = $this->app->db->select('ss.*')->from(PREFIX . 'scolaire_suivi ss')->where(array('id =' => $suivi_id))->get_one();
		
		// Envoie au template
		$this->app->smarty->assign(array(
			'Suivi'			=>	$Suivi,
		));
		
		// Generation de la vue
		return $this->app->smarty->fetch( VIEW_PATH . 'bulletin' . DS . 'suivi_detail.tpl');
	}
	
	/**
	*	Affiche et traite la formulaire d'ajout d'une formation
	*	a un sportif
	*	@param int sportif_id
	*	@return string code html de la page
	*/
	public function formationAddAction($sportif_id){
		
		$this->load_manager('etabScolaire');
		
		if( $this->app->HTTPRequest->postExists('formation') ):
			$Formation = $this->app->HTTPRequest->postData('formation');
			
			// Formatage des dates
			$Formation['timestamp_debut'] 	= FormatDateToTimestamp($Formation['date_debut']);
			$Formation['date_debut'] 	= FormatDateToMySQL($Formation['date_debut']);
			$Formation['timestamp_fin'] 		= FormatDateToTimestamp($Formation['date_fin']);
			$Formation['date_fin'] 		= FormatDateToMySQL($Formation['date_fin']);
			
			$this->app->db->insert(PREFIX . 'scolaire_formation', $Formation);
			
			return $this->redirect( getLink('joueur/fiche/' . $Formation['sportif_id'] . '?tab=scolaire'), 3, $this->lang['Formation_ajoutee']);
			
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		$Etablissements =	$this->manager->etabScolaire->getAll();
		
		// Envoie au template
		$this->app->smarty->assign(array(
			'Etabs'			=>	$Etablissements,
			'Sportif_id'	=>	$sportif_id,
		));
		
		// Generation de la vue
		return $this->app->smarty->fetch( VIEW_PATH . 'bulletin' . DS . 'formation_add.tpl');	
	}
	
	public function formationEditAction($formation_id){
		
		$this->load_manager('etabScolaire');
		
		if( $this->app->HTTPRequest->postExists('formation') ):
			$Formation = $this->app->HTTPRequest->postData('formation');
			
			// Formatage des dates
			$Formation['timestamp_debut'] 	= FormatDateToTimestamp($Formation['date_debut']);
			$Formation['date_debut'] 	= FormatDateToMySQL($Formation['date_debut']);
			$Formation['timestamp_fin'] 		= FormatDateToTimestamp($Formation['date_fin']);
			$Formation['date_fin'] 		= FormatDateToMySQL($Formation['date_fin']);
			
			$this->app->db->update(PREFIX . 'scolaire_formation', $Formation, array('id =' => $Formation['id']));
			
			return $this->redirect( getLink('joueur/fiche/' . $Formation['sportif_id'] . '?tab=scolaire'), 3, $this->lang['Formation_modifiee']);
			
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		$Formation		=	$this->app->db->get_one(PREFIX . 'scolaire_formation', array('id =' => $formation_id));	
		$Etablissements	=	$this->manager->etabScolaire->getAll();
		
		// Envoie au template
		$this->app->smarty->assign(array(
			'Etabs'			=>	$Etablissements,
			'Formation'		=>	$Formation,
		));
		
		// Generation de la vue
		return $this->app->smarty->fetch( VIEW_PATH . 'bulletin' . DS . 'formation_edit.tpl');	
	}
	
	public function formationDetailAction($formation_id){
		
		$Formation	=	$this->app->db->select('sf.*, es.nom as etablissement')
						->from(PREFIX . 'scolaire_formation sf')
						->left_join(PREFIX . 'etab_scolaire es','sf.etablissement_id = es.id')
						->where(array('sf.id =' => $formation_id))
						->get_one();	
		
		
		// Envoie au template
		$this->app->smarty->assign(array(
			'Formation'		=>	$Formation,
		));
		
		// Generation de la vue
		return $this->app->smarty->fetch( VIEW_PATH . 'bulletin' . DS . 'formation_detail.tpl');	
	}
	
	public function formationDeleteAction($formation_id){
		$Formation = $this->app->db->select('sf.*')->from(PREFIX . 'scolaire_formation sf')->where(array('sf.id =' => $formation_id))->get_one();
		$this->app->db->delete(PREFIX . 'scolaire_formation', $formation_id);
		return $this->redirect( getLink('joueur/fiche/' . $Formation['sportif_id'] . '?tab=scolaire'), 3, $this->lang['Formation_supprimee']);
	}
}