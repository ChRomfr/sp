<?php

class joueurController extends Controller{

	/**
	*	Affiche la liste des joueurs en liste dans un tableau
	*/
    public function indexAction(){
		$param = array('actif =' => 1);
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) 
			return $this->ficheAction( $_SESSION['utilisateur']['id_liaison'] );
        
        if( ($_SESSION['utilisateur']['joueur_trombi'] == 1 && !$this->app->HTTPRequest->getExists('liste')) || ($_SESSION['utilisateur']['joueur_trombi'] == 0 && $this->app->HTTPRequest->getExists('trombi')) ):
            return $this->trombiAction();
        endif;
		
		if( $this->app->HTTPRequest->getExists('sexe') ):
			$param = array_merge($param, array('sexe =' => $this->app->HTTPRequest->getData('sexe')));
		endif;
		
		if( $this->app->HTTPRequest->getExists('site') ):
			$param = array_merge($param, array('site_id =' => $this->app->HTTPRequest->getData('site')));
		endif;
		
		if( $this->app->HTTPRequest->getExists('equipe') ):
			$param = array_merge($param, array('je.equipe_id =' => $this->app->HTTPRequest->getData('equipe')));
		endif;
		
		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');        
			$this->app->smarty->assign('Sites', $this->manager->site->getAll());
		endif;
		
		$this->load_manager('equipe');
        $this->load_manager('joueur');
        
        $this->app->smarty->assign(array(
			'Equipes'	=>	$this->manager->equipe->getAll(),
			'Joueurs'	=>	$this->manager->joueur->getAll($param)
		));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'index.tpl');
    }
    
    /**
    *	Affiche la liste des joueurs en trombi
	*/
    public function trombiAction(){
        $param = array('actif =' => 1);
        
        $this->load_manager('joueur');
		$this->load_manager('equipe');
        
        if( $this->app->HTTPRequest->getExists('sexe') ):
			$param = array_merge($param, array('sexe =' => $this->app->HTTPRequest->getData('sexe')));
		endif;
		
		if( $this->app->HTTPRequest->getExists('site') ):
			$param = array_merge($param, array('site_id =' => $this->app->HTTPRequest->getData('site')));
		endif;
		
		if( $this->app->HTTPRequest->getExists('equipe') ):
			$param = array_merge($param, array('je.equipe_id =' => $this->app->HTTPRequest->getData('equipe')));
		endif;
        
        $Joueurs = $this->manager->joueur->getAll($param);
        
        $i=0;
        foreach($Joueurs as $Row):
            
            $photos = getFilesInDir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS);
        
            if( !empty($photos) ):
                foreach($photos as $k => $v):
                    $Joueurs[$i]['photo_id'] = $v;
                endforeach;
            endif;
            
            $i++;            
        endforeach;
        
		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');        
			$this->app->smarty->assign('Sites', $this->manager->site->getAll());
		endif;
		
         $this->app->smarty->assign(array(
			'Equipes'	=>	$this->manager->equipe->getAll(),
			'Joueurs'	=>	$Joueurs
		));
		 
        return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'trombi.tpl');
    }
    
    /**
    *	Affiche et traite le formulaire
	*/
	public function addAction(){
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) 
			return $this->ficheAction( $_SESSION['utilisateur']['id_liaison'] );
			
		if( $_SESSION['acl']['gest_joueur'] != 1 ) 
			return $this->redirect( getLink('index/index'),0,'');
		
		$this->load_manager('structure');
		$this->load_manager('etabScolaire');
		$this->load_manager('joueur');
		$this->load_manager('entraineur');
		$this->load_manager('equipe');
		
		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');
		endif;
		
		if( $this->registry->HTTPRequest->postExists('joueur') ){
			$Data = $_POST;

			$this->load_model('joueur');
			$this->load_model('structure');
			$this->load_model('etabScolaire');
			$this->load_model('paren');
			$this->load_model('entraineur');
			$this->load_manager('paren');
			
			$Joueur = new joueur($this->app->HTTPRequest->postData('joueur'));
			
			if( $Joueur->isValid() === false ) goto print_form;
			
			$Joueur->date_entree 	= FormatDateToTimestamp($Joueur->date_entree);
			
			if( !empty($Joueur->date_sortie) ) 
				$Joueur->date_sortie 	= FormatDateToTimestamp($Joueur->date_sortie);
			else
				$Joueur->date_sortie	= 0;
				
            $Joueur->date_naissance = FormatDateToTimestamp($Joueur->date_naissance);
			
			if( $Joueur->structure_id == '' ):
				// Enregistrement nouvelle structure
                $Data = $this->registry->HTTPRequest->postData('structure');
				
                if( $Data['nom'] != ''):
				    $Structure = new structure($Data);
					$Structure->id = $this->manager->structure->insert($Structure);					
				    $Joueur->structure_id = $Structure->id; 
                endif;
				
			endif;
			
            if( $this->app->config['joueur_suivi_scolaire'] == 1):
			    if( empty($Joueur->etab_scolaire_id) && $Joueur->etab_scolaire_id == ''):
				    // Enregistrement etab scolaire
				    $Etab = new etabScolaire($this->registry->HTTPRequest->postData('etab'));
				    $Etab->save();
				    $Joueur->etab_scolaire_id = $Etab->id;
			    endif;
            endif;
			
			if( $Joueur->getEntraineurId() == '' ):
                $Data = $this->app->HTTPRequest->postData('entraineur');
				// Enregistrement du nouvel entraineur
                if( !empty($Data['nom']) ) :
				    $Entraineur = new entraineur( $Data );
				    $Joueur->setEntraineurId( $this->manager->entraineur->save($Entraineur) );
                endif;
			endif;
			
			# Preparation des donnees pour enregistrement
			$Joueur->newRecord();

			# Sauvegarde du joueur
			$Joueur->id = $Joueur->save();
			
			# Enregistrement CP et VILLE sinon present
			isInDbCpVille($Joueur->code_postal, $Joueur->ville);
			
			# Sauvegarde Parent
			if( $this->app->HTTPRequest->postExists('parent1') ):
				$Pere = new paren($this->registry->HTTPRequest->postData('parent1'));
				$Pere->type = 'p';
				$Pere->joueur_id = $Joueur->id;
				if( $Pere->isValid() === true ):
					$Pere->save();
					isInDbCpVille($Pere->code_postal, $Pere->ville);
				endif;
			endif;
			
			if( $this->app->HTTPRequest->postExists('parent2') ):
				$Mere = new paren($this->registry->HTTPRequest->postData('parent2'));
				$Mere->type = 'm';
				$Mere->joueur_id = $Joueur->id;
				if( $Mere->isValid() === true ):
					$Mere->save();
					isInDbCpVille($Mere->code_postal, $Mere->ville);
				endif;
			endif;

			// Sauvegarde donnée physique
			if( !empty($Data['jpoids']['poids']) && is_numeric($Data['jpoids']['poids']) ){
				$this->registry->db->insert(PREFIX . 'joueur_poids', 
					array(
						'poids' 		=> 	$Data['jpoids']['poids'], 
						'date_saisie'	=>	time(),
						'joueur_id'		=>	$Joueur->id
					) 
				);
			}
			
			if( !empty($Data['jtaille']['taille']) && is_numeric($Data['jtaille']['taille']) ){
				$this->registry->db->insert(PREFIX . 'joueur_taille', 
					array(
						'taille' 		=> 	$Data['jtaille']['taille'], 
						'date_saisie'	=>	time(),
						'joueur_id'		=>	$Joueur->id
					) 
				);
			}		
			
			// Traitement du select equipe_id si present
			if( $this->app->HTTPRequest->postExists('equipe') ):
				$Equipe = $this->app->HTTPRequest->postData('equipe');
				$Equipe['joueur_id'] = $Joueur->id;
				$this->app->db->insert(PREFIX . 'joueur_equipe', $Equipe);
			endif;
            
            // Creation des dossiers
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur->id . DS, 0777);
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur->id . DS . 'photo_id' . DS, 0777);	
            
            // Traitement photo
            require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
            $photoID = new Upload($_FILES['photo']);
            if($photoID->uploaded):
                $photoID->file_overwrite = true;
                $photoID->file_new_name_body   = 'photo_id';
                $photoID->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur->id . DS . 'photo_id' . DS);
            endif;
			
			// Sauvegarde des champs sup dans la base
			$formp = $this->app->HTTPRequest->postData('formp');
			foreach( $formp as $k => $v ){
				$this->app->db->insert(PREFIX . 'commun_form_data', array('cf_id' => $k, 'cfd_id' => $Joueur->id, 'cfd_value' => $v) );
			}
			
			return $this->redirect( getLink('joueur/fiche/' . $Joueur->id), 1,$this->lang['Joueur_sauvegarde']);

		}
		
		print_form:
				
		$this->getFormValidatorJs();
		
		if( $this->app->config['multi_site'] == 1 ):
			$this->app->smarty->assign('Sites', $this->manager->site->getAll() );
		endif;
		
		$this->app->smarty->assign(array(
			'Structures'		=>	$this->manager->structure->getAll(),
			'EtabsScolaire'		=>	$this->manager->etabScolaire->getAll(),
			'Entraineurs'		=>	$this->manager->entraineur->getForListe(),
			'Form'				=>	$this->app->form->get('JoueurForm'),
			'Equipes'			=>	$this->manager->equipe->getByStructureId('0'),
		));
       
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'add.tpl');
		
	}
	
	public function editAction($joueur_id){
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) return $this->ficheAction( $_SESSION['utilisateur']['id_liaison'] );
		if( $_SESSION['acl']['gest_joueur'] != 1 ) return $this->redirect( getLink('index/index'),0,'');
		
        $this->load_manager('structure');
        $this->load_manager('etabScolaire');
        $this->load_manager('joueur');
		$this->load_manager('entraineur');
        $this->load_model('joueur');
        $this->load_manager('paren');
        
        if( $this->registry->HTTPRequest->postExists('joueur') ){
            
            $Joueur = new joueur($this->registry->HTTPRequest->postData('joueur'));
            
            if( $Joueur->isValid() === false ) goto print_form;
            
            $Joueur->date_entree = FormatDateToTimestamp($Joueur->date_entree);
            $Joueur->date_sortie = FormatDateToTimestamp($Joueur->date_sortie);
            $Joueur->date_naissance = FormatDateToTimestamp($Joueur->date_naissance);
            
            $this->manager->joueur->update($Joueur);
            
            // Enregistrement CP et VILLE sinon present
			isInDbCpVille($Joueur->code_postal, $Joueur->ville);
            
            if( $this->app->HTTPRequest->postExists('delete_photo') ):
            	$dir = ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur->id . DS . 'photo_id' . DS;
            	$Files = getFilesInDir($dir);
            	foreach( $Files as $k => $v):
            		@unlink( $dir . $k);
            	endforeach;
            endif;
            
            require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
            $photoID = new Upload($_FILES['photo']);
            if($photoID->uploaded):
                $photoID->file_overwrite = true;
                $photoID->file_new_name_body   = 'photo_id';
                $photoID->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur->id . DS . 'photo_id' . DS);
            endif;
			
			// Traitement des champs supplementaire
			$formp = $this->app->HTTPRequest->postData('formp');
			foreach( $formp as $k => $v ):
				// Suppression de l enregistrement deja present
				$this->app->db->delete(PREFIX . 'commun_form_data', null, array('cf_id =' => $k, 'cfd_id =' => $Joueur->id) );
				// Insertion des nouvelles données
				$this->app->db->insert(PREFIX . 'commun_form_data', array('cf_id' => $k, 'cfd_id' => $Joueur->id, 'cfd_value' => $v) );
			endforeach;
            
            return $this->redirect( getLink('joueur/fiche/' . $Joueur->id), 3, $this->lang['Joueur_sauvegarde']);
        }
        
        print_form:
        
        $this->getFormValidatorJs();
		
		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');
			$this->app->smarty->assign('Sites', $this->manager->site->getAll() );
		endif;
		
		$this->app->smarty->assign(array(
			'Structures'		=>	$this->manager->structure->getAll(),
			'EtabsScolaire'		=>	$this->manager->etabScolaire->getAll(),
			'Joueur'			=>	new joueur($this->manager->joueur->getById($joueur_id)),
			'Entraineurs'		=>	$this->manager->entraineur->getForListe(),
			'Form'				=>	$this->app->form->get('JoueurForm', $joueur_id),
		));
         
        return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'edit.tpl');
	}
	
	public function deleteAction( $joueur_id ){
		if( $_SESSION['acl']['gest_joueur'] != 1 ) return $this->redirect( getLink('index/index'),0,'');
		
		$this->app->db->delete(PREFIX . 'joueur', $joueur_id);
		$this->app->db->delete(PREFIX . 'joueur_documents',null, array('joueur_id =' => $joueur_id) );
		$this->app->db->delete(PREFIX . 'joueur_entrainement', null, array('joueur_id =' => $joueur_id) );
		$this->app->db->delete(PREFIX . 'joueur_entrainement_cycle', null, array('joueur_id =' => $joueur_id) );
		$this->app->db->delete(PREFIX . 'joueur_img',null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'joueur_medical',null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'joueur_poids', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'joueur_scolaire_matiere_note',null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'joueur_taille', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'muscu_cycle_joueur', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'muscu_seance', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'muscu_test_resultat', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'parent', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'scolaire_trimestre', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'test_resultat', null, array('joueur_id =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'user', null, array('type =' => 'joueur', 'id_liaison =' => $joueur_id));
		$this->app->db->delete(PREFIX . 'user', null, array('type =' => 'parent', 'id_liaison =' => $joueur_id));
		
		return $this->redirect( getLink('joueur/index'), 3, $this->lang['Joueur_supprime'] );
	}
	
	public function ficheAction($joueur_id){
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$this->load_manager('joueur');
		$this->load_model('joueur');
		
		$this->load_manager('structure');
		
		$Joueur = $this->manager->joueur->getById( $joueur_id ) ;

		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');
			$Site = $this->manager->site->getById($Joueur['site_id']);
			$this->app->smarty->assign('Site', $Site);
		endif;
		
        $photos = getFilesInDir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur['id'] . DS . 'photo_id' . DS);
		
        if( !empty($photos) ):
            foreach($photos as $k => $v):
                $Joueur['photo_id'] = $v;
            endforeach;
        endif;
		
		$this->registry->smarty->assign(array(
			'Joueur'	=>	$Joueur,
			'Structure'	=>	$this->manager->structure->getById( $Joueur['structure_id'] ),
			'ctitre'	=>	$Joueur['prenom'] . ' ' . $Joueur['nom'],
			'Exercices'	=> 	$this->getExercicesInTest($joueur_id),
		));
		
		$this->app->addJS('jquery.tablesorter.min.js');
		$this->app->addCSS('tablesorter/blue/style.css');
		$this->getFormValidatorJs();

		// Lib pour graph
		registry::load_web_lib('jqplot/jquery.jqplot.min.js','js');
		registry::load_web_lib('jqplot/plugins/jqplot.categoryAxisRenderer.min.js','js');
		registry::load_web_lib('jqplot/plugins/jqplot.canvasTextRenderer.min.js','js');
		registry::load_web_lib('jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js','js');
		registry::load_web_lib('jqplot/jquery.jqplot.css','css');
		
		return $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche.tpl');
	}
	
	public function getStructureInfoAction($joueur_id){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$this->load_manager('structure');
		$this->load_manager('joueur');
        $this->load_model('joueur');
        
        
        $Joueur  = new joueur($this->manager->joueur->getById($joueur_id));
        
        // Verification si des equipes sont stockes en base
        if( $this->app->db->count(PREFIX . 'equipe') > 0):
        	$this->load_manager('equipe');
        	
	        // Verification si joueur inscrit dans une equipe
	        $EquipesJoueurs	=	$this->manager->equipe->getByJoueurId($Joueur->id);
	        
	        $this->app->smarty->assign(array(
	        	'EquipesJoueur'		=>	$EquipesJoueurs,
	        	'Equipes'			=>	$this->manager->equipe->getAll(),
	        ));
        
        endif;
        
        $this->app->smarty->assign(array(
        	'Joueur'		=>	$Joueur,
        	'Structure'		=>	$this->manager->structure->getById($Joueur->structure_id),
        	'Joueurs'		=>	$this->manager->joueur->getByStructureId($Joueur->structure_id),
        ));

		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_structure.tpl');
	}
	
	public function getEtabInfoAction($joueur_id){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$this->load_manager('etabScolaire');
		$this->load_manager('joueur');
		$this->load_model('joueur');
		
		$Joueur  = new joueur($this->manager->joueur->getById($joueur_id));

		$Formations = $this->app->db->select('sf.*')->from(PREFIX . 'scolaire_formation sf')->where(array('sf.sportif_id =' => $joueur_id))->get();
		
        $this->app->smarty->assign(array(
            'Joueur'        =>  $Joueur,
            'Etab'          =>  $this->manager->etabScolaire->getById($Joueur->etab_scolaire_id),
            'Joueurs'       =>  $this->manager->joueur->getByEtabId($Joueur->etab_scolaire_id),
            //'Trimestres'    =>  $Trimestres,
			'Formations'	=>	$Formations,
        ));
        
		return $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_etab.tpl');
	}
    
    /**
    *	Traite l'affichage des entrainements dans la fiche jour
    *	@param int $joueur_id Identifiant du joueur
    *	@return html code HTML a faire afficher
    */
    public function getEntrainementInfoAction( $joueur_id ){

    	# Init var
    	$Type = null;
        
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;

		if( $this->app->HTTPRequest->getExists('type') ):
			$Type = $this->app->HTTPRequest->getData('type');
		endif;
		
        $this->load_manager('entrainement');
        $this->load_manager('joueur');
        $this->load_model('joueur');
        
        # Recuperation des informations du joueur
        $Joueur  = new joueur($this->manager->joueur->getById($joueur_id));

        # Recuperation des entrainements
        $Entrainements = $this->manager->entrainement->getByJoueurDataAndType($Joueur, $Type);

        # Recuperation des cyles
       	$Cycles = $this->manager->entrainement->getCycleByJoueurIdAndType( $joueur_id, $Type );
        
        $this->app->smarty->assign(array(
            'Entrainements'     =>  $Entrainements,
            'joueur_id'         =>  $joueur_id,
            'Cycles'            =>  $Cycles,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_entrainement.tpl');
    }
	
	public function getPhysiqueInfoAction($joueur_id){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$Datas_taille = $this->registry->db->get(PREFIX . 'joueur_taille', array('joueur_id =' => $joueur_id), 'date_saisie DESC');
		$Datas_poids = $this->registry->db->get(PREFIX . 'joueur_poids', array('joueur_id =' => $joueur_id), 'date_saisie DESC');
		$this->registry->smarty->assign('joueur_id', $joueur_id);
		return $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_physique.tpl');
	}
	
	public function ajaxGetPoidsDataAction($jid){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $jid = $_SESSION['utilisateur']['id_liaison'] ;

		// Recuperation des données
		$Results = $this->registry->db->select('poids, date_saisie')->from(PREFIX . 'joueur_poids')->where(array('joueur_id =' => $jid))->order('date_saisie ASC')->get();

		$Poids = array();
		$Date = array();

		foreach($Results as $Result){
			array_push($Poids, $Result['poids']);
			array_push($Date, date('m-Y',$Result['date_saisie']));
		}

		return  json_encode(array($Poids, $Date), JSON_NUMERIC_CHECK);
	}

	public function ajaxGetTailleDataAction($jid){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $jid = $_SESSION['utilisateur']['id_liaison'] ;

		// Recuperation des données
		$Results = $this->registry->db->select('taille, date_saisie')->from(PREFIX . 'joueur_taille')->where(array('joueur_id =' => $jid))->order('date_saisie ASC')->get();

		$Taille = array();
		$Date = array();

		foreach($Results as $Result){
			array_push($Taille, $Result['taille']);
			array_push($Date, date('m-Y',$Result['date_saisie']));
		}

		return  json_encode(array($Taille, $Date), JSON_NUMERIC_CHECK);
	}

	public function ajaxGetImgDataAction($jid){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $jid = $_SESSION['utilisateur']['id_liaison'] ;

		// Recuperation des données
		$Results = $this->registry->db->select('img, date_saisie')->from(PREFIX . 'joueur_img')->where(array('joueur_id =' => $jid))->order('date_saisie ASC')->get();

		$Img = array();
		$Date = array();

		foreach($Results as $Result){
			array_push($Img, $Result['img']);
			array_push($Date, date('m-Y',$Result['date_saisie']));
		}

		return  json_encode(array($Img, $Date), JSON_NUMERIC_CHECK);
	}
    
    /**
    * Enregistre les données physiques soumis depuis le formulaire
    * 
    * @param mixed $joueur_id
    */
    public function addDataPhysiqueAction($joueur_id){
		
		if( $_SESSION['acl']['gest_joueur'] != 1 ) return "";
		
        // Recuperation des données
        $Data = $this->registry->HTTPRequest->postData('data');
        
        //Enregistrement des données
        if( $Data['poids'] != '')
            $this->registry->db->insert(PREFIX . 'joueur_poids', array('poids' => $Data['poids'], 'joueur_id' => $joueur_id, 'date_saisie' => time() ) );
            
        if( $Data['taille'] != '')
            $this->registry->db->insert(PREFIX . 'joueur_taille', array('taille' => $Data['taille'], 'joueur_id' => $joueur_id, 'date_saisie' => time() ) );
            
        if( $Data['img'] != '')
            $this->registry->db->insert(PREFIX . 'joueur_img', array('img' => $Data['img'], 'joueur_id' => $joueur_id, 'date_saisie' => time() ) );
            
        return $this->redirect( getLink("joueur/fiche/" . $joueur_id . "?tab=physique"), 3, $this->lang['Donnees_enregistrees'] );
    }
    
    /**
    * Recupere et affiche les suivis medical d un joueur
    * 
    * @param mixed $joueur_id
    */
    public function getSuiviMedicalAction($joueur_id){
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
        $this->load_manager('SuiviMedical');
        
        $this->registry->smarty->assign('SuivisMedical', $this->manager->SuiviMedical->getByJoueurId($joueur_id));
        $this->registry->smarty->assign('joueur_id', $joueur_id);
        $this->registry->smarty->assign('DispoRugby', $this->manager->SuiviMedical->getMaxDispoRugbyByJoueurId($joueur_id));
        $this->registry->smarty->assign('DispoMuscu', $this->manager->SuiviMedical->getMaxDispoMuscuByJoueurId($joueur_id));
        return $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_suivimed.tpl');
    }    
    
    public function getMusculationInfoAction($joueur_id){
        if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$Cycles = $this->app->db->get(PREFIX . 'musculation_cycle', array('joueur_id =' => $joueur_id), 'date_debut DESC' );
		
		$this->app->smarty->assign(array(
			'Cycles'		=>	$Cycles,
			'joueur_id'		=>	$joueur_id,
		));
		
        return $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_musculation.tpl');
    }
	
	public function getMuscuInfoAction($joueur_id){
		
		$Cycles = $this->app->db->select('*')->from(PREFIX . 'muscu_cycle mc')->left_join(PREFIX . 'muscu_cycle_joueur mcj','mc.id = mcj.cycle_id')->where(array('mcj.joueur_id =' => $joueur_id))->get();
		
		$Seances = $this->app->db->select('ms.*, mc.nom as cycle')->from(PREFIX . 'muscu_seance ms')->left_join(PREFIX . 'muscu_cycle mc','ms.cycle_id = mc.id')->where(array('joueur_id =' => $joueur_id))->get();
		
		$this->app->smarty->assign(array(
			'Cycles'		=>	$Cycles,
			'Seances'		=>	$Seances,
			'joueur_id'		=>	$joueur_id,
            'HTML_TABLE'    =>  $this->getTestMuscuInfoAction($joueur_id),
		));
		
		return $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_muscu.tpl');		
	}

	/**
	 * Recupere la liste des exercices au quel le joueur à subit un test
	 * @param  [type] $jid [description]
	 * @return [type]      [description]
	 */
	private function getExercicesInTest($jid){

		$Liste	=	$this->app->db->select('tj.test_id, t.date_test as T_DATE_TEST')
					->from(PREFIX . 'test_joueur tj')
					->left_join(PREFIX . 'test t','tj.test_id = t.id')
					->where(array('tj.joueur_id =' => $jid))
					->order('t.date_test')
					->get();
		
		if( empty($Liste) ){
			return '';
		}

		$Where_for_exercice = 'test_id IN (';
		
		foreach($Liste as $Row):
			$Where_for_exercice .= $Row['test_id'] .', ';
		endforeach;
		
		$Where_for_exercice = substr($Where_for_exercice, 0,-2) . ')';
		
		// Recuperation des exercices
		$Exercices	=	$this->app->db->select('DISTINCT(tr.exercice_id), te.nom as TE_NOM, te.progression AS TE_PROGRESSION')
						->from(PREFIX . 'test_resultat tr')
						->left_join(PREFIX .' test_exercices te','tr.exercice_id = te.id')
						->where_free($Where_for_exercice)						
						->get();

		if(!empty($Exercices)){
			return $Exercices;
		}

		return '';
	}
	
	public function getTestInfoAction($joueur_id){
		
		// Recuperation liste Test ou le joueur a participé
		
		
		$Liste	=	$this->app->db->select('tj.test_id, t.date_test as T_DATE_TEST')
					->from(PREFIX . 'test_joueur tj')
					->left_join(PREFIX . 'test t','tj.test_id = t.id')
					->where(array('tj.joueur_id =' => $joueur_id))
					->order('t.date_test')
					->get();
		
		if( empty($Liste) ) return '';
        
        // Contruction condition		
		$Where_for_exercice = 'test_id IN (';
		
		foreach($Liste as $Row){
			$Where_for_exercice .= $Row['test_id'] .', ';
        }
		
		$Where_for_exercice = substr($Where_for_exercice, 0,-2) . ')';
		
		// Recuperation des exercices
		$Exercices	=	$this->app->db->select('DISTINCT(tr.exercice_id), te.nom as TE_NOM, te.progression AS TE_PROGRESSION')
						->from(PREFIX . 'test_resultat tr')
						->left_join(PREFIX .' test_exercices te','tr.exercice_id = te.id')
						->where_free($Where_for_exercice)						
						->get();
		
        $HTML_TABLE = '<table class="table table-hover table-condensed table-bordered" id="tableau_test"><thead><tr><th>'. $this->lang['Date'] .'</th>';
        
		// Construction du tableau
		foreach($Exercices as $Row){
			$HTML_TABLE .=  '<th>'. $Row['TE_NOM'] .'</th>';
        }
		
		$HTML_TABLE .= '</tr></thead><tbody>';
        
        $Last_result = array();
		
		// Recuperation des resultats
		foreach($Liste as $Test):
			$HTML_TABLE .= '<tr><td>'. date('d',$Test['T_DATE_TEST']) .'/'. date('m',$Test['T_DATE_TEST']) .'/' . date('Y',$Test['T_DATE_TEST']) . '</td>';
			// On parcour les exos pour aller recuperer les resultats de chaque test
			foreach($Exercices as $Exercice):
				$Result = $this->app->db->select('resultat')->from(PREFIX . 'test_resultat')->where(array('exercice_id =' => $Exercice['exercice_id'], 'test_id =' =>$Test['test_id'], 'joueur_id =' => $joueur_id))->get_one();
                if( isset($Last_result[$Exercice['exercice_id']]) ){
                    $diff = $Result['resultat'] - $Last_result[$Exercice['exercice_id']];
                    
                    if( $Exercice['TE_PROGRESSION'] == 1 && $diff < 0)
                        $diff = '<span style="color:green;">' . $diff .'</span>';
                    elseif( $Exercice['TE_PROGRESSION'] == 2 && $diff > 0)
                        $diff = '<span style="color:green;">' . $diff .'</span>';
                    elseif( $Exercice['TE_PROGRESSION'] == 1 && $diff > 0)
                        $diff = '<span style="color:red;">' . $diff .'</span>';
                    elseif( $Exercice['TE_PROGRESSION'] == 2 && $diff < 0)
                        $diff = '<span style="color:red;">' . $diff .'</span>';
                        
                    $HTML_TABLE .= '<td>'. $Result['resultat'] .' <small>('. $diff .')</small></td>';
                }else{
                    $HTML_TABLE .= '<td>'. $Result['resultat'] .'</td>';
                }
                
                $Last_result[$Exercice['exercice_id']] = $Result['resultat'];
			endforeach;
			$HTML_TABLE .= '</tr>';
		endforeach;
		
		$HTML_TABLE .= '</tbody></table>';
		
		$this->app->smarty->assign(array(
			'HTML_TABLE'	=>	$HTML_TABLE,
			'joueur_id'		=>	$joueur_id,
			'Exercices'		=>	$Exercices,
		));
	
		return $this->app->smarty->fetch( VIEW_PATH . 'joueur' . DS . 'fiche_tab_test.tpl');
	}
    
    public function getDocumentsAction($jid){
        
        $Documents = $this->app->db->get(PREFIX . 'joueur_documents', array('joueur_id =' => $jid));
        
        $this->app->smarty->assign(array(
            'Documents'         =>  $Documents,
            'joueur_id'         =>  $jid,
        ));
        
        return $this->app->smarty->fetch( VIEW_PATH . 'joueur' . DS . 'fiche_tab_documents.tpl');
    }
    
    public function uploadFileAction(){
        
        $fichier = $this->app->HTTPRequest->postData('fichier');
        
        // Creation des dossiers
        if( !is_dir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $fichier['joueur_id'] . DS) )
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $fichier['joueur_id'] . DS);
        
        if( !is_dir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $fichier['joueur_id'] . DS . 'documents' . DS) )
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $fichier['joueur_id'] . DS . 'documents' . DS);    
            
        // Traitement photo
        require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
        $File = new Upload($_FILES['doc']);
        if($File->uploaded):
            $File->file_overwrite = true;
            $File->file_new_name_body   = time();
            $File->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $fichier['joueur_id'] . DS . 'documents' . DS);
        endif;
        
        $fichier['date_add']    = time();
        $fichier['file_name']   = $File->file_dst_name;
        $fichier['add_by']      = $_SESSION['utilisateur']['id'];
        $fichier['extension']   = $File->file_dst_name_ext;
        
        // Enregistrement dans la base
        $this->app->db->insert(PREFIX . 'joueur_documents',$fichier);
        
        return "<script>window.top.window.endUpload();</script>"; 
    }
    
    public function deleteDocumentAction($did){
        $Document = $this->app->db->get_one(PREFIX . 'joueur_documents', array('id =' => $did));
        @unlink(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS. $Document['joueur_id'] . DS. 'documents' . DS. $Document['file_name']);
        $this->app->db->delete(PREFIX . 'joueur_documents', $did);
        return $this->getDocumentsAction($Document['joueur_id']);
    }
    
	/**
	 * Construit le tableau des resultat des test de musculation
	 * 
	 */
    public function getTestMuscuInfoAction($joueur_id){
        
    	// Recuperation liste Test ou le joueur a participé
		
		/* code comment 14/11/2012 */
        //$Liste = $this->app->db->select('DISTINCT(test_id), t.date_test as T_DATE_TEST')->from(PREFIX . 'muscu_test_resultat tr')->left_join(PREFIX . 'muscu_test t','tr.test_id = t.id')->where(array('joueur_id =' => $joueur_id))->order('t.date_test')->get();
		/* code comment 14/11/2012 */
		
		$Liste	=	$this->app->db->select('mtj.test_id, mt.date_test as T_DATE_TEST')
					->from(PREFIX . 'muscu_test_joueur mtj')
					->left_join(PREFIX . 'muscu_test mt','mtj.test_id = mt.id')
					->where(array('mtj.joueur_id =' => $joueur_id))
					->order('mt.date_test')
					->get();
        
        if( empty($Liste) )
        	return '';
    	
    	
        $HTML_TABLE = '<table class="tablesorter" id="tableau_test"><thead><tr><th>'. $this->lang['Date'] .'</th>';        
        
        $Where_for_exercice = 'test_id IN (';
        
        foreach($Liste as $Row):
            $Where_for_exercice .= $Row['test_id'] .', ';
        endforeach;
        
        $Where_for_exercice = substr($Where_for_exercice, 0,-2) . ')';
        
        // Recuperation des exercices
        $Exercices    = $this->app->db->select('DISTINCT(tr.exercice_id), te.nom as TE_NOM, te.progression AS TE_PROGRESSION')
                        ->from(PREFIX . 'muscu_test_resultat tr')
                        ->left_join(PREFIX .'musculation_exercice te','tr.exercice_id = te.id')
                        ->where_free($Where_for_exercice)                        
                        ->get();
                        
        // Construction du table
        foreach($Exercices as $Row):
            $HTML_TABLE .=  '<th>'. $Row['TE_NOM'] .'</th>';
        endforeach;
        
        $HTML_TABLE .= '</tr></thead><tbody>';
        
        $Last_result = array();
        
        // Recuperation des resultats
        foreach($Liste as $Test):
            $HTML_TABLE .= '<tr><td>'. date('d',$Test['T_DATE_TEST']) .'/'. date('m',$Test['T_DATE_TEST']) .'/' . date('Y',$Test['T_DATE_TEST']) . '</td>';
            // On parcour les exos pour aller recuperer les resultats de chaque test
            foreach($Exercices as $Exercice):
                $Result = $this->app->db->select('resultat')->from(PREFIX . 'muscu_test_resultat')->where(array('exercice_id =' => $Exercice['exercice_id'], 'test_id =' =>$Test['test_id'], 'joueur_id =' => $joueur_id))->get_one();
                if( isset($Last_result[$Exercice['exercice_id']]) ){
                    $diff = $Result['resultat'] - $Last_result[$Exercice['exercice_id']];
                    
                    if( $Exercice['TE_PROGRESSION'] == 1 && $diff < 0)
                        $diff = '<span style="color:green;">' . $diff .'</span>';
                    elseif( $Exercice['TE_PROGRESSION'] == 2 && $diff > 0)
                        $diff = '<span style="color:green;">' . $diff .'</span>';
                    elseif( $Exercice['TE_PROGRESSION'] == 1 && $diff > 0)
                        $diff = '<span style="color:red;">' . $diff .'</span>';
                    elseif( $Exercice['TE_PROGRESSION'] == 2 && $diff < 0)
                        $diff = '<span style="color:red;">' . $diff .'</span>';
                        
                    $HTML_TABLE .= '<td>'. $Result['resultat'] .' <small>('. $diff .')</small></td>';
                }else{
                    $HTML_TABLE .= '<td>'. $Result['resultat'] .'</td>';
                }
                
                $Last_result[$Exercice['exercice_id']] = $Result['resultat'];
            endforeach;
            $HTML_TABLE .= '</tr>';
        endforeach;
        
        $HTML_TABLE .= '</tbody></table>';
        
        $this->app->smarty->assign(array('Exercices' => $Exercices));
        
        return $HTML_TABLE;
    }    
	
	/**
	*	Affiche et traite l'envoie d'email au joueur
	*/
	public function sendGroupeMailAction(){
		
		if( $this->app->HTTPRequest->postExists('email') ):
			
			// Traitement du formulaire pour envoie groupé
			$Joueurs = $this->app->HTTPRequest->postData('joueur');
			$Email = $this->app->HTTPRequest->postData('email');
			
			sendEmail($Joueurs, $this->app->config['email_expediteur'], $Email['objet'], $Email['message'], nl2br($Email['message']) );
			
			return $this->redirect( getLink('index/index'), 3, $this->lang['Message_envoye']);
			
		endif;
		
		printform:
		
		$this->app->smarty->assign(array(
			'Joueurs'		=>	$this->app->db->get(PREFIX . 'joueur', array('actif =' => 1)),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'joueur' . DS . 'sendGroupMail.tpl');
		
	}
	
	public function getTabPhysiqueDataAction( $joueur_id ){
		$poids 		= $this->app->db->get(PREFIX . 'joueur_poids', array('joueur_id =' => $joueur_id), 'date_saisie DESC' );
		$tailles	= $this->app->db->get(PREFIX . 'joueur_taille', array('joueur_id =' => $joueur_id),'date_saisie DESC' );
		$imgs		= $this->app->db->get(PREFIX . 'joueur_img', array('joueur_id =' => $joueur_id), 'date_saisie DESC' );
		
		$this->app->smarty->assign(array(
			'poids'		=>	$poids,
			'tailles'	=>	$tailles,
			'imgs'		=>	$imgs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'joueur' . DS . 'ajax_tab_physique_data.tpl' );
	}
	
	public function deleteDataPhysiqueAction(){
		$type = $this->app->HTTPRequest->getData('type');
		$id = $this->app->HTTPRequest->getData('id');
		
		if( $type == 'poids' ):
			$this->app->db->delete(PREFIX . 'joueur_poids', $id);
		elseif( $type == 'taille'):
			$this->app->db->delete(PREFIX . 'joueur_taille', $id);
		elseif( $type == 'img' ):
			$this->app->db->delete(PREFIX . 'joueur_img', $id);
		endif;
		
	}
	
	public function ficheInPdfAction($joueur_id){
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$this->load_manager('joueur');
		$this->load_model('joueur');
		$this->load_manager('paren');
		$this->load_manager('club');
		$this->load_manager('entraineur');
		$this->load_manager('etabScolaire');
		$this->load_manager('projetFormation');
		
		$Joueur = $this->manager->joueur->getById( $joueur_id ) ;
		
		// Init var
		$Projets = array();
		
		// Recupertion des donnees methodes je me casse pas la tete et je fais 9 requetes :/
		$Projets[0] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, '1', '1');
		$Projets[1] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, '1', '2');
		$Projets[2] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 1, 3);
		$Projets[3] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 2, 1);
		$Projets[4] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 2, 2);
		$Projets[5] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 2, 3);
		$Projets[6] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 3, 1);
		$Projets[7] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 3, 2);
		$Projets[8] = $this->manager->projetFormation->getByJoueurIdTermeYear($joueur_id, 3, 3);
		
        $photos = getFilesInDir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur['id'] . DS . 'photo_id' . DS);
		
        if( !empty($photos) ):
            foreach($photos as $k => $v):
                $Joueur['photo_id'] = $v;
            endforeach;
        endif;
		
		$this->app->smarty->assign(array(
			'Joueur'		=>	$Joueur,
			'Parents'		=>	$this->manager->paren->getByJoueurId( $joueur_id ),
			'Club'			=>	$this->manager->club->getById( $Joueur['club_id'] ),
			'Entraineur'	=>	$this->manager->entraineur->getById( $Joueur['entraineur_id'] ),
			'Etab'			=>	$this->manager->etabScolaire->getById( $Joueur['etab_scolaire_id'] ),
			'Projets'		=>	$Projets,
		));
			
		$html = $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_in_pdf.tpl');
		
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'mpdf' . DS . 'mpdf.php';
		$mpdf=new mPDF('c');
		//$mpdf->WriteHTML(file_get_contents($this->app->config['url'] . $this->app->config['url_dir'] . 'themes/' .$this->app->config['theme'] . '/style.css'),1);
		$mpdf->WriteHTML($html,2);
		$mpdf->Output();
		exit;
	}
	
	public function getChampPlusAction( $joueur_id ){
        
        $this->load_manager('joueur');
        
        $this->app->smarty->assign(array(
            'Joueur'        =>  $this->manager->joueur->getById($joueur_id),
            'DataSup'       =>  $this->app->form->getData('JoueurForm', $joueur_id),
			'Account'		=>	$this->app->db->count(PREFIX . 'user', array('type =' => 'joueur', 'id_liaison =' => $joueur_id))
        ));
        
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_plus.tpl');
	}
	
	public function addInEquipeAction(){
		
		if( $this->app->HTTPRequest->postData('equipe') ):
			$Equipe = $this->app->HTTPRequest->postData('equipe');
			$this->app->db->insert(PREFIX . 'joueur_equipe', $Equipe);
			return $this->redirect( getLink('joueur/fiche/' . $Equipe['joueur_id'] . '?tab=structure'),3, $this->lang['Donnees_enregistrees'] );
		endif;
		
		$joueur_id = $this->app->HTTPRequest->getData('joueur_id');
		$NotIn = '';
		
		$this->load_manager('equipe');
		
		// Recuperation des equipes du joueurs pour faire exclusions
		$EquipesJoueur = $this->manager->equipe->getByJoueurId($joueur_id);
		
		if( count($EquipesJoueur) > 0):
			$NotIn = 'e.id NOT IN (';
			
			foreach($EquipesJoueur as $Row):
				$NotIn .= $Row['id'] .',';
			endforeach;
			
			$NotIn = substr($NotIn,0, -1);
			$NotIn .= ')';
		endif;
		
		$this->app->db->select('e.id, e.nom, s.nom as structure')->from(PREFIX . 'equipe e')->left_join(PREFIX . 'structure s','e.structure_id = s.id');
		if( !empty($NotIn) ) $this->app->db->where_free($NotIn);
		$Equipes = $this->app->db->order('e.nom')->get();
		
		$this->app->smarty->assign(array(
			'Equipes'		=>	$Equipes,
			'Joueur_id'		=>	$joueur_id,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'add_in_equipe.tpl');
	}
	
	public function getTabRessentieAction($Joueur_id){
		$Ressenti = $this->load_controller('ressentie');
        return $Ressenti->tabFicheAction($Joueur_id);
	}
	
	public function ajaxGetTableauRessentieAction(){
        $Ressenti = $this->load_controller('ressentieController');
        return $Ressenti->ajaxGetTableauRessentieAction();
	}
	
	public function getNumSequenceAction(){
		$joueur_id	=	$this->app->HTTPRequest->getData('joueur');
		$semaine	=	$this->app->HTTPRequest->getData('semaine');
		
		$Qte = $this->app->db->count(PREFIX . 'sequence', array('sportif_id =' => $joueur_id, 'semaine =' => $semaine));
		
		return ($Qte+1);
	}
	
	/**
	*	Affiche et traite le formulaire d ajout de sequence par les sportifs
	*
	*/
	public function sequenceAddAction(){
      $Ressenti = $this->load_controller('ressentieController');
      return $Ressenti->sequenceAddAction();		
	}
	
	public function sequenceEntraineurAddAction($sequence_id){		
		$Ressenti = $this->load_controller('ressentieController');
		return $Ressenti->ajaxGetFormEntraineurInFicheAction($sequence_id);		
	}
	
	public function getForSequenceEntrainementEtSeanceAction(){
	
		$joueur_id	=	$this->app->HTTPRequest->getData('joueur');
		$date		=	$this->app->HTTPRequest->getData('date');
		
		$date = FormatDateToMySQL($date);
		
		// Recuperation des entraintements
        $Entrainements  =   $this->app->db->select('e.id, e.description')
                            ->from(PREFIX . 'joueur_entrainement je')
                            ->left_join(PREFIX . 'entrainement e','je.entrainement_id = e.id')
                            ->where(array('e.date_e =' => $date, 'je.joueur_id =' => $joueur_id))
                            ->get();
							
		// Recuperation des seances de muscu
		
		$Seances		=	$this->app->db->select('ms.id')
							->from(PREFIX . 'muscu_seance ms')
							->where(array('ms.date_s =' => $date, 'ms.joueur_id =' => $joueur_id))
							->get();
					                   
        $this->app->smarty->assign(array(
            'Entrainements'         =>  $Entrainements,
			'Seances'				=>	$Seances,
        ));
		
        return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'sequence_form_select_entrainements.tpl');
	}
	
	/**
	 * Retourne l entete commune a toute les fiches d impression
	 * @param type $joueur_id
	 */
	public function ajaxGetEnTetePourImpressionAction($joueur_id){
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$this->load_manager('joueur');
		$this->load_model('joueur');
		$this->load_manager('paren');
		$this->load_manager('structure');
		
		$Joueur = $this->manager->joueur->getById( $joueur_id ) ;

		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');
			$Site = $this->manager->site->getById($Joueur['site_id']);
			$this->app->smarty->assign('Site', $Site);
		endif;
		
        $photos = getFilesInDir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Joueur['id'] . DS . 'photo_id' . DS);
		
        if( !empty($photos) ):
            foreach($photos as $k => $v):
                $Joueur['photo_id'] = $v;
            endforeach;
        endif;
		
		$this->app->smarty->assign(array(
			'Joueur'	=>	$Joueur,
			'Parents'	=>	$this->manager->paren->getByJoueurId( $joueur_id ),
			'Structure'	=>	$this->manager->structure->getById( $Joueur['structure_id'] ),
			'ctitre'	=>	$Joueur['prenom'] . ' ' . $Joueur['nom'],
		));
		
		$this->app->addJS('jquery.tablesorter.min.js');
		$this->app->addCSS('tablesorter/blue/style.css');	
		
		return $this->app->smarty->fetch( VIEW_PATH . 'joueur' . DS . 'print_entete_joueur.tpl');
	}
	
	/**
	 * 
	 * @param type $joueur_id
	 * @return type
	 */
	public function printTabSituationFamilialeAction($joueur_id){
		
		$this->load_manager('paren');
		
		$this->app->smarty->assign(array(		
			'Parents'	=>	$this->manager->paren->getByJoueurId( $joueur_id ),
			'Joueur_id'	=>	$joueur_id,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'joueur' . DS . 'print_tab_situation_familiale.tpl');
	}
	
	/**
	 * 
	 * @param type $joueur_id
	 * @return type
	 */
	public function printTabStructureEquipeAction($joueur_id){
		
		if( $_SESSION['utilisateur']['type'] == 'joueur' ) $joueur_id = $_SESSION['utilisateur']['id_liaison'] ;
		
		$this->load_manager('structure');
		$this->load_manager('joueur');
        $this->load_model('joueur');
        
        
        $Joueur  = new joueur($this->manager->joueur->getById($joueur_id));
        
        // Verification si des equipes sont stockes en base
        if( $this->app->db->count(PREFIX . 'equipe') > 0):
        	$this->load_manager('equipe');
        	
	        // Verification si joueur inscrit dans une equipe
	        $EquipesJoueurs	=	$this->manager->equipe->getByJoueurId($Joueur->id);
	        
	        $this->app->smarty->assign(array(
	        	'EquipesJoueur'		=>	$EquipesJoueurs,
	        	'Equipes'			=>	$this->manager->equipe->getAll(),
	        ));
        
        endif;
        
        $this->app->smarty->assign(array(
        	'Joueur'		=>	$Joueur,
        	'Structure'		=>	$this->manager->structure->getById($Joueur->structure_id),
        	'Joueurs'		=>	$this->manager->joueur->getByStructureId($Joueur->structure_id),
        ));

		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'print_tab_structure_equipe.tpl');		
	}
	
	
	public function printTabMorphologieAction($joueur_id){		
		
	}	
}