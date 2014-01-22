<?php

class suiviMedicalController extends Controller{
	
	public function deleteAction( $id ){
		
		if( $_SESSION['acl']['gest_suivimed'] != 1 ):
			return $this->redirect( getLink('index/index'),0,'');
		endif;
		
		$Suivi = $this->app->db->get_one(PREFIX . 'joueur_medical', array('id =' => $id));
		$this->app->db->delete(PREFIX . 'joueur_medical', $id);
		$this->app->db->delete(PREFIX . 'joueur_medical_commentaire', null, array('suivi_id =' =>  $id) );
		
		return $this->redirect( getLink('joueur/fiche/' . $Suivi['joueur_id']) , 3, $this->lang['Suivi_med_supprime']);
	}
	
	public function editAction( $id ){
		
		if( $_SESSION['acl']['gest_suivimed'] != 1 ):
			return $this->redirect( getLink('index/index'),0,'');
		endif;
		
		if( $this->app->HTTPRequest->postExists('suivi') ):
		
			$Suivi = $this->app->HTTPRequest->postData('suivi');
			
			$Suivi['date_medical'] = FormatDateToTimestamp($Suivi['date_medical']);
			
			if( !empty($Suivi['dispo_rugby']) ) $Suivi['dispo_rugby'] = FormatDateToTimestamp($Suivi['dispo_rugby']);
			if( !empty($Suivi['dispo_muscu']) ) $Suivi['dispo_muscu'] = FormatDateToTimestamp($Suivi['dispo_muscu']);
			
			$this->app->db->update(PREFIX . 'joueur_medical', $Suivi, array('id =' => $Suivi['id']));
			
			return $this->redirect( getLink("joueur/fiche/" . $Suivi['joueur_id'] . "?tab=suivimedical"), 3, $this->lang['Donnees_enregistrees'] );
		endif;
		
		
		printform:
		
		$this->app->smarty->assign(array(
			'Suivi'		=>	$this->app->db->get_one(PREFIX . 'joueur_medical', array('id =' => $id)),
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'suiviMedical' . DS . 'edit.tpl');
	}
    
    /**
    * Affiche les details d'un suivi medical dans la fiche joueur sous forme de boite de dialog
    * 
    */
    public function getDetailAction(){
        $this->load_manager('SuiviMedical');
        $this->load_model('SuiviMedical');
        
        $Commentaires = $this->app->db->select('tjmc.*, tu.identifiant')->from(PREFIX . 'joueur_medical_commentaire tjmc')->left_join(PREFIX . 'user tu', 'tjmc.add_by = tu.id')->where(array('suivi_id =' => $this->app->HTTPRequest->getData('suivi_id')))->get();
        
		
		$this->app->smarty->assign(array(
			'Commentaires'		=>	$Commentaires,
			'Suivi'				=>	new SuiviMedical($this->manager->SuiviMedical->getById($this->app->HTTPRequest->getData('suivi_id')))
		));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'suiviMedical' . DS . 'detail_for_fiche_joueur.tpl');
    }
    
    /**
    * Enregistre un commentaire
    * 
    * @param mixed $suivi_id
    */
    public function addCommentaireAction( $suivi_id ){
        $commentaire = $this->registry->HTTPRequest->postData('commentaire');
        $joueur_id = $this->registry->HTTPRequest->postData('joueur_id');
        
        $commentaire['add_by'] = $_SESSION['utilisateur']['id'];
        $commentaire['date_saisie'] = time();
        
        $this->registry->db->insert(PREFIX . 'joueur_medical_commentaire', $commentaire);
        
        return $this->redirect( getLink('joueur/fiche/' . $joueur_id .'?tab=suivimedical&suivi='.$suivi_id), $this->lang['Commentaire_ajoute'] );
    }
    
    public function addAction($joueur_id){
		
		if( $_SESSION['acl']['gest_suivimed'] != 1 ):
			return $this->redirect( getLink('index/index'),0,'');
		endif;
		
		if( $this->app->HTTPRequest->postExists('suivi') ):
		
			$this->load_model('SuiviMedical');
			$this->load_manager('SuiviMedical');
			
			$Suivi = new SuiviMedical( $this->registry->HTTPRequest->postData('suivi') );
			$Suivi->joueur_id = $joueur_id;
			$Suivi->formatForSave();
			$this->manager->SuiviMedical->save($Suivi);
			
			return $this->redirect( getLink("joueur/fiche/" . $joueur_id . "?tab=suivimedical"), 3, $this->lang['Donnees_enregistrees'] );
		endif;
		
		printform:
		
		$this->app->smarty->assign(array(
			'joueur_id'		=>	$joueur_id,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'suiviMedical' . DS . 'add.tpl');
    }
	
	public function listQuestionnaireAction(){
	
	}
	
	/**
	*	Affiche et traite le formulaire d ajout de questionnaire medical
	*
	*/
	public function addQuestionnaireAction(){
		
		if( $this->app->HTTPRequest->postExists('Questionnaire') ):
			$this->load_model('questionnaire');
			$this->load_manager('questionnaire');
			
			$Questionnaire = new questionnaire($this->app->HTTPRequest->postData('Questionnaire'));
			
			if( $Questionnaire->isValid() !== true ):
				goto printform;
			endif;
			
			$Questionnaire->creat_by = $_SESSION['utilisateur']['id'];
			$Questionnaire->date_creat = time();
			
			$Questionnaire->id = $this->manager->questionnaire->save($Questionnaire);
			
			return $this->redirect( getLink('suiviMedical/editQuestionnaire/'. $Questionnaire->id),3,$this->lang['Questionnaire_ajoute']);
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		return $this->app->smarty->fetch( VIEW_PATH . 'suiviMedical' . DS . 'addQuestionnaire.tpl');
		
	}
	
	public function editQuestionnaireAction(){
	
	}
	
	public function detailQuestionnaireAction( $Questionnaire_id ){
		
		$this->load_manager('questionnaire');
		$this->load_manager('question');
		
		$Questionnaire	=	$this->manager->questionnaire->getById( $Questionnaire_id );
		$Questions 		=	$this->manager->question->getByQuestionnaireId( $Questionnaire_id) ;
		
		$this->app->smarty->assign(array(
			'Questionnaire'		=>	$Questionnaire,
			'Questions'			=>	$Questions,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'questionnaire' . DS . 'detailQuestionnaire.tpl' );
		
	}
	
	public function addQuestionAction( $Questionnaire_id ){
	
		if( $this->app->HTTPRequest->postExists('Question') ):
			$this->load_model('question');
			$Question = new question( $this->app->HTTPRequest->postData('Question') );
			
			$Result = $Question->isValid();
			
			if( $Result !== true ):
				goto printform;
			endif;
			
			if( isset($Question->multi_reply) ):
				$Question->multi_reply	=	1;
			else:
				$Question->multi_reply	=	0;
			endif;
			
			$this->load_manager('question');
			
			$this->manager->question->save( $Question );
			
			return $this->redirect( getLink('suiviMedical/detailQuestionnaire/'. $Questionnaire_id), 3, $this->lang['Question_ajoutee']);
			
		endif;
		
		printform:
		
		$this->getFormValidatorJs();
		
		$this->app->smarty->assign(array(
			'questionnaire_id'		=>	$Questionnaire_id,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'suiviMedical' . DS . 'addQuestion.tpl');
		
		
	}
	
}