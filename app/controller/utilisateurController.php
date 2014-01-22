<?php

class utilisateurController extends BaseutilisateurController{
    
    public function profilAction(){
        
        return $this->app->smarty->fetch( VIEW_PATH . 'utilisateur' . DS . 'profil.tpl' );
        
    }
    
    /**
    *	Affiche et traite le formulaire de changement de mot de passe
    *
	*/
    public function changePasswordAction(){
        
        if( $this->app->HTTPRequest->postExists('password') ):
            $Password = $this->app->HTTPRequest->postData('password');
            
            // Verification que le mot de passe et le mot de passe actuel
            $Result = $this->app->db->count(PREFIX . 'user', array('id =' => $_SESSION['utilisateur']['id'], 'password =' => cryptPassword($Password['curent_password'],$_SESSION['utilisateur']['identifiant'])));
            
            if( $Result == 1):
                goto printform;
            endif;
            
            // Verification que les deux mots de passe sont identifiant
            if( $Password['new_password'] != $Password['new_password_repeat'] ):
                goto printform;
            endif;
            
            // Enregistrement du mot de passe
            $this->app->db->update(PREFIX . 'user', array('password' => cryptPassword($Password['new_password'], $_SESSION['utilisateur']['identifiant'])), array('id =' => $_SESSION['utilisateur']['id']) );
            
            return $this->redirect( getLink('utilisateur/index'), 0, $this->lang['Password_change']);
            
        endif;
        
        printform:
        $this->getFormValidatorJs();
        return $this->app->smarty->fetch( VIEW_PATH . 'utilisateur' . DS . 'change_password.tpl' );
        
    }
    
    /**
    *	Affiche et traite le formulaire d edition de profil ...
    *
	*/
    public function editProfilAction(){
    	
    	if( $this->app->HTTPRequest->postExists('user') ):
    		
    		$User = $this->app->HTTPRequest->postData('user');
    		
    		// Affichage ou non des flux rss
    		if( isset($User['widget_index_rss']) ):
    			$User['widget_index_rss'] = 1;
    			$_SESSION['utilisateur']['widget_index_rss'] = 1;
    		else:
    			$User['widget_index_rss'] = 0;
    			$_SESSION['utilisateur']['widget_index_rss'] = 0;
    		endif;
    		
    		// Affichage ou non des alertes
    		if( isset($User['widget_index_alerte']) ):
    			$User['widget_index_alerte'] = 1;
    			$_SESSION['utilisateur']['widget_index_alerte'] = 1;
    		else:
    			$User['widget_index_alerte'] = 0;
    			$_SESSION['utilisateur']['widget_index_alerte'] = 0;
    		endif;
    		
    		// Affichage du widget blessure
    		if( isset($User['widget_index_blessure']) ):
    			$User['widget_index_blessure'] = 1;
    			$_SESSION['utilisateur']['widget_index_blessure'] = 1;
    		else:
    			$User['widget_index_blessure'] = 0;
    			$_SESSION['utilisateur']['widget_index_blessure'] = 0;
    		endif;
    		
    		// Affichage trombi accueil
    		if( isset($User['index_trombi']) ):
    			$User['index_trombi'] = 1;
    			$_SESSION['utilisateur']['index_trombi'] = 1;
    		else:
    			$User['index_trombi'] = 0;
    			$_SESSION['utilisateur']['index_trombi'] = 0;
    		endif;
    		
    		$_SESSION['utilisateur']['joueur_trombi']	=	$User['joueur_trombi'];
    		$_SESSION['utilisateur']['flux_rss_1']		=	$User['flux_rss_1'];
    		$_SESSION['utilisateur']['flux_rss_2']		=	$User['flux_rss_2'];
    		
    		// Sauvegarde dans la base
    		$this->app->db->update(PREFIX . 'user', $User, array('id =' => $_SESSION['utilisateur']['id']) );
    		
    		return $this->redirect( getLink('utilisateur/index'), 3, $this->lang['Profil_mise_a_jour'] );
    		
    	endif;
    	
		print_form:    	
		$this->getFormValidatorJs();
    	return $this->app->smarty->fetch( VIEW_PATH . 'utilisateur' . DS . 'edit_profil.tpl' );
    }    
}