<?php

class structureController extends Controller{
    
    public function indexAction(){
        
        $this->load_manager('structure');
        $Structures = $this->manager->structure->getAll();
        
        $this->registry->smarty->assign('Structures', $Structures);
        return $this->registry->smarty->fetch(VIEW_PATH . 'structure' . DS . 'index.tpl');
    }
    
    public function addAction(){
        
        if( $_SESSION['acl']['gest_structure'] != true ) $this->redirect( getLink('index/index'),0,'');
        
        if( $this->app->HTTPRequest->postExists('structure') ){
            $this->load_manager('structure');
            $this->load_model('structure');
            
            $Structure = new structure( $this->registry->HTTPRequest->postData('structure') );
            if( $Structure->isValid() == false ) goto printform;
            $this->manager->structure->insert($Structure);
            isInDbCpVille($Structure->code_postal, $Structure->ville);
            return $this->redirect( getLink('structure/index'),3, $this->lang['Structure_enregistree'] );
        }
        
        printform:
        if( $this->app->HTTPRequest->getExists('nohtml') == false) $this->getFormValidatorJs();
        return $this->app->smarty->fetch(VIEW_PATH . 'structure' . DS . 'add.tpl');
    }
    
    public function editAction($id){
	
        if( $_SESSION['acl']['gest_structure'] != true ) $this->redirect( getLink('index/index'),0,'');
        
        $this->load_manager('structure');
        $this->load_model('structure');
        
        if( $this->app->HTTPRequest->postExists('structure') ){    
		
            $Structure = new structure( $this->app->HTTPRequest->postData('structure') );
            if( $Structure->isValid() == false ) goto printform;
            $this->manager->structure->update($Structure);
            isInDbCpVille($Structure->code_postal, $Structure->ville);
            return $this->redirect( getLink('structure/index'),3, $this->lang['Structure_enregistree'] );
            			
        }
        
        printform:
        $this->app->smarty->assign('Structure', new structure( $this->manager->structure->getById($id) ));
        return $this->app->smarty->fetch(VIEW_PATH . 'structure' . DS . 'edit.tpl');
    }
    
    public function deleteAction($id){
        if( $_SESSION['acl']['gest_structure'] != true ) $this->redirect( getLink('index/index'),0,'');
        
        $this->app->db->delete(PREFIX . 'structure', $id);
        $this->app->db->update(PREFIX . 'joueur', array('structure_id' => ''), array('structure_id =' => $id) );
        
        return $this->redirect( getLink('structure/index'),3, $this->lang['Structure_supprimee'] );
    }
    
}