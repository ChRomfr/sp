<?php

if( $_SESSION['utilisateur']['type'] != 'admin') exit;

class administrationController extends Controller{
    
    public function indexAction(){
        global $InfosInstall;
		
		$Stats = array(
			'NbJoueurs'			=>	$this->app->db->count(PREFIX . 'joueur'),
			'NbUtilisateurs'	=>	$this->app->db->count(PREFIX . 'user'),
			'NbClubs'			=>	$this->app->db->count(PREFIX . 'structure'),
			'NbEntrainements'	=>	$this->app->db->count(PREFIX . 'entrainement'),
		);
		
		$this->app->smarty->assign(array(
			'Stats'				=>	$Stats,
			'InfosInstall'		=>	$InfosInstall,
			'Module_form_perso'	=>	$this->formModuleIsActif(),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'index.tpl');
    }
    
    public function userIndexAction(){
    	$this->load_manager('utilisateur');
		$Users = $this->manager->utilisateur->getAll();
		
		$this->app->smarty->assign(array(
			'Utilisateurs'		=>	$Users,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'user_index.tpl');
    }
    
    /**
    *	Affiche et traite le formulaire d ajout utilisateur
    *
	*/
    public function userAddAction(){
        
        if( $this->app->HTTPRequest->postExists('user') ):
        	$this->load_model('utilisateur');
        	$this->load_manager('utilisateur','base_app');
        	
        	$User = new utilisateur( $this->app->HTTPRequest->postData('user') );
        	
        	if( $User->isValid() == false )
				goto print_form;
				
			if( $User->validPassword($_POST['password_repeat']) == false ){
				//$this->registry->smarty->assign('print_error', $this->lang['Mot_de_passe_invalide']);
				goto print_form;
			}	
			
			if( $this->app->HTTPRequest->postExists('suivi_medical_show_prive') ):
				$User->suivi_medical_show_prive = 1;
			else:
				$User->suivi_medical_show_prive = 0;
			endif;
			
			$User->widget_index_alerte = 0;
			$User->suivi_medical_add_commentaire = 0;
			$User->joueur_trombi = 0;
			$User->index_trombi = 0;
			$User->widget_index_blessure = 0;
			
			if( $User->type == 'joueur'):
				$User->id_liaison = $_POST['user']['id_liaison'];
			endif;
			
			$User->cryptPassword();

            $User->save();

			return $this->redirect( getLink('administration/userIndex'),3, $this->lang['Utilisateur_enregistre'] );
			
        endif;
        
        print_form:
		
		$this->app->smarty->assign(array(
			'TUAC'			=>	$this->app->getListe('TUAC'),
		));
		
        $this->getFormValidatorJs();
		
        return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'user_add.tpl');
        
    }  
    
    /**
    *	Affiche et traite le formulaire d edition utilisateur
    *
	*/  
    public function userEditAction($user_id){
    	
    	// Chargement des manager et des records
    	$this->load_manager('utilisateur');
    	
    	
    	 if( $this->app->HTTPRequest->postExists('user') ):
    	 
    	 	$User = $this->app->HTTPRequest->postData('user');
    	 	
    	 	if( isset($User['suivi_medical_add_commentaire']) )
	    	 	$User['suivi_medical_add_commentaire'] = 1;
	    	else
				$User['suivi_medical_add_commentaire'] = 0;
				
			if( isset($User['suivi_medical_show_prive']) )
	    	 	$User['suivi_medical_show_prive'] = 1;
	    	else
				$User['suivi_medical_show_prive'] = 0;
    	 
    	 	$this->manager->utilisateur->save($User);
    	 	
    	 	return $this->redirect( getLink('administration/userIndex'),3, $this->lang['Utilisateur_enregistre'] );
    	 endif;
    	
    	
    	print_form:
        
    	// Recuperation de l utilisateur
    	$User = $this->manager->utilisateur->getById($user_id);
    	
    	$Joueurs = $this->app->db->get(PREFIX . 'joueur',null,'nom');
    	
    	// On verifie que l utilisateur n'est pas le compte admin
    	if( $User['identifiant'] == 'admin' ):
    		return $this->userIndexAction();
    	endif;
    	
    	// Chargement du controle du formulaire
    	$this->getFormValidatorJs();
    	
    	// Envoie des vars aux templates
    	$this->app->smarty->assign(array(
    		'User'			=>	$User,
			'TUAC'			=>	$this->app->getListe('TUAC'),
			'Joueurs'		=>	$Joueurs,
    	));
    	
    	// Generation de la page
    	return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'user_edit.tpl');
    }
    
    /**
    *	Gere la suppression des comptes utilisateurs
	*/
    public function userDeleteAction($user_id){
    	// Chargement des manager et des records
    	$this->load_manager('utilisateur');
    	
    	// Recuperation de l utilisateur
    	$User = $this->manager->utilisateur->getById($user_id);
    	
    	// On verifie que l utilisateur n'est pas le compte admin
    	if( $User['identifiant'] == 'admin' ):
    		return $this->userIndexAction();
    	endif;
    	
    	$this->manager->utilisateur->delete($user_id);
    	
    	// Suppression de toutes les sessions de la base pour forcer l utilisateur a etre jeter s il est en ligne
    	$this->app->db->delete(PREFIX . 'sessions', null, array('user_id =' => $user_id) );
    	
    	return $this->redirect( getLink('administration/userIndex'),3, $this->lang['Utilisateur_supprime'] );
    }
    
    /**
    *	Fonction appeller en AJAX permettant active/desactiver le compte
    *	dans la liste des utilisateurs
    *	Protection contre la desactivation du compte admin
	*/
    public function userChangeStatutAccountAction($user_id){
    	
    	// Chargement des manager et des records
    	$this->load_manager('utilisateur');
    	
    	// Recuperation de l utilisateur
    	$User = $this->manager->utilisateur->getById($user_id);
    	
    	// On verifie que l utilisateur n'est pas le compte admin
    	if( $User['identifiant'] == 'admin' ):
    		return "Error ...";
    	endif;
    	
    	if( $User['actif'] == 0):
    		$this->app->db->update(PREFIX . 'user', array('actif' => 1), array('id =' => $User['id']) );
    		return '<a href="javascript:changeStatutAccount('. $User['id'] .')"><img src="'. $this->app->config['url'] . $this->app->config['url_dir'] . 'web/images/okSmall.png" /></a>';
    	elseif( $User['actif'] == 1 ):
    		$this->app->db->update(PREFIX . 'user', array('actif' => 0), array('id =' => $User['id']) );
    		// Suppression de toutes les sessions de la base pour forcer l utilisateur a etre jeter s il est en ligne
    		$this->app->db->delete(PREFIX . 'sessions', null, array('user_id =' => $user_id) );
    		return '<a href="javascript:changeStatutAccount('. $User['id'] .')"><img src="'. $this->app->config['url'] . $this->app->config['url_dir'] . 'web/images/noSmall.png" /></a>';
    	endif;    	
    }
	
	public function userCreatSportifAccountAction($Sportif_id){
		$Sportif = $this->app->db->get_one(PREFIX . 'joueur', array('id =' => $Sportif_id));
		
		// Verification si compte existe deja
		$Result = $this->app->db->count(PREFIX . 'user', array('type =' => 'joueur', 'id_liaison =' => $Sportif_id));
		
		if($Result > 0) exit;
		
		$User = array();
		
		$i = 1;
		$TestIdentifiant = 0;
		do {
			$User['identifiant'] = substr(strtolower($Sportif['prenom']),0,$i) . strtolower($Sportif['nom']);
			$TestIdentifiant = $this->app->db->count(PREFIX . 'user', array('identifiant =' => $User['identifiant']));
			$i++;
		} while($TestIdentifiant != 0);
		
		$User['password'] = cryptPassword('aze.123', $User['identifiant']);
		$User['last_connexion'] = 1;
		$User['actif'] = 1;
		$User['type'] = 'joueur';
		$User['id_liaison'] = $Sportif_id;
		$User['suivi_medical_show_prive'] = 0;
		$User['widget_index_alerte'] = 0;
		$User['suivi_medical_add_commentaire'] = 0;
		$User['widget_index_rss'] = 1;
		$User['flux_rss_1'] = "http://www.lerugbynistere.fr/rss.php";
		$User['flux_rss_2'] = "";
		$User['joueur_trombi'] = 0;
		$User['email'] = $Sportif['email'];
		$User['register_on'] = time();
		$User['index_trombi'] = 0;
		$User['widget_index_blessure'] = 0;
		
		// Enregistrement dans la base
		$this->app->db->insert(PREFIX . 'user', $User);
        
        // Envoie email au sportif
        $Corp_email = "Bonjour,\r\nVous compte sur : " . $this->app->config['url'] . $this->app->config['url_dir'] ."vient d etre creer.\r\n\r\nVoici vos informations pour vous connectez:\r\n\r\nIdentifiant : ". $User['identifiant'] . "\r\nMot de passe : aze.123\r\n\r\nPour des raisons de securite il est conseille de modifier votre mot de passe a la premiere connexion.";
        $Sujet = "Creation de votre compte";
		
        if( !empty($Sportif['email']) ):
          sendEmail($Sportif['email'], $this->app->config['email_contact'], $Sujet, $Corp_email, $Corp_email);
        endif;
        
		return $this->redirect( getLink('administration/userIndex'),3, $this->lang['Utilisateur_enregistre'] );
		
	}
    
    public function getJoueurListeAction(){
    	
    	$Joueurs = $this->app->db->get(PREFIX . 'joueur',null,'nom');
    	
    	$this->app->smarty->assign(array(
    		'Joueurs'		=>	$Joueurs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'get_joueur_liste.tpl');
    }
	
	// Gestion des formulaires
	
	private function formModuleIsActif(){
		
		foreach( $this->app->config['modules'] as $module ){
			//var_dump($this->app->config['modules']);
			if( $module['m_module'] == 'form_custom' && $module['m_active'] == 1 )
				return true;
		}
		
		return false;
	}
	
	public function formIndexAction(){
		
		if( $this->formModuleIsActif() == false ) return $this->indexAction();
		
		// Recuperation des champs enregistrer dans la base
		$Champs = $this->app->db->select('cf.*')->from(PREFIX . 'commun_form cf')->order('cf.cf_code_form')->get();
		
		// Envoie des champs a smarty
		$this->app->smarty->assign(array(
			'Champs'		=>	$Champs,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'form_index.tpl');
	}
	
	/**
    *	Fonction appeller en AJAX permettant active/desactiver le champ
	*/
    public function champChangeStatutAction($champ_id){    	
  	
    	$Champ = $this->app->db->get_one(PREFIX . 'commun_form', array('id =' => $champ_id) );
    	
    	if( $Champ['cf_actif'] == 0):
    		$this->app->db->update(PREFIX . 'commun_form', array('cf_actif' => 1), array('id =' => $champ_id) );
    		return '<img src="'. $this->app->config['url'] . $this->app->config['url_dir'] . 'web/images/okSmall.png" />';
    	elseif( $Champ['cf_actif'] == 1 ):
    		$this->app->db->update(PREFIX . 'commun_form', array('cf_actif' => 0), array('id =' => $champ_id) );
    		return '<img src="'. $this->app->config['url'] . $this->app->config['url_dir'] . 'web/images/noSmall.png" />';
    	endif;    	
    }
    	
	/**
    *	Fonction appeller en AJAX permettant rendre ou non le champ obligatoire
	*/
    public function champChangeRequiredAction($champ_id){    	
  	
    	$Champ = $this->app->db->get_one(PREFIX . 'commun_form', array('id =' => $champ_id) );
    	
    	if( $Champ['cf_required'] == 0):
    		$this->app->db->update(PREFIX . 'commun_form', array('cf_required' => 1), array('id =' => $champ_id) );
    		return '<img src="'. $this->app->config['url'] . $this->app->config['url_dir'] . 'web/images/okSmall.png" />';
    	elseif( $Champ['cf_required'] == 1 ):
    		$this->app->db->update(PREFIX . 'commun_form', array('cf_required' => 0), array('id =' => $champ_id) );
    		return '<img src="'. $this->app->config['url'] . $this->app->config['url_dir'] . 'web/images/noSmall.png" />';
    	endif;    	
    }
    
    public function settingAction(){
    	
    	if( $this->app->HTTPRequest->postExists('config') ){
			$config = $this->app->HTTPRequest->postData('config');
			
			foreach($config as $k => $v){
				$this->registry->db->update(PREFIX . 'config', array('valeur' => $v), array('cle =' => $k));
			}
			
			$this->app->cache->remove('config');
			
			return $this->redirect(getLink("administration/setting"), 3, $this->lang['Configuration_enregistree']);
		}
		
		/*$this->app->addJS('ckeditor/ckeditor.js');*/
		$this->app->smarty->assign('themes', getThemes());
		
		return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'setting.tpl');
    	
    }
	
    // Gestion des etablissements scolaire
    
    public function etabScolaireIndexAction(){
    
    	$this->load_manager('etabScolaire');
    	 
    	$Etabs	=	$this->manager->etabScolaire->getAll();
    	 
    	$this->app->smarty->assign(array(
    		'Etabs'		=>	$Etabs,	
    	));
    	
    	return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'etab_scolaire_index.tpl');
    }
    
    public function etabScolaireEditAction($etab_id){
    	
    	$this->load_manager('etabScolaire');
    	$this->load_model('etabScolaire');
    	
    	if( $this->app->HTTPRequest->postExists('etab') ):
    	
    		$Etab = new etabScolaire( $this->app->HTTPRequest->postData('etab') );
    	
    		$this->manager->etabScolaire->save($Etab); 
    		
    		return $this->redirect(getLink("administration/etabScolaireIndex"),3,$this->lang['Etablissement_enregistre']);
    		
    	endif;
    	
    	printform:
    	
    	$this->getFormValidatorJs();
    	
    	$this->app->smarty->assign(array(
    		'Etab'		=>	new etabScolaire( $this->manager->etabScolaire->getById($etab_id) ),
    	));
    	
    	return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'etab_scolaire_edit.tpl');
    }
    
    public function etabScolaireDeleteAction($etab_id){
    	
    	$this->load_manager('etabScolaire');
    	
    	$this->manager->etabScolaire->delete($etab_id);
    	
    	return $this->redirect(getLink("administration/etabScolaireIndex"),3,$this->lang['Etablissement_supprime']);
    }
    
    public function actuIndexAction(){
    	$this->load_manager('actualite');
    	
    	$this->app->smarty->assign(array(
    		'Actus'		=>	$this->manager->actualite->getAll(),
    	));
    	
    	return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'actu_index.tpl');
    }
    
    /**
     * Affiche et traite le formulaire permettant l ajout d actualite
     * 
     */
    public function actuAddAction(){
    	
    	if( $this->app->HTTPRequest->postExists('actu') ):
    		$this->load_manager('actualite');
    		$this->load_model('actualite');
    		$Actu = new actualite( $this->app->HTTPRequest->postData('actu') );
    		if($Result =  $Actu->isValid() !== true ):
    			echo $Result;
    			goto printform;
    		endif;
    		$this->manager->actualite->save($Actu);
    		return $this->redirect( getLink('administration/actuIndex'), 3, $this->lang['Actualite_enregistree'] );
    	endif;
    	
    	printform:
    	$this->getFormValidatorJs();
    	return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'actu_add.tpl');
    }
    
    /**
     * Affiche et traite le formuaire permettant la modification des actualite
     * 
     * @param int $actu_id
     */
    public function actuEditAction($actu_id){
    	
    	$this->load_manager('actualite');
    	$this->load_model('actualite');
    	
    	if( $this->app->HTTPRequest->postExists('actu') ):
	    	
	    	$Actu = new actualite( $this->app->HTTPRequest->postData('actu') );
    	
	    	if($Result =  $Actu->isValid() !== true ):	    		
	    		goto printform;
	    	endif;
	    	
	    	$this->manager->actualite->save($Actu);
	    	
	    	return $this->redirect( getLink('administration/actuIndex'), 3, $this->lang['Actualite_enregistree'] );
	    	
    	endif;
    	 
    	printform:
    	
    	$this->getFormValidatorJs();
    	$this->app->smarty->assign(array(
    		'Actu'		=>	new actualite( $this->manager->actualite->getById( $actu_id ) ),
    	));
    	
    	return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'actu_edit.tpl');
    }
    
    /**
     * Gere la suppression des actualites
     * @param int $actu_id
     */
    public function actuDeleteAction( $actu_id ){
    	
    	$this->load_manager('actualite');
    	
    	$this->manager->actualite->delete( $actu_id );
    	
    	return $this->redirect( getLink('administration/actuIndex'), 3, $this->lang['Actualite_supprimee'] );
    }
    
    public function connexionListeAction(){
        
        // Recuperation des 100 dernieres connexions
		/* comment 15/11/2012 */
        //$Connexions = $this->app->db->get(PREFIX . 'log_connexion', null, 'id DESC', 100);
        
		$Connexions	=	$this->app->db->select('lc.*, u.identifiant')
						->from(PREFIX . 'log_connexion lc')
						->left_join(PREFIX . 'user u','lc.user_id = u.id')
						->order('lc.id DESC')
						->limit(100)
						->get();
		
        $this->app->smarty->assign(array(
            'Connexions'        =>    $Connexions,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'connexion_liste.tpl');
    }
    
    public function errorPhpListeAction(){
        $Files = getFilesInDir(ROOT_PATH . 'log' . DS . 'error' . DS);
        
        $this->app->smarty->assign(array(
            'Files'        =>    $Files,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'error_php_liste.tpl');
    }
    
    public function getPhpErrorAction($File){
        $Contenu = @file(ROOT_PATH . 'log' . DS . 'error' . DS . $File);
        $errors = array();
        foreach($Contenu as $Row):
            $Tmp = explode('|',$Row);
            $errors[] = $Tmp;
        endforeach;
        
        $this->app->smarty->assign(array(
            'Errors'        =>    $errors,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'error_php_in_file.tpl');
    }
    
    public function organigrammeIndexAction(){
        
       $Datas   =   $this->app->db->select('op.*, cl.libelle as fonction_libelle')
                    ->from(PREFIX . 'organigramme_personne op')
                    ->left_join(PREFIX . 'commun_liste cl','op.fonction = cl.value')
                    ->where(array('cl.code =' => 'PORG'))
                    ->order('op.fonction')
                    ->get();
       
       $this->app->smarty->assign(array(
            'Rows'      =>  $Datas,
        ));
       
       return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'organigramme_index.tpl');
    }
    
    public function organigrammeAddAction(){
        
        if( $this->app->HTTPRequest->postExists('personne') ):
            $Data = $this->app->HTTPRequest->postData('personne');
            $this->app->db->insert(PREFIX . 'organigramme_personne', $Data);
            return $this->redirect(getLink('administration/organigrammeIndex'),3,$this->lang['Personne_enregistre']);
        endif;
        
        printform:
		
		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');        
			$this->app->smarty->assign('Sites', $this->manager->site->getAll());
		endif;
        
        $this->getFormValidatorJs();
        
        $this->app->smarty->assign(array(
            'PORG'      =>  $this->app->getListe('PORG','value'),
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'organigramme_add.tpl');
    }

    public function organigrammeEditAction($personne_id){
        
        if( $this->app->HTTPRequest->postExists('personne') ):
            $Data = $this->app->HTTPRequest->postData('personne');
            $this->app->db->update(PREFIX . 'organigramme_personne', $Data, array('id =' => $Data['id']));
            return $this->redirect(getLink('administration/organigrammeIndex'),3,$this->lang['Personne_enregistre']);
        endif;
        
        printform:
		
		if( $this->app->config['multi_site'] == 1 ):
			$this->load_manager('site');        
			$this->app->smarty->assign('Sites', $this->manager->site->getAll());
		endif;
        
        $this->getFormValidatorJs();
        
        $this->app->smarty->assign(array(
            'PORG'      =>  $this->app->getListe('PORG','value'),
            'Personne'  =>  $this->app->db->get_one(PREFIX . 'organigramme_personne', array('id =' => $personne_id) ),
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'organigramme_edit.tpl');
    }
    
    public function organigrammeDeleteAction($personne_id){        
       $this->app->db->delete(PREFIX . 'organigramme_personne', $personne_id);
       return $this->redirect(getLink('administration/organigrammeIndex'),3,$this->lang['Personne_supprimee']);
    }
    
    public function resizeImageJoueurAction(){
        @set_time_limit(0);
        
        require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
        
        // Recuperation de tous les joueurs
        $Joueurs = $this->app->db->get(PREFIX . 'joueur');
        
        // On parcour la liste de joueur
        foreach( $Joueurs as $Row):
            
            // On verifie si le fichier photo existe
            if( is_file(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS . 'photo_id.jpg') ):
            
                    $handle = new upload(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS . 'photo_id.jpg');
                    $handle->file_new_name_body   = 'image_resized';
                    $handle->image_resize         = true;
                    $handle->image_x              = 600;
                    $handle->image_ratio_y        = true;
                    
                    $handle->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS);
                   
                   if( is_file(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS . 'image_resized.jpg') ):
                    unlink(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS . 'photo_id.jpg');
                    rename(ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS . 'image_resized.jpg', ROOT_PATH . 'web' . DS . 'upload' . DS . 'joueurs' . DS . $Row['id'] . DS . 'photo_id' . DS . 'photo_id.jpg');
                   endif;
                   
            endif;
        endforeach;
        
        return "END";
    }
	
	public function siteIndexAction(){
		
		$this->load_manager('site');
		
		$Sites = $this->manager->site->getAll();
		
		$this->app->smarty->assign(array(
			'Sites'		=>	$Sites,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'site_index.tpl');
		
	}
	
	public function siteAddAction(){		
        
        if( $this->app->HTTPRequest->postExists('site') ){
            $this->load_manager('site');            
            
            $Site = $this->registry->HTTPRequest->postData('site');			
            
            $this->manager->site->insert($Site);
			
            isInDbCpVille($Site['code_postal'], $Site['ville']);
			
            return $this->redirect( getLink('administration/siteIndex'),3, $this->lang['Site_enregistre'] );
        }
        
        printform:
        $this->getFormValidatorJs();
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'site_add.tpl');
	}
	
	public function siteEditAction($id){
		
        $this->load_manager('site');
        
        if( $this->app->HTTPRequest->postExists('site') ){    
		
            $Site =  $this->app->HTTPRequest->postData('site');
			
            $this->manager->site->update($Site);
			
            isInDbCpVille($Site['code_postal'], $Site['ville']);
			
            return $this->redirect( getLink('administration/siteIndex'),3, $this->lang['Site_enregistre'] );
            			
        }
        
        printform:
        $this->app->smarty->assign('Sites', $this->manager->site->getById($id) );
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'site_edit.tpl');
		
	}
	public function siteDeleteAction($id){
		
		$this->app->db->delete(PREFIX . 'site', $id);
		$this->app->db->update(PREFIX . 'joueur', array('site_id' => 0), array('site_id =' => $id) );
		
		return $this->redirect( getLink('administration/siteIndex'),3, $this->lang['Site_supprime'] );
	}
	
	public function equipeIndexAction(){
		
		$this->load_manager('equipe');
		
		$Equipes = $this->manager->equipe->getAll();
		
		$this->app->smarty->assign(array(
			'Equipes'		=>	$Equipes,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'equipe_index.tpl');
	}
	
	public function equipeAddAction(){
		
		if( $this->app->HTTPRequest->postExists('equipe') ){
			
            $this->load_manager('equipe');            
            
            $Equipe = $this->registry->HTTPRequest->postData('equipe');			
            
            $this->manager->equipe->save($Equipe);
			
            return $this->redirect( getLink('administration/equipeIndex'),3, $this->lang['Equipe_enregistree'] );
        }
        
        printform:
		
		if( $this->app->config['sport_champ_structure'] == 1):			
			$this->load_manager('structure');
		
			$this->app->smarty->assign(array(
				'Structures'		=>	$this->manager->structure->getAll(),
			));
		endif;
		
        $this->getFormValidatorJs();
		
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'equipe_add.tpl');
		
	}
	
	public function equipeEditAction($id){
		
		$this->load_manager('equipe');
		
		if( $this->app->HTTPRequest->postExists('equipe') ){
                        
            $Equipe = $this->registry->HTTPRequest->postData('equipe');			
            
            $this->manager->equipe->save($Equipe);
			
            return $this->redirect( getLink('administration/equipeIndex'),3, $this->lang['Equipe_enregistree'] );
        }
        
        printform:
		$this->load_manager('structure');
		
		$this->app->smarty->assign(array(
			'Structures'		=>	$this->manager->structure->getAll(),
			'Equipe'			=>	$this->manager->equipe->getById($id),
		));
		
        $this->getFormValidatorJs();
        return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'equipe_edit.tpl');
		
	}
	
	public function equipeDeleteAction($id){
		$this->app->db->delete(PREFIX . 'equipe', $id);
		$this->app->db->delete(PREFIX . 'joueur_equipe',null, array('equipe_id =' => $id));
		return $this->redirect( getLink('administration/equipeIndex'),3, $this->lang['Equipe_supprimee'] );
	}
	
	
	public function programmationTypeIndexAction(){
	
		$Types	=	$this->app->db->get(PREFIX . 'programmation_type', null, 'nom');
		
		$this->app->smarty->assign(array(
			'Types'		=>	$Types,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'programmation_type_index.tpl');
		
	}
	
	public function programmationTypeAddAction(){
	
		if( $this->app->HTTPRequest->postExists('type') ):
			$Type = $this->registry->HTTPRequest->postData('type');
			$this->app->db->insert(PREFIX . 'programmation_type', $Type);
			return $this->redirect( getLink('administration/programmationIndex'),3, $this->lang['Type_ajoute'] );
		endif;
		
		$this->app->AddJS('mColorPicker.min.js');
		return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'programmation_type_add.tpl');
	}
	
	public function programmationTypeEditAction($tid){
	
		if( $this->app->HTTPRequest->postExists('type') ):
			$Type = $this->registry->HTTPRequest->postData('type');
			$this->app->db->update(PREFIX . 'programmation_type', $Type);
			return $this->redirect( getLink('administration/programmationIndex'),3, $this->lang['Type_modifie'] );
		endif;
		
		$this->app->smarty->assign(array(
			'Type'		=>	$this->app->db->get_one(PREFIX . 'programmation_type', array('id =' => $tid)),
		));
		$this->app->AddJS('mColorPicker.min.js');
		return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'programmation_type_edit.tpl');
	}
	
	public function programmationTypeDeleteAction($tid){
	
		$this->app->db->delete(PREFIX . 'programmation_type', $tid);
		$this->app->db->delete(PREFIX . 'programmation', null, array('type =' => $tid) );
		return $this->redirect( getLink('administration/programmationTypeIndex'),3, $this->lang['Type_supprime'] );

	}
	
	public function aclIndexAction(){
		// Recuperation des ACLs
		$Acls = $this->app->db->get(PREFIX . 'acl_model');
		
		// Envoie � smarty
		$this->app->smarty->assign(array(
			'ACLs'		=>	$Acls,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'administration' . DS . 'acl_index.tpl');
	}
	
	public function aclAjaxChangeAction(){
	    
		$typeAccount = 	$this->app->HTTPRequest->getData('typeAccount');
		$aclName = 	$this->app->HTTPRequest->getData('aclName');
		$aclValeur = 	$this->app->HTTPRequest->getData('aclValeur');
		
		if( $aclValeur == 0):
		    $Valeur = 1;
		elseif( $aclValeur == 1 ):
		    $Valeur = 0;
		else:
		    $Valeur = 0;
		endif;
		
		
		$this->app->db->update(PREFIX . 'acl_model', array($aclName => $Valeur), array('account_type =' => ''. $typeAccount .'' ) );
		
		return 1;
	}
	
	public function aclAjaxClearAction(){
		$this->app->db->exec("TRUNCATE acl");
		return $this->lang['Operation_terminee'];
	}
	
	public function sportifIndexAction(){
		
	}
	
	public function matiereIndexAction(){
	
		$Matieres = $this->app->db->get(PREFIX . 'matiere');
		
		$this->app->smarty->assign(array(
			'Matieres'		=>	$Matieres,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'matiere_index.tpl');
		
	}
	
	public function matiereAddAction(){
		
		if( $this->app->HTTPRequest->postExists('matiere') ):
			$Matiere = $this->app->HTTPRequest->postData('matiere'); 
			
			if( empty($Matiere['matiere']) ):
				return $this->redirect( getLink('administration/matiereIndex'),0,'');
			endif;
			
			$this->app->db->insert(PREFIX . 'matiere', $Matiere);
			
			return $this->redirect( getLink('administration/matiereIndex'),0,'');
		endif;
	
		printform:
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'matiere_ajax_form_add.tpl');
	}
	
	
	public function matiereEditAction($matiere_id){
	
		if( $this->app->HTTPRequest->postExists('matiere') ):
			$Matiere = $this->app->HTTPRequest->postData('matiere'); 
			
			if( empty($Matiere['matiere']) ):
				return $this->redirect( getLink('administration/matiereIndex'),0,'');
			endif;
			
			$this->app->db->update(PREFIX . 'matiere', $Matiere, array('id =' => $Matiere['id']));
			
			return $this->redirect( getLink('administration/matiereIndex'),0,'');
		endif;
	
		printform:
		
		$this->app->smarty->assign(array(
			'Matiere'		=>	$this->app->db->get_one(PREFIX . 'matiere', array('id =' => $matiere_id)),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'matiere_ajax_form_edit.tpl');
	
	}
    
	public function matiereDeleteAction($matiere_id){
		$this->app->db->delete(PREFIX . 'matiere', $matiere_id);
		$this->app->db->delete(PREFIX . 'joueur_scolaire_matiere_note', null, array('matiere_id =' => $matiere_id));
		return $this->redirect( getLink('administration/matiereIndex'),0,'');
	}
    
    /**
     *  Fonction qui recupere les dernieres actualit� de dev du projet sur la table sport gestion
     *  @return code HTML pour affichage
     */
    public function devActuAjaxGetAction(){
      
      $Actus =  $this->app->db->select('*')
                ->from('sport_gestion.changelogs sgc')
                ->order('sgc.date DESC')
                ->limit(1)
                ->get();
                
      $this->app->smarty->assign(array(
        'Actus'   =>  $Actus,
      ));
      
      return $this->app->smarty->fetch( VIEW_PATH . 'administration' . DS . 'dev_actu_ajax_get.tpl');
    }

    /**
     * Affiche la liste des saisons dans l'administration
     * @return [type] [description]
     */
    public function saisonindexAction(){

        $this->load_model('saison');

        $saison = new saison();

        $this->registry->smarty->assign(array(
            'saisons'   =>  $saison->get(),
        ));
    
        return $this->registry->smarty->fetch(VIEW_PATH . 'administration' . DS . 'saisonindex.tpl');
    }
    
    /**
    *   Affiche et traite le formulaire qui permet l ajout d'une saison dans la  base
    *   @return mixed code HTML
    */
    public function saisonaddAction(){

        $this->load_model('saison');

        if( $this->registry->HTTPRequest->postExists('saison') ){
            // Créer l objet saison
            $saison = new saison($this->registry->HTTPRequest->postData('saison'));
            
            // On verifie que les donnees passe sont valides
            if( $saison->isValid() !== true ){
                goto printform;
            }
            
            // On enregistre
            $saison->save();
            
            // Redirection de l utilisateur
            return $this->redirect(getLink('administration/saisonindex'),3,'Saison ajoutée');
        }

        printform:

        return $this->registry->smarty->fetch(VIEW_PATH . 'administration' . DS . 'saisonadd.tpl');

    }

}