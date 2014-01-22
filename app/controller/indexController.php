<?php

class indexController extends Controller{
    
    public function indexAction(){
    	
    	if( $_SESSION['utilisateur']['type'] == 'joueur') return $this->indexForJoueur();
		
    	$this->load_manager('SuiviMedical');
    	
		////////////////////////////
		// CODE TROMBI IN ACCUEIL //
		////////////////////////////
		$this->load_manager('joueur');
        $Joueurs = $this->manager->joueur->getAll( array('tj.actif =' => 1) );
        
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
        
        $this->registry->smarty->assign('Joueurs', $Joueurs);
        $Trombi =  $this->registry->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'trombi_for_index.tpl');
		
		$this->app->smarty->assign(array(
		'Trombi'		=>	$Trombi,
		'Blessures'		=>	$this->manager->SuiviMedical->getByDate(time()),
		));
		
        
        return $this->registry->smarty->fetch(VIEW_PATH . 'index' . DS . 'index.tpl'); 
        
    }
    
    private function indexForJoueur(){
    	
    	// Recuperation des cycles du joueurs
    	$Cycles	=	$this->app->db->select('mc.*')
    				->from(PREFIX . 'muscu_cycle mc')
    				->left_join(PREFIX . 'muscu_cycle_joueur mcj','mc.id = mcj.cycle_id')
    				->where(array('mcj.joueur_id =' => $_SESSION['utilisateur']['id_liaison'], 'mc.date_debut <' => time(), 'mc.date_fin >' => time() ))
    				->get();
    	
    	$this->app->smarty->assign(array(
    		'Cycles'		=>	$Cycles,	
    	));
    	
    	return $this->registry->smarty->fetch(VIEW_PATH . 'index' . DS . 'index_for_joueur.tpl');
    }
    
}