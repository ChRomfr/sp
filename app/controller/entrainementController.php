<?php
class entrainementController extends Controller{
    
    public function indexAction(){
        
        if( $this->app->session->session['acl']['gest_entrainement'] != true ) return $this->redirect( getLink('index/index'),0,'' );
        
        $this->load_manager('entrainement');
        
        if( $this->app->HTTPRequest->getExists('order') ):
          $order = $this->app->HTTPRequest->getData('order');
          
          if( $order == 'type'):
            $Entrainements = $this->manager->entrainement->getAll('cl.libelle');
          elseif($order == 'entrainement'):
            $Entrainements = $this->manager->entrainement->getAll('e.description');
          else:
            $Entrainements = $this->manager->entrainement->getAll();
          endif;
          
        else:
          $Entrainements = $this->manager->entrainement->getAll();
        endif;
        
        $this->app->smarty->assign('Entrainements', $Entrainements);
        return $this->app->smarty->fetch( VIEW_PATH . 'entrainement' . DS . 'index.tpl');
    }
    
    public function deleteAction($eid){
        if( $this->app->session->session['acl']['gest_entrainement'] != true ) return $this->redirect( getLink('index/index'),0,'' );
        
        $this->app->db->delete(PREFIX . 'entrainement', $eid);  											 // Suppression de l entrainement
        $this->app->db->delete(PREFIX . 'joueur_entrainement', null, array('entrainement_id =' => $eid));    // Suppression liaison joueur / entrainement
        
        return $this->redirect( getLink('entrainement/index'), 3, $this->lang['Entrainement_supprime']);
        
    }
    
    public function editAction($eid){
        
		if( $this->app->session->session['acl']['gest_entrainement'] != true ) return $this->redirect( getLink('index/index'),0,'' );
		
        $this->load_manager('entrainement');
        $this->load_manager('joueur');
        
        if( $this->app->HTTPRequest->postExists('entrainement') ):            
            $Entrainement = $this->app->HTTPRequest->postData('entrainement');
            $tmp = explode('/', $Entrainement['date_entrainement']);
            $Entrainement['date_entrainement'] = mktime(14,0,0,$tmp[1],$tmp[0],$tmp[2]);
            $this->app->db->update(PREFIX . 'entrainement', $Entrainement);
            $joueurs = $this->registry->HTTPRequest->postData('joueur');
            
            // Suppression des donnees joueurs
            $this->app->db->delete(PREFIX . 'joueur_entrainement', null, array('entrainement_id =' => $Entrainement['id']));
            
            foreach( $joueurs as $row ){
                $row['entrainement_id'] = $Entrainement['id'];
                $this->registry->db->insert(PREFIX . 'joueur_entrainement', $row );
            }
            
            return $this->redirect( getLink('entrainement/index'),3,$this->lang['Entrainement_enregistre'] );
            
        endif;
        
        printform:
        $Entrainement = $this->app->db->get_one(PREFIX . 'entrainement', array('id =' => $eid));
        
        // Recuperation des joueurs
        $Joueurs = $this->manager->joueur->getDisponibleForTrainning($Entrainement['date_entrainement']);
        $i = 0;
        
        foreach( $Joueurs as $Row):
            $Data = $this->app->db->get_one(PREFIX . 'joueur_entrainement', array('entrainement_id =' => $eid, 'joueur_id =' => $Row['id']) );
            if( !empty($Data) ) $Joueurs[$i]['entrainement'] = $Data;
            
            if( USE_ENTRAINEMENT_CYCLE == true)
                $Joueurs[$i]['cycle'] = $this->app->db->get(PREFIX . 'joueur_entrainement_cycle', array('joueur_id =' => $Row['id'], 'date_debut <=' => $Entrainement['date_entrainement'], 'date_fin >=' => $Entrainement['date_entrainement']) );            
             
             $i++;
        endforeach;
        
        $this->app->smarty->assign(array(
            'Entrainement'      =>  $Entrainement,
            'Joueurs'           =>  $Joueurs,
			'TENT'				=>	$this->app->getListe('TENT'),
        ));
        
        $this->getFormValidatorJs();
        return $this->registry->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'edit.tpl');
    }
    
    public function addAction(){

        if( $_SESSION['acl']['gest_entrainement'] != true) $this->redirect( getLink('index/index'),0,'');
        
        // Enregistrement entrainement
        if( $this->registry->HTTPRequest->postExists('entrainement') ){

            # Recuperation de l entrainement
            $entrainement = $this->app->HTTPRequest->postData('entrainement');

            # Recuperation des joueurs
            $joueurs = $this->app->HTTPRequest->postData('joueur');
            
            if( !empty($entrainement['date_entrainement']) ){
				
                # On formate les dates
                $tmp                                = $entrainement['date_entrainement'];
                $entrainement['date_entrainement']  = FormatDateToTimestamp($tmp);
				$entrainement['date_e']             = FormatDateToMySQL($tmp);

                # Enregistrement de l entrainement dans la base
                $eid = $this->app->db->insert(PREFIX . 'entrainement', $entrainement);
                
                foreach( $joueurs as $row ):
                    if( $row['presence'] != ''):
                        $row['entrainement_id'] = $eid;
                        $this->registry->db->insert(PREFIX . 'joueur_entrainement', $row );
                    endif;
                endforeach;
                
                return $this->redirect( getLink('entrainement/index'),3,$this->lang['Entrainement_enregistre'] );
                
            }else{
                goto printform;
            }
        }
        
        printform:

        # Chargement des equipes si la config est sur 1
        if( $this->app->config['entrainement_filtre_equipe'] == 1):
            $this->load_manager('equipe');
            $Equipes = $this->manager->equipe->getAll();
            # On assign a smarty
            $this->app->smarty->assign('Equipes',$Equipes);
        endif;

        # Cas installations Full on recupere les listes AGE et TYPE entrainement
        if( $this->app->infosinstall['i_type'] == 'full'):
            $this->app->smarty->assign(array(
                'TENT'      =>  $this->app->getListe('TENT'),
                'ANFO'      =>  $this->app->getListe('ANFO'),
            ));
        endif;

        # On genere la page
        return $this->app->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'add.tpl');
    }
    
    /**
    * Recupere la liste des joueurs disponibles pour l entrainement en fonction de la date passe
    * - recupere la liste des joueurs
    * - verifie les blessures pour pré remplir le formulaire
    * - retourne le code HTML du formulaire
    * @param string $date_entrainement
    * @return mixed code html du formulaire parser dans smarty
    */
    public function getJoueurDisponibleAction(){

        # Envoie des variables a smarty
        $this->app->smarty->assign('Joueurs', $this->getJoueurDisponible());

        # Envoie du code HTML
        return $this->app->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'getJoueurDisponible.tpl');
    }

    /**
    * Recupere la liste des joueurs disponibles pour l entrainement en fonction de la date passe
    * - recupere la liste des joueurs
    * - verifie les blessures pour pré remplir le formulaire
    * @return json Liste des joueur
    */
    public function getJoueurDisponibleJSONAction(){

        return json_encode($this->getJoueurDisponible());

    }

    /**
    * Recupere la liste des joueurs disponibles pour l entrainement en fonction de la date passe
    * - recupere la liste des joueurs
    * - verifie les blessures pour pré remplir le formulaire
    * - retourne le code HTML du formulaire
    * @param string $date_entrainement
    * @return mixed code html du formulaire parser dans smarty
    */
    private function getJoueurDisponible(){

        $date_entrainement = $this->app->HTTPRequest->getData('date_e');
        
        // On eclate la date pour la recupere dans un tableau
        $tmp = explode('/', $date_entrainement);
        
        // Recuperation du timestamp de la date
        $date_entrainement = mktime(23,59,59,$tmp[1],$tmp[0],$tmp[2]);

        # Recuperation de l equipe
        $equipe_id = $this->app->HTTPRequest->getData('equipe');
               
        # Chargement des managers
        $this->load_manager('joueur');
        
        # Recuperation des joueurs
        $Joueurs = $this->manager->joueur->getDisponibleForTrainning( $date_entrainement, $equipe_id );
        
        if( $this->app->HTTPRequest->getExists('annee') ):
            $Annee = $this->app->HTTPRequest->getData('annee');
        else:
            $Annee = NULL;
        endif;
        
        if( !empty($Annee) ):
            $Annee = $this->app->HTTPRequest->getData('annee');
            $i=0;
            $JoueursTemp = array();
            switch ($Annee){
                case 1:
                    
                    foreach( $Joueurs as $Row):
                        $Duree = time() - $Row['date_entree'];
                        if( $Duree < 31536000 ):
                            $JoueursTemp[] = $Row;
                        endif;
                    endforeach;                 
                    break;
                    
                case 2:
                    foreach( $Joueurs as $Row):
                        $Duree = time() - $Row['date_entree'];
                        if( $Duree > 31536000 && $Duree <  31536000*2 ):
                            $JoueursTemp[] = $Row;
                        endif;
                    endforeach;
                    break;
                    
                case 3:
                    foreach( $Joueurs as $Row):
                        $Duree = time() - $Row['date_entree'];
                        if( $Duree >  31536000*2 ):
                            $JoueursTemp[] = $Row;
                        endif;
                    endforeach;
                    break;
            }
            
            $Joueurs = $JoueursTemp;
            
        endif;
        
        // Boucle sur les joueurs pour recuperer les cycles en cours
        if( USE_ENTRAINEMENT_CYCLE == true):
            $i=0;
            foreach( $Joueurs as $Row ){
                $Joueurs[$i]['cycle'] = $this->app->db->get(PREFIX . 'joueur_entrainement_cycle', array('joueur_id =' => $Row['id'], 'date_debut <=' => $date_entrainement, 'date_fin >=' => $date_entrainement) );
                $i++;
            }
        endif; 

        return $Joueurs;
    }

    public function addCycleAction($joueur_id){
        return $this->cycleAddAction($joueur_id);        
    }
    
    public function cycleAddAction($joueur_id){
        if( $_SESSION['acl']['gest_entrainement'] != true) $this->redirect( getLink('index/index'),0,'');
        
        if( $this->app->HTTPRequest->postExists('cycle') ):
            $Cycle = $this->app->HTTPRequest->postData('cycle');
            $Cycle['date_debut'] = FormatDateToTimestamp($Cycle['date_debut']);
            $Cycle['date_fin'] = FormatDateToTimestamp($Cycle['date_fin']);
            $this->app->db->insert(PREFIX . 'joueur_entrainement_cycle', $Cycle);
            return $this->redirect(getLink("joueur/fiche/" . $joueur_id . "?tab=entrainement"), 3, $this->lang['Cycle_enregistre']);
        endif;
        
        printform:
        
        $this->app->smarty->assign(array(
            'joueur_id'     =>  $joueur_id,
            'TCYC'			=>	$this->app->getListe('TCYC'),
        ));
        return $this->registry->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'cycle_add.tpl');
    }
    
    public function cycleEditAction($cycle_id){
        
        if( $_SESSION['acl']['gest_entrainement'] !=  true) return $this->redirect( getLink('index/index'), 0, '');
        
         if( $this->app->HTTPRequest->postExists('cycle') ):
            $Cycle = $this->app->HTTPRequest->postData('cycle');
            $Cycle['date_debut'] = FormatDateToTimestamp($Cycle['date_debut']);
            $Cycle['date_fin'] = FormatDateToTimestamp($Cycle['date_fin']);
            $this->app->db->update(PREFIX . 'joueur_entrainement_cycle', $Cycle);
            return $this->redirect(getLink("joueur/fiche/" . $Cycle['joueur_id'] . "?tab=entrainement"), 3, $this->lang['Cycle_enregistre']);
        endif;
        
        printform:
        $Cycle = $this->app->db->get_one(PREFIX . 'joueur_entrainement_cycle', array('id =' => $cycle_id));
        
        $this->getFormValidatorJs();
        
        $this->app->smarty->assign(array(
            'Cycle'     =>  $Cycle,
            'Joueur'    =>  $this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Cycle['joueur_id'])),
            'TCYC'			=>	$this->app->getListe('TCYC'),
        ));
        
        return $this->registry->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'cycle_edit.tpl');
    }
    
    public function cycleDeleteAction($cycle_id){
        if( $_SESSION['acl']['gest_entrainement'] !=  true) return $this->redirect( getLink('index/index'), 0, '');
        $Cycle = $this->app->db->get_one(PREFIX . 'joueur_entrainement_cycle', array('id =' => $cycle_id));
        $this->app->db->update(PREFIX . 'joueur_entrainement', array('cycle_id' => ''), array('cycle_id =' => $cycle_id) );
        $this->app->db->delete(PREFIX . 'joueur_entrainement_cycle', $cycle_id);
        return $this->redirect(getLink("joueur/fiche/" . $Cycle['joueur_id'] . "?tab=entrainement"), 3, $this->lang['Cycle_supprime']);
    }
    
    /**
    * Affiche les details d'un cycle
    * 
    * @param mixed $cycle_id
    * @return mixed Code HTML de la page
    */
    public function cycleDetailAction($cycle_id){
        
        $this->load_manager('entrainement');
        
        // Recuperation des données
        $Cycle = $this->app->db->get_one(PREFIX . 'joueur_entrainement_cycle', array('id =' => $cycle_id));
        $Entrainements = $this->manager->entrainement->getByCycleId($cycle_id);
        $Joueur = $this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Cycle['joueur_id']));
        
        // Envoie des données a smarty
        $this->app->smarty->assign(array(
            'Cycle'         =>  $Cycle,
            'Entrainements'  =>  $Entrainements,
            'Joueur'        =>  $Joueur,
        ));
        
        // Generation de la page
        return $this->app->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'cycle_detail.tpl');
    }
    
    public function entrainementDetailAction($entrainement_id){
		
		$this->load_manager('entrainement');
		
		// On test si $_GET['joueur_id'] existe
        if( $this->app->HTTPRequest->getExists('joueur_id') ): 
			$joueur_id = $this->app->HTTPRequest->getData('joueur_id');										// On recupere la valeur du joueur id
			$Entrainement = $this->manager->entrainement->getByIdAndJoueurId($entrainement_id, $joueur_id);	// On recupere les infos de l'entrainement
			$this->app->smarty->assign('Entrainement',$Entrainement);
		endif;
		
		
		return $this->app->smarty->fetch(VIEW_PATH . 'entrainement' . DS . 'entrainement_detail.tpl');
    }
}