<?php
class trimestreController extends Controller{
 
    public function addAction(){
        
        if( $_SESSION['acl']['gest_joueur'] != true) $this->redirect( getLink('index/index'),0,'');
                
        //
        // Traitement du formulaire
        //
        if( $this->app->HTTPRequest->postExists('trimestre') ):
            $Trimeste  = $this->app->HTTPRequest->postData('trimestre');
            $Trimeste['trimestre'] = $Trimeste['number'] . '|' . $Trimeste['annee'];
            
            // Suppresion des index inutiles
            unset($Trimeste['number']);
            unset($Trimeste['annee']);
            
            // Enregistrement
            $tid = $this->app->db->insert(PREFIX . 'scolaire_trimestre', $Trimeste);
            
            // Redirection vers le bulletin
            return $this->redirect( getLink('bulletin/add/'. $tid), 3, $this->lang['Trimestre_ajoute']);
            
        endif;
        
        //
        //  Affichage du formulaire
        //
        printform:
		
		$Formations	=	$this->app->db->get(PREFIX . 'scolaire_formation', array('sportif_id =' => $this->app->HTTPRequest->getData('joueur_id')));
		
        $this->app->smarty->assign(array(
            'joueur_id' 	=> 	$this->app->HTTPRequest->getData('joueur_id'),
			'Formations'	=>	$Formations,
        ));
        
        return $this->registry->smarty->fetch(VIEW_PATH . 'trimestre' . DS . 'add.tpl');
    }   
 
    
}
?>
