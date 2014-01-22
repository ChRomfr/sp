<?php

class organigrammeController extends Controller{
    
    public function indexAction(){
        
        $Personnes  =   $this->app->db->select('op.*, cl.libelle as fonction_libelle, s.nom as site')
                        ->from(PREFIX . 'organigramme_personne op')
                        ->left_join(PREFIX . 'commun_liste cl','op.fonction = cl.value')
						->left_join(PREFIX . 'site s','op.site_id = s.id')
                        ->where(array('cl.code =' => 'PORG'))
                        ->order('op.fonction')
                        ->get();
        
        $this->app->addCSS('organigramme.css');
                     
        $this->app->smarty->assign(array(
            'Personnes'      =>  $Personnes,
        ));
       
       return $this->app->smarty->fetch(VIEW_PATH . 'organigramme' . DS . 'index.tpl');
        
    }
    
}
