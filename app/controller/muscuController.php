<?php

class muscuController extends Controller{

	public function indexAction(){
		$mController = $this->load_controller('musculationController');
		return $mController->indexAction();
	}

	/**
	 * Gere le formulaire d'ajout de cycle
	 * @return mixed HTML CODE
	 */
	public function cycleAddAction(){
		
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		// Traitement du formulaire
		if( $this->app->HTTPRequest->postExists('cycle') ):
			$Cycle = $this->app->HTTPRequest->postData('cycle');
			
			// Verification que au moins un joueur est selectionné
			if( !$this->app->HTTPRequest->postExists('joueurs') ):
				$this->app->smarty->assign('error_form' , $this->lang['Aucun_joueurs_selectionnes']);
				goto printform;
			else:
				$Joueurs = $this->app->HTTPRequest->postData('joueurs');
			endif;
			
			// Verification au moins une seance
			if( !isset($Cycle['seance']) || count($Cycle['seance']) == 0 ):
				$this->app->smarty->assign('error_form' , $this->lang['Aucune_seance_pour_ce_cycle']);
				goto printform;
			else:
				$Seances = $Cycle['seance'];
				unset($Cycle['seance']);
			endif;
			
			// Verification pour chaque seance qu'il comporte au moins un exercice
			foreach( $Seances as $Row ):
				if( !isset($Row['exo']) ):
					$this->app->smarty->assign('error_form' , $this->lang['Aucune_exercice_pour_seance']);
					goto printform;
				endif;
			endforeach;
			
			// Enregistrement
			$Cycle['date_debut'] 	= FormatDateToTimestamp($Cycle['date_debut']);
			$Cycle['date_fin'] 		= FormatDateToTimestamp($Cycle['date_fin']);
			
			$cycle_id = $this->app->db->insert( PREFIX . 'muscu_cycle', $Cycle);
			
			foreach( $Joueurs as $key => $value):
				$this->app->db->insert(PREFIX . 'muscu_cycle_joueur', array('cycle_id' => $cycle_id, 'joueur_id' => $value) );
			endforeach;
			
			foreach( $Seances as $Seance ):
				
				$Exercices = $Seance['exo'];
				$Seance['nom'] = $Seance['modele_nom'];
				unset($Seance['modele_nom'], $Seance['exo']);
				$Seance['cycle_id'] = $cycle_id;
				
				if( isset($Seance['modele']) ):
					$Seance['is_model'] = 1;	
					unset($Seance['modele']);
				endif;
				
				// Enregistrement de la seance dans la base
				$sid = $this->app->db->insert(PREFIX . 'muscu_cycle_seance', $Seance);
				
				// On boucle sur les exercices pour les enregistrés
				foreach( $Exercices as $Row ):
					if( $Row['poids'] != '' && $Row['repetition'] != '' && $Row['serie'] != '' ):
						$Row['seance_id'] = $sid;
						//var_dump($Row);
						$this->app->db->insert(PREFIX . 'muscu_cycle_seance_exercice', $Row);
					endif;
				endforeach;
				
			endforeach;
			
            return $this->redirect( getLink('muscu/cycleListe'), 3, $this->lang['Cycle_ajoute']);
            
		endif;
		
		printform:
		// Affichage du formulaire
		if( $this->app->HTTPRequest->getExists('joueur_id') ) $joueur_id = $this->app->HTTPRequest->getData('joueur_id');
		else $joueur_id = NULL;
		
		if( is_null($joueur_id) ):
			$this->load_manager('joueur');
			$this->app->smarty->assign( 'Joueurs', $this->manager->joueur->getAll( array('actif =' => 1)) );
		endif;
		
		$this->getFormValidatorJs();
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_add.tpl');
		
	}
	
	public function cycleSeanceAddAction(){
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		$seance_number = $this->app->HTTPRequest->getData('seance_number');
		
		// Recuperation des models.
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('is_model =' => 1) );
		
		$this->app->smarty->assign(array(
			'seance_number'		=>	$seance_number,
			'Seances'			=>	$Seances,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_seance_add.tpl');
	}
	
	public function getLigneForTabExoAction(){
		
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		$ligne_numero	=	$this->app->HTTPRequest->getData('ligne_number');
		$seance_numero	=	$this->app->HTTPRequest->getData('seance_number');
		
		$Exercices = $this->app->db->get(PREFIX . 'musculation_exercice', null, 'nom');
		
		$this->app->smarty->assign(array(
			'Ligne'		=>	$ligne_numero,
			'Seance'	=>	$seance_numero,
			'Exercices'	=>	$Exercices,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_seance_exercice_add.tpl'); 
		
	}
	
	/**
	 * Fonction appeller dans la formulaire d'ajout de model de seance
	 * Retourne un ligne du tableau pour ajouter un exercice a la seance
	 * */
	public function getLigneForTabExo2Action(){
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		$nb_exo	=	$this->app->HTTPRequest->getData('nb_exo');
		
		$Exercices = $this->app->db->get(PREFIX . 'musculation_exercice', null, 'nom');
		
		$this->app->smarty->assign(array(
			'Ligne'		=>	$nb_exo,
			'Exercices'	=>	$Exercices,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'seance_exercice_add.tpl'); 
		
	}
	
	public function getModelSeanceAction(){
		$Seance_id = $this->app->HTTPRequest->getData('seance_id');
		
		$Seance 	= 	$this->app->db->get_one(PREFIX . 'muscu_cycle_seance', array('id =' => $Seance_id, 'is_model =' => 1) );
		$Exercices	=	$this->app->db->select('tmcse.*, tme.nom as exercice_nom')
						->from(PREFIX . 'muscu_cycle_seance_exercice tmcse')
						->left_join('musculation_exercice tme','tmcse.exercice_id = tme.id')
						->where(array('tmcse.seance_id =' => $Seance_id))
						->get();
		
		// Recuperation des models.
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('is_model =' => 1) );
		
		$this->app->smarty->assign(array(
			'Seance'		=>	$Seance,
			'Exercices'		=>	$Exercices,
			'seance_number'	=>	$this->app->HTTPRequest->getData('seance_number'),
			'Seances'		=>	$Seances,	
		));
		//var_dump($Exercices);
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_seance_exercice_send_modele.tpl');
	}
	
	public function cycleEditAction($cycle_id){
		
	}
	
	/**
	 * Gere la suppression d un cycle
	 */
	public function cycleDeleteAction($cycle_id){
		
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		$this->app->db->delete(PREFIX . 'muscu_cycle', $cycle_id);
		$this->app->db->delete(PREFIX . 'muscu_cycle_joueur', null, array('cycle_id =' => $cycle_id) );
		
		
		// Recuperation des seances du cycle qui ne sont pas un model
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('cycle_id =' => $cycle_id, 'is_model =' => 0));
		
		// Suppression des seances qui ne sont pas model
		$this->app->db->delete(PREFIX . 'muscu_cycle_seance', null, array('cycle_id =' => $cycle_id, 'is_model =' => 0) );
		
		// On boucle sur les seances pour supprimer les exercices liés au seance qui ne sont pas model
		foreach($Seances as $Row):
			$this->app->db->delete(PREFIX . 'muscu_cycle_seance_exercice', null, array('seance_id =' => $Row['id']));
		endforeach;
		
		return $this->redirect( getLink('muscu/cycleListe'),3,$this->lang['Cycle_supprime']);
	}
	
	/**
	 * Affiche la liste des cycles
	 */
	public function cycleListeAction(){
		
        if( $this->app->HTTPRequest->getExists('all') )
            $Cycles = $this->app->db->get(PREFIX . 'muscu_cycle');
        else
		    $Cycles = $this->app->db->get(PREFIX . 'muscu_cycle', array('date_fin >' => time()));
		
		$this->app->smarty->assign(array(
			'Cycles'		=>	$Cycles,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_liste.tpl');		
	}
	
	/**
	 * Permet l'ajout d'une seance a cycle en se basant sur les seances créer lors du cycle
	 */
	public function addSeanceAtCycleAction( $cycle_id ){
		
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		if( $this->app->HTTPRequest->postExists('seance') ):
		
			$Seance	= $this->app->HTTPRequest->postData('seance');
			$Exos	= $this->app->HTTPRequest->postData('exercice');
			$LJoueurs = $this->app->HTTPRequest->postData('list_joueurs');
			
			$Joueurs = unserialize($LJoueurs);
						
			// Enregistrement de la seances
			$i = 0;
			foreach($Joueurs as $joueur):
				$Joueurs[$i]['seance_id'] =	$this->app->db->insert(PREFIX . 'muscu_seance', 
												array(
													'joueur_id'		=>	$joueur['id'],
													'date_seance'	=>	FormatDateToTimestamp($Seance['date']),
													'cycle_id'		=>	$cycle_id,
													'seance_id'		=>	$Seance['seance_id'],
													'date_s'		=> FormatDateToMySQL($Seance['date']),
												)
				);
				$i++;
			endforeach;

			// Enregistrements des exos
			// On parcours chaque exercices
			foreach( $Exos as $Data ):
				// Second boucle pour parcourir le tab de resultat
				foreach( $Data as $Result ):
				
					$seance_id = NULL;
					
					// On parcours la liste des joueurs
					foreach( $Joueurs as $Joueur):
						if( $Joueur['id'] == $Result['joueur_id']):
							$seance_id = $Joueur['seance_id'];
						endif;
					endforeach;
					
					$this->app->db->insert(PREFIX . 'muscu_seance_exo_resultat', 
						array(
							'seance_id'		=>	$seance_id,
							'exercice_id'	=>	$Result['exercice_id'],
							'poids'			=>	$Result['poids'],
							'serie'			=>	$Result['serie'],
							'repetition'	=>	$Result['repetition'],
						)
					);
					
				endforeach;
			endforeach;
			
			return $this->redirect( getLink('musculation/index'),3,$this->lang['Seance_ajoute'] );
			
		endif;
		
		//	Recuperaion des infors sur le cycle
		$Cycle = $this->app->db->get_one(PREFIX . 'muscu_cycle', array('id =' => $cycle_id) );
		
		//	Recuperation des seances enregistrer pour ce cycle
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('cycle_id =' => $cycle_id) );
		
		//	Recuperation des joueurs inscrit a ce cycle
		$Joueurs = $this->app->db->select('j.id, j.prenom, j.nom')->from(PREFIX . 'muscu_cycle_joueur mcj')->right_join(PREFIX . 'joueur j', 'mcj.joueur_id = j.id')->where(array('mcj.cycle_id =' => $cycle_id))->order('j.nom')->get();
		
		//	Envoie des données au tpl
		$this->app->smarty->assign(array(
			'Cycle'			=>	$Cycle,
			'Seances'		=>	$Seances,
			'Joueurs'		=>	$Joueurs,
			'List_joueurs'	=>	serialize($Joueurs),
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_add_seance_at_cycle.tpl');
	}
	
	function getSeanceAndJoueurAction(){
		
		$Seance_id 	= $this->app->HTTPRequest->getData('seance_id');
		$Cycle_id 	= $this->app->HTTPRequest->getData('cycle_id');
		
		//Recuperation des exo
		$Exercices	=	$this->app->db->select('mcse.*, me.nom as ME_NOM')
						->from(PREFIX . 'muscu_cycle_seance_exercice mcse')
						->left_join(PREFIX . 'musculation_exercice me','mcse.exercice_id = me.id')
						->where(array('seance_id =' => $Seance_id))
						->get();
		
		// Recuperation des joueurs
		$Joueurs = $this->app->db->select('j.id, j.prenom, j.nom')->from(PREFIX . 'muscu_cycle_joueur mcj')->left_join(PREFIX . 'joueur j', 'mcj.joueur_id = j.id')->where(array('mcj.cycle_id =' => $Cycle_id))->order('j.nom')->get();
		
		$this->app->smarty->assign(array(
			'Exercices'		=>	$Exercices,
			'Joueurs'		=>	$Joueurs,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_add_seance.tpl');
	}
	
	/**
	 * Permet l'affichage des details d'une seance par rapport a son ID
	 * Fonction appelle dans la fiche joueur / tab musculation
	 * @param : $seance_id
	 * @return mixed HTML	 	 
	 * */
	public function getExerciceBySeanceIdAction( $seance_id ){
		
		$Exercices	=	$this->app->db->select('mser.*, me.nom AS ME_NOM')
						->from(PREFIX . 'muscu_seance_exo_resultat mser')
						->left_join(PREFIX . 'musculation_exercice me','mser.exercice_id = me.id')
						->where(array('seance_id =' => $seance_id))
						->get();
						
		//	Envoie des données au tpl
		$this->app->smarty->assign(array(
			'Exercices'		=>	$Exercices,
			'seance_id'		=>	$seance_id,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'exercice_by_seanceid.tpl');
		
	}
	
	public function detailCycleAction( $cycle_id ){
		
		// Recuperation information cycle
		$Cycle	=	$this->app->db->get_one(PREFIX . 'muscu_cycle', array('id =' => $cycle_id));
		
		// Joueur participant
		$Joueurs = $this->app->db->select('j.id, j.prenom, j.nom')->from(PREFIX . 'muscu_cycle_joueur mcj')->left_join(PREFIX . 'joueur j', 'mcj.joueur_id = j.id')->where(array('mcj.cycle_id =' => $cycle_id))->order('j.nom')->get();
		
		// Recuperation des seances et les exos
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('cycle_id =' => $cycle_id));
		$i=0;
		foreach($Seances as $Data):
			$Seances[$i]['exos']	=	$this->app->db->select('MCSE.*, ME.nom as ME_NOM')
										->from(PREFIX . 'muscu_cycle_seance_exercice MCSE')
										->left_join(PREFIX . 'musculation_exercice ME','MCSE.exercice_id = ME.id')
										->where(array('MCSE.seance_id =' => $Data['id']))
										->get();
			$i++;
		endforeach;
        
        // Recuperation des seances effectuées
        $Seances_effectuees = $this->app->db->select('DISTINCT(date_seance)')->from(PREFIX . 'muscu_seance')->where(array('cycle_id =' => $cycle_id))->get();
		
		$this->app->smarty->assign(array(
			'Cycle'		    =>	$Cycle,
			'Joueurs'	    =>	$Joueurs,
			'Seances'	    =>	$Seances,
            'Seances_eff'   =>  $Seances_effectuees,
		));
		
		if( $this->app->HTTPRequest->getExists('pdf') ):
		
			// Deuxiemes boucles sur les seances pour construire le tableaux des exos
			$Exercices = array();
		
			$i=0;
			foreach($Seances as $Data):
				$Seances[$i]['exos']	=	$this->app->db->select('MCSE.exercice_id,ME.*')
											->from(PREFIX . 'muscu_cycle_seance_exercice MCSE')
											->left_join(PREFIX . 'musculation_exercice ME','MCSE.exercice_id = ME.id')
											->where(array('MCSE.seance_id =' => $Data['id']))
											->get();
				
				
				// On boucles sur les exos recuperer
				foreach( $Seances[$i]['exos'] as $Row ):
					if( !isset($Exercices[$Row['exercice_id']]) ):
						$Exercices[$Row['exercice_id']] = $Row;
						$Exercices[$Row['exercice_id']]['Photos'] = $this->app->db->get(PREFIX . 'muscu_exercice_photo', array('exercice_id =' => $Row['exercice_id']), 'ordre');
					endif;
				endforeach;
				
				$i++;
			endforeach;
			//var_dump($Exercices);
			$this->app->smarty->assign(array(
				'Exercices'		=>	$Exercices,	
			));
			
			require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'mpdf' . DS . 'mpdf.php';
			$mpdf=new mPDF('c');
			$mpdf->WriteHTML($this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_detail.tpl'),2);
			$mpdf->Output();
			exit;
		else:
			return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'cycle_detail.tpl');
		endif;
	}
	
	/**
	 * Affiche et traite l' ajout d'une seance pour un joueur
	 * @param type $joueur_id
	 * @return type
	 */
	public function addSeanceByJoueurIdAction( $joueur_id ){
		
		if( $this->app->HTTPRequest->postExists('cycle') ):
		
			$Data = $this->app->HTTPRequest->postData('cycle');
			$Seance = $Data['seance'][0];
			$Exercices = $Data['seance'][0]['exo'];
			
			// Enregistrement seance
			$SID = $this->app->db->insert(PREFIX . 'muscu_seance', array('joueur_id' => $joueur_id, 'date_seance' => FormatDateToTimestamp($Seance['date_seance']), 'date_s' => FormatDateToMySQL($Seance['date_seance'])) );
			
			// Enregistement des exos.
			$nb_exo = 0;
			foreach( $Exercices as $Row):
				if( $Row['exercice_id'] != '' && $Row['poids'] != '' && $Row['repetition'] != '' && $Row['serie'] != '' ):
					$Row['seance_id'] = $SID;
					$this->app->db->insert(PREFIX . 'muscu_seance_exo_resultat', $Row);
					$nb_exo++;
				endif;
			endforeach;
			
			if( $nb_exo == 0 ):
				$this->app->db->delete(PREFIX . 'muscu_seance', $SID);
				return $this->redirect( getLink('joueur/fiche/' . $joueur_id), 3, $this->lang['Erreur_enregistrement_aucun_exo']);
			endif;
			
			return $this->redirect( getLink('joueur/fiche/' . $joueur_id), 3, $this->lang['Seance_enregistree']);
			
		endif;
		
		$this->getFormValidatorJs();
		
		$this->app->smarty->assign(array(
			'seance_number'		=>	0,
			'joueur'			=>	$this->app->db->get_one(PREFIX . 'joueur', array('id =' => $joueur_id)),
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'seance_by_joueur.tpl');
	}
	
	public function deleteSeanceByIdAction($SID){
		$tmp = explode('_', $SID);
		$SID = $tmp[1];
		
		$this->app->db->delete(PREFIX . 'muscu_seance_exo_resultat', null, array('seance_id =' => $SID));
		$this->app->db->delete(PREFIX . 'muscu_seance', $SID);
	}
	
	/**
	 * @desc Affiche la liste des seances modeles
	 * @return string Code Html de la page
	 */
	public function seanceListeAction(){
		
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('is_model =' => 1));
		
		$this->app->smarty->assign(array(
			'Seances'		=>	$Seances,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'seance_liste.tpl');
	}
	
	/**
	 * Affiche et traite le formulaire d'ajout d un modele de seance
	 * 
	 * 
	 */
	public function seanceAddAction(){
		
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
		if( $this->app->HTTPRequest->postExists('seance') ):
			$Seance = $this->app->HTTPRequest->postData('seance');
			
			if( empty($Seance['nom']) ):
				goto printform;
			endif;
			
			if( count($Seance['exo']) == 0 ):
				goto printform;
			endif;
			
			// Stockage des exercices dans une variable
			$Exos = $Seance['exo'];
			
			// Ajout/suppression des entres pour l enregistrement en base
			unset($Seance['exo'], $Seance['modele']);
			$Seance['is_model'] = 1;
			$Seance['cycle_id'] = 0;
					
			// Enregistrement de la seance dans la base
			$Seance_id = $this->app->db->insert(PREFIX . 'muscu_cycle_seance', $Seance);
			
			// Parcours du tableau $Exos pour enregistrement dans la base
			foreach( $Exos as $Row ):
				if( $Row['poids'] != '' && $Row['repetition'] != '' && $Row['serie'] != '' && !empty($Row['exercice_id']) ):
					$Row['seance_id'] = $Seance_id;						
					$this->app->db->insert(PREFIX . 'muscu_cycle_seance_exercice', $Row);
				endif;
			endforeach;
			
			return $this->redirect( getLink('muscu/seanceListe'), 3, $this->lang['Seance_ajoute']);
		endif;
		
		if( $this->app->HTTPRequest->getExists('exercice') ):
			$DataGet = $this->app->HTTPRequest->getData('exercice');
			
			$Exercices = array();
			foreach( $DataGet as $k => $v ):
				$Exercices[] = $this->app->db->get_one(PREFIX . 'musculation_exercice', array('id =' => $v));
			endforeach;
		
			$this->app->smarty->assign(array(
				'Exos'		=>	$Exercices,
				'Exercices'	=>	$this->app->db->get(PREFIX . 'musculation_exercice', null, 'nom'),
				'NbExos'	=>	count($Exercices) + 1,
				'ctitre'	=>	$this->lang['Nouveau_modele_de_seance'],
			));
			
		endif;
		
		printform:
		$this->getFormValidatorJs();
		return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'seance_add.tpl');
	}
	
	public function seanceEditAction($SID){
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
	}
	
    /**
    * Supprime une seance d'un model
    * 
    * @param mixed $SID
    * @return mixed HTML CODE
    */
	public function seanceDeleteAction($SID){
        
		if( $_SESSION['acl']['gest_muscu'] != 1 ) $this->redirect( getLink("index/index"),0,'');
		
        $this->app->db->update(PREFIX . 'muscu_cycle_seance', array('id' => $SID, 'is_model' => 0));
        return $this->redirect( getLink('muscu/seanceListe'),3,$this->lang['Seance_supprime_modele'] );
        
    }
	
	/**
	 * @desc : affiche et traite le formulaire d'ajout d'une seance a un cycle
	 * @param int $CID id du cycle
	 */
	public function addSeanceInCycleAction( $CID ){
		
		if( $this->app->HTTPRequest->postExists('cycle') ):
			$Cycle = $this->app->HTTPRequest->postData('cycle');
			
			// Verification au moins une seance
			if( !isset($Cycle['seance']) || count($Cycle['seance']) == 0 ):
				$this->app->smarty->assign('error_form' , $this->lang['Aucune_seance_pour_ce_cycle']);
				goto printform;
			else:
				$Seances = $Cycle['seance'];
				unset($Cycle['seance']);
			endif;
			
			// Verification pour chaque seance qu'il comporte au moins un exercice
			foreach( $Seances as $Row ):
				if( !isset($Row['exo']) ):
					$this->app->smarty->assign('error_form' , $this->lang['Aucune_exercice_pour_seance']);
					goto printform;
				endif;
			endforeach;
			
			foreach( $Seances as $Seance ):
				
				$Exercices = $Seance['exo'];
				$Seance['nom'] = $Seance['modele_nom'];
				unset($Seance['modele_nom'], $Seance['exo']);
				$Seance['cycle_id'] = $CID;
				
				if( isset($Seance['modele']) ):
					$Seance['is_model'] = 1;	
					unset($Seance['modele']);
				endif;
				
				// Enregistrement de la seance dans la base
				$sid = $this->app->db->insert(PREFIX . 'muscu_cycle_seance', $Seance);
				
				// On boucle sur les exercices pour les enregistrés
				foreach( $Exercices as $Row ):
					if( $Row['poids'] != '' && $Row['repetition'] && $Row['serie'] ):
						$Row['seance_id'] = $sid;
						$this->app->db->insert(PREFIX . 'muscu_cycle_seance_exercice', $Row);
					endif;
				endforeach;
				
			endforeach;
			
            return  $this->redirect( getLink('muscu/detailCycle/'. $CID),3, $this->lang['Seance_ajoute']);
            
		endif;
		
		printform:
		
		// Recuperation des models.
		$Seances = $this->app->db->get(PREFIX . 'muscu_cycle_seance', array('is_model =' => 1) );
		
		$this->app->smarty->assign(array(
			'seance_number'		=>	$this->app->db->count(PREFIX . 'muscu_cycle_seance', array('cycle_id =' => $CID)) + 1,
			'Seances'			=>	$Seances,
            'CID'               =>  $CID,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'muscu' . DS . 'add_seance_in_cycle.tpl');
	}
    
    public function removeSeanceInCycleAction($SID){
        
        // Recuperation de la seance
        $Data = $this->app->db->get_one(PREFIX . 'muscu_cycle_seance', array('id =' => $SID) );
        
        // Suppression de la seance
        if( $Data['is_model'] == 0){
            $this->app->db->delete(PREFIX . 'muscu_cycle_seance', $SID);
        }else{
            // Mise a jour de la seance en cycle_id = NULL
            $this->app->db->query('UPDATE '. PREFIX . 'muscu_cycle_seance SET cycle_id = NULL WHERE id = '. $SID);            
        }
        
       return $this->redirect( getLink('muscu/cycleDetail/'. $Data['cycle_id']),3,$this->lang['Seance_retiree']); 
    }
    
    public function testAddAction(){
        
        if( $this->app->HTTPRequest->postExists( 'test' ) ){
            
            $test = $this->app->HTTPRequest->postData( 'test' );
            
            // Sauverde du test
            $test_id = $this->app->db->insert(PREFIX . 'muscu_test', array('date_test' => FormatDateToTimestamp($test['date_test']), 'creat_on' => $test['creat_on'], 'creat_by' => $test['creat_by'], 'edit_on' => $test['edit_on'], 'edit_by' => $test['edit_by'], 'exo_liste' => base64_decode($test['exo_liste'])) );
            unset($test['date_test'],$test['creat_by'],$test['creat_on'],$test['edit_by'],$test['edit_on'], $test['exo_liste']);
            
            // Sauvegarde des resultat par rapport au utilisateur
            foreach($test as $Row):
            	if( isset($Row['present']) ):
					$this->app->db->insert(PREFIX . 'muscu_test_joueur', array('test_id' => $test_id, 'joueur_id' =>$Row['joueur_id']) );
	                // On reparcourt les valeurs pour l'array contenant l exo_id et le resultat.
	                foreach($Row as $k => $v):
	                    if( is_array($v) ):
	                        // On complete les infos et on enregistre en base
	                        $v['test_id'] = $test_id;
	                        $v['joueur_id'] = $Row['joueur_id']; 
	                        $this->app->db->insert(PREFIX . 'muscu_test_resultat', $v);
	                    endif;
	                endforeach;
	            endif;
                
            endforeach;
                        
            //return $this->redirect( getLink('muscu/testListe') ,3 ,$this->lang['Test_ajoute']);
        }
        
        print_form:
        $this->app->smarty->assign(array(
            'Exercices'      =>    $this->app->db->get(PREFIX . 'musculation_exercice'),
            'Joueurs'        =>  $this->app->db->get(PREFIX . 'joueur', array('date_entree <' => time()), 'nom')
        ));
        
        $this->getFormValidatorJs();
		
		return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'test_ajout_step1.tpl' );
		
        //return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'test_ajout.tpl' );
        
    }
	
	public function ajaxGetTabTestAddAction(){
		$exo = array();
		
		if( $this->app->HTTPRequest->getExists('exo1')  ):
			$tmp = $this->app->HTTPRequest->getData('exo1');
			if( !empty($tmp) ):
				$exo[1] = $this->app->HTTPRequest->getData('exo1');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo2')  ):
			$tmp = $this->app->HTTPRequest->getData('exo2');
			if( !empty($tmp) ):
				$exo[2] = $this->app->HTTPRequest->getData('exo2');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo3')  ):
			$tmp = $this->app->HTTPRequest->getData('exo3');
			if( !empty($tmp) ):
				$exo[3] = $this->app->HTTPRequest->getData('exo3');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo4')  ):
			$tmp = $this->app->HTTPRequest->getData('exo4');
			if( !empty($tmp) ):
				$exo[4] = $this->app->HTTPRequest->getData('exo4');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo5')  ):
			$tmp = $this->app->HTTPRequest->getData('exo5');
			if( !empty($tmp) ):
				$exo[5] = $this->app->HTTPRequest->getData('exo5');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo6')  ):
			$tmp = $this->app->HTTPRequest->getData('exo6');
			if( !empty($tmp) ):
				$exo[6] = $this->app->HTTPRequest->getData('exo6');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo7')  ):
			$tmp = $this->app->HTTPRequest->getData('exo7');
			if( !empty($tmp) ):
				$exo[7] = $this->app->HTTPRequest->getData('exo7');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo8')  ):
			$tmp = $this->app->HTTPRequest->getData('exo8');
			if( !empty($tmp) ):
				$exo[8] = $this->app->HTTPRequest->getData('exo8');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo9')  ):
			$tmp = $this->app->HTTPRequest->getData('exo9');
			if( !empty($tmp) ):
				$exo[9] = $this->app->HTTPRequest->getData('exo9');
			endif;
		endif;
		
		if( $this->app->HTTPRequest->getExists('exo10')  ):
			$tmp = $this->app->HTTPRequest->getData('exo10');
			if( !empty($tmp) ):
				$exo[10] = $this->app->HTTPRequest->getData('exo10');
			endif;
		endif;
		
		$Exercices = array();
		
		foreach($exo as $k => $v):
			$Exercices[] = $this->app->db->get_one(PREFIX . 'musculation_exercice', array('id =' => $v));
		endforeach;
		
		$this->app->smarty->assign(array(
            'Exercices'     =>  $Exercices,
            'Joueurs'       =>  $this->app->db->get(PREFIX . 'joueur', array('date_entree <' => time()), 'nom'),
			'exo_liste'		=>	base64_encode(serialize($exo)),
        ));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'test_ajout.tpl' );
	}
    
    public function testDetailAction($test_id){
        //if( $_SESSION['acl']['muscu_test_add'] != true) return $this->redirect(getLink('index/index'),0,'');
		
		$Test = $this->app->db->get_one(PREFIX . 'muscu_test', array('id =' => $test_id));
		
		$Exercices = array();
		$Test['exo_liste'] = unserialize($Test['exo_liste']);
		foreach($Test['exo_liste'] as $k => $v):
			$Exercices[] = $this->app->db->get_one(PREFIX . 'musculation_exercice', array('id =' => $v));
		endforeach;

		
		$Joueurs	=	$this->app->db->select('j.*')
						->from(PREFIX . 'muscu_test_joueur mtj')
						->left_join(PREFIX . 'joueur j','mtj.joueur_id = j.id')
						->where(array( 'mtj.test_id =' => $test_id ))
						->get();
        
        $tableau = '<table class="tablesorter" id="tableau_test"><thead><tr><th>'. $this->lang['Joueur'] .'</th>';
        
        foreach($Exercices as $Exercice):
            $tableau .= '<th>'. $Exercice['nom'] .'</th>';
        endforeach;
        
        $tableau .= '</tr></thead><tbody>';
        
        foreach($Joueurs as $Joueur):
            $tableau .= '<tr><td><a href="'. getLink('joueur/fiche/'. $Joueur['id']) .'">'. $Joueur['nom'] .' ' . $Joueur['prenom'] .'</a></td>';
            foreach($Exercices as $Exercice):
                $Data = $this->app->db->get_one(PREFIX . 'muscu_test_resultat', array('joueur_id =' => $Joueur['id'], 'test_id =' => $test_id, 'exercice_id =' => $Exercice['id']));
                $tableau .= '<td>'. $Data['resultat'] .'</td>';
            endforeach;
            $tableau .= '</tr>';
        endforeach;
        
        $this->app->smarty->assign(array(
            'Tableau'        =>    $tableau  . '</tbody></table>',
            'Test'            =>    $this->app->db->get_one(PREFIX . 'muscu_test', array('id =' => $test_id)),
        ));
        
        $this->app->addJS('jquery.tablesorter.min.js');
        $this->app->addCSS('tablesorter/blue/style.css');
        return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'test_detail.tpl' );
        
    }
    
    public function testListeAction(){
        if( $_SESSION['acl']['gest_muscu'] != true) return $this->redirect(getLink('index/index'),0,'');
        
        $Tests = $this->app->db->get(PREFIX . 'muscu_test', null, 'date_test DESC');
        
        $this->app->smarty->assign(array(
            'Tests'        =>    $Tests,
        ));
        
        return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'test_liste.tpl' );        
    }
    
	/**
	 * Supprime le test de la base avec toutes les liaisons
	 * 
	 */
    public function testDeleteAction($tid){
        if( $_SESSION['acl']['gest_muscu'] != true) return $this->redirect(getLink('index/index'),0,'');
        
        $this->app->db->delete(PREFIX . 'muscu_test', $tid);
		$this->app->db->delete(PREFIX . 'muscu_test_joueur',null, array('test_id =' => $tid));
        $this->app->db->delete(PREFIX . 'muscu_test_resultat',null, array('test_id =' => $tid));
        return $this->redirect( getLink('muscu/testListe'), 3, $this->lang['Test_supprime']);
    }
	
	/**
	*	Permet l ajout d'un jour dans un test
	*
	*/
	public function addJoueurInTestAction($Test_id){
		
		if( $this->app->HTTPRequest->postExists('resultat') ):
		
			$Resultat = $this->app->HTTPRequest->postData('resultat');
			
			$Joueur_id = $Resultat['joueur_id'];
			unset($Resultat['joueur_id']);
			
			// Enregistrement de l utilisateur dans la table de liaison
			$this->app->db->insert(PREFIX . 'muscu_test_joueur', array('test_id' => $Test_id, 'joueur_id' => $Joueur_id));
			
			// On boucle sur les resultats
			foreach( $Resultat as $Row ):
				if( !empty($Row['resultat']) ):
					$Row['joueur_id'] = $Joueur_id;
					$Row['test_id'] = $Test_id;
					$this->app->db->insert(PREFIX . 'muscu_test_resultat', $Row);
				endif;
			endforeach;
			
			return $this->redirect( getLink('muscu/testDetail/' . $Test_id), 3, $this->lang['Joueur_ajoute_au_test']);
		endif;
		
		printform:
		
		// Recuperation des informations du tests
		$Test = $this->app->db->get_one(PREFIX . 'muscu_test', array('id =' => $Test_id));
		
		// Recuperation des joueurs a exclure et construction du in
		$in = '(';
		
		$Joueurs = $this->app->db->get(PREFIX . 'muscu_test_joueur', array('test_id =' => $Test_id));
		
		foreach($Joueurs as $Row):
			$in .= ' '. $Row['joueur_id'] .',';
		endforeach;
		
		$in = substr($in,0,-1);
		$in .= ')';
		
		$Joueurs	=	$this->app->db->select('j.id, j.prenom, j.nom')
						->from(PREFIX . 'joueur j')
						->where_free(' j.id NOT IN '. $in .' AND j.actif = 1')
						->order('j.prenom, j.nom')
						->get();
						
		// Recuperation des exerices
		$Exercices = array();
		$Test['exo_liste'] = unserialize($Test['exo_liste']);
		foreach($Test['exo_liste'] as $k => $v):
			$Exercices[] = $this->app->db->get_one(PREFIX . 'musculation_exercice', array('id =' => $v));
		endforeach;
		
		// On envoie toute les données recuperer a smarty
		$this->app->smarty->assign(array(
			'Joueurs'		=>	$Joueurs,
			'Exercices'		=>	$Exercices,
			'Test'			=>	$Test
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'muscu' . DS . 'add_joueur_in_test.tpl');
	}
    
    /**
     * Genere les graphiques affiché dans l'onglet TEST de la fiche joueur
     *
     */
    public function graphAction(){
    		
    	$joueur_id 		= $this->app->HTTPRequest->getData('joueur');
    	$exercice_id 	= $this->app->HTTPRequest->getData('exercice');
    		
    	$Datas	=	$this->app->db->select('tr.resultat,t.date_test, te.nom')
    	->from(PREFIX . 'muscu_test_resultat tr')
    	->left_join(PREFIX . 'muscu_test t','tr.test_id = t.id')
    	->left_join(PREFIX . 'musculation_exercice te','tr.exercice_id = te.id')
    	->where(array('tr.joueur_id =' => $joueur_id, 'tr.exercice_id =' => $exercice_id))
    	->order('t.date_test')
    	->get();
    		
    	// Appel librairie
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pData.class.php';
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pDraw.class.php';
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pImage.class.php';
    		
    	// Gestion des Datas.
    	$MyData = new pData();
    		
    	// 1er Boucle pour recuperer le poids dans un array
    	$data_resultat = array();
    	$data_duree = array();
    	$Name_graph = null;
    	foreach($Datas as $Row){
    
    		$data_resultat[] = $Row['resultat'];
    		$data_duree[] = date('m-Y',$Row['date_test']);
    		$Name_graph = $Row['nom'];
    	}
    		
    	$MyData->addPoints($data_resultat, "Resultat");
    	$MyData->addPoints($data_duree, "Temps");
    	$MyData->setPalette("Resultat", array("R"=>55,"G"=>91,"B"=>127));
    	$MyData->setAbscissa("Temps");
    		
    	$myPicture = new pImage(800,230,$MyData);
    	$myPicture->FontName = ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "GeosansLight.ttf";
    		
    	$Settings = array("StartR"=>220,"StartG"=>220,"StartB"=>220,"EndR"=>255,"EndG"=>255,"EndB"=>255,"Alpha"=>100);
    	$myPicture->drawGradientArea(0,0,800,230,DIRECTION_VERTICAL,$Settings);
    		
    	$myPicture->drawRectangle(0,0,799,229,array("R"=>200,"G"=>200,"B"=>200));
    		
    	$myPicture->setGraphArea(60,60,750,190);
    	$myPicture->drawFilledRectangle(60,60,750,190,array("R"=>255,"G"=>255,"B"=>255,"Surrounding"=>-200,"Alpha"=>10));
    	$myPicture->drawScale(array("DrawSubTicks"=>TRUE));
    	$myPicture->setShadow(TRUE,array("X"=>1,"Y"=>1,"R"=>0,"G"=>0,"B"=>0,"Alpha"=>10));
    	$myPicture->setFontProperties(array("FontName"=> ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "pf_arma_five.ttf","FontSize"=>8));
    	$myPicture->drawLineChart(array("DisplayValues"=>TRUE,"DisplayColor"=>DISPLAY_AUTO));
    	$myPicture->setShadow(FALSE);
    		
    	/* Write the picture title */
    	$myPicture->setFontProperties(array("FontName"=>ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "Forgotte.ttf","FontSize"=>11));
    	$myPicture->drawText(60,35,$Name_graph,array("FontSize"=>20,"Align"=>TEXT_ALIGN_BOTTOMLEFT));
    		
    		
    	$myPicture->stroke();
    		
    }
    
    public function exerciceVideoDeleteAction(){
    	
    	if( $_SESSION['acl']['gest_muscu'] != 1):
    		exit;
    	endif;
    	
    	$video 			= $this->app->HTTPRequest->getData('video');
    	$exercice_id 	= $this->app->HTTPRequest->getData('exercice_id');
    	
    	unlink(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $exercice_id . DS . 'video' . DS . $video);
    	
    	return 1;
    
    }
    
    public function exercicePhotoDeleteAction(){
    	 
    	if( $_SESSION['acl']['gest_muscu'] != 1):
    		exit;
    	endif;
    	 
    	$photo 			= $this->app->HTTPRequest->getData('photo');
    	$exercice_id 	= $this->app->HTTPRequest->getData('exercice_id');
    	 
    	unlink(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $exercice_id . DS . 'images' . DS . $photo);
    	
    	$this->app->db->delete(PREFIX . 'muscu_exercice_photo',null, array('photo =' => $photo));
    	 
    	return 1;
    
    }
    
    public function exerciceFicheAction($exercice_id){
    	$mController = $this->load_controller('musculationController');
    	return $mController->ficheExerciceAction($exercice_id);
    }
    
    public function getZoneAction(){
    	$zone = $this->app->HTTPRequest->getData('zone');
    	
    	$Data = $this->app->db->get_one(PREFIX . 'muscu_zone', array('id =' => $zone) );
    	
    	return $Data['muscle'];
    }
}