<?php
class parenController extends Controller{
    
    /**
    * Gere le formulaire d ajout d un parent via la fiche du joueur
    * 
    * @param mixed $joueur_id
    */
    public function addAction($joueur_id = null){

        # Verification des droits
        if( $_SESSION['acl']['gest_joueur'] != true ):
            return $this->redirect(getLink('index/index'),0,'');
        endif;
        
        # Verification que les donnees sont presente
        if( is_null($joueur_id) && $this->app->HTTPRequest->postExists('parent') == false):
        	return $this->redirect(getLink('index/index'),0,'');        
        endif;
        
        if( $this->app->HTTPRequest->postExists("parent") ):
            
            # On charge le model
            $this->load_model('paren');
           
            # On crée l objet 
            $parent = new paren( $this->registry->HTTPRequest->postData("parent")  );
            
            # Verification des donnees et enregistrement
            if( $parent->isValid() ):
                $parent->save();
                return $this->redirect( getLink('joueur/fiche/' . $parent['joueur_id'] ),0, $this->lang['Parent_ajoute'] );
            endif;
            
        endif;
        
        printform:

        # On envoie les donnees a smarty
        $this->app->smarty->assign('joueur_id', $this->registry->HTTPRequest->getData('joueur_id') );

        # Gneration du template
        return $this->app->smarty->fetch(VIEW_PATH . 'paren' . DS . 'add.tpl');
    }
    
    /**
    * Affiche et traite le formulaire d'edition d un parent
    * 
    * @param mixed $pid : ID du parent a modifie
    */
    public function editAction($pid = null){

        if( $_SESSION['acl']['gest_joueur'] != true ):
            return $this->redirect(getLink('index/index'),0,'');
        endif;
        
        if( is_null($pid) && $this->registry->HTTPRequest->postExists('parent') == false):
            return $this->redirect(getLink('index/index'),0,'');
        endif;
       
        $this->load_model('paren');
        
        if( $this->app->HTTPRequest->postExists('parent') ):
            
            $Parent = new paren( $this->app->HTTPRequest->postData('parent') );
            
            if( $Parent->isValid() === false):
                goto printform;
            endif;
            
            $Parent->save();
            
            return $this->redirect( getLink("joueur/fiche/" . $Parent->joueur_id), 3, $this->lang['Parent_modifie']);
            
        endif;
        
        printform:

        $this->load_manager('paren');

        $this->registry->smarty->assign('parent', new paren($this->manager->paren->getById($pid)) );

        return $this->registry->smarty->fetch(VIEW_PATH . 'paren' . DS . 'edit.tpl');
    }
    
    /**
    * Gere la suppression d'un parent dans la base de données
    * 
    * @param mixed $pid : ID du parent a supprimé
    */
    public function deleteAction($pid){
        
        if( $_SESSION['acl']['gest_joueur'] != true ) return $this->redirect(getLink('index/index'),0,'');
        $this->load_manager('paren');
        $this->load_model('paren');
        $Parent = new paren($this->manager->paren->getById($pid));
        $this->manager->paren->delete($pid);
        return $this->redirect( getLink("joueur/fiche/" . $Parent->joueur_id), 3, $this->lang['Parent_supprime']);
        
    }

    public function tabFicheAction($joueur_id){
        $this->load_manager('paren');
        $this->load_manager('joueur');        
        $this->app->smarty->assign('Joueur',  $this->manager->joueur->getById( $joueur_id ));
        $this->app->smarty->assign('Parents',  $this->manager->paren->getByJoueurId( $joueur_id ));
        return $this->app->smarty->fetch(VIEW_PATH . 'paren' . DS . 'tab_fiche.tpl');
    }
}
?>
