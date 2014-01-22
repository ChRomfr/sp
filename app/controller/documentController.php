<?php

class documentController extends Controller{
    
    
    public function indexAction(){
        
        if( $_SESSION['utilisateur']['type'] != 'admin' && $_SESSION['acl']['gest_document'] == 0):
            // Recuperation des fichiers en fonctions des Acls
            $Fichiers =     $this->app->db->select('d.*')
                            ->from(PREFIX . 'documents d')
                            ->left_join(PREFIX . 'documents_user du','d.id = du.fichier_id')
                            ->where(array('du.user_id =' => $_SESSION['utilisateur']['id']))
                            ->order('d.id DESC')
                            ->get();
        elseif($_SESSION['utilisateur']['type'] == 'admin' || $_SESSION['acl']['gest_document'] == 1):
            $Fichiers =     $this->app->db->select('d.*')
                            ->from(PREFIX . 'documents d')
                            ->order('d.id DESC')
                            ->get();
        endif;
        
        $this->app->smarty->assign(array(
           'Fichiers'       =>  $Fichiers,            
        ));
        
        return $this->app->smarty->fetch( VIEW_PATH . 'document' . DS . 'index.tpl' ); 
    }
    
    public function addAction(){        
        
        if( $this->app->HTTPRequest->postExists('fichier') ):
            $this->dirDocumentExists();
            
            $Fichier = $this->app->HTTPRequest->postData('fichier');
            
             // Traitement du fichier
            require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
            $File = new Upload($_FILES['doc']);
            if($File->uploaded):
                $File->file_overwrite = true;
                $File->file_new_name_body   = time();
                $File->process(ROOT_PATH . 'web' . DS. 'upload' . DS. 'documents' . DS);
            endif;
            
            $Fichier['fichier']   = $File->file_dst_name;
            $Fichier['extension']   = $File->file_dst_name_ext;
            
            // Enregistrement dans la base
            $Fichier_id = $this->app->db->insert(PREFIX . 'documents',$Fichier);
            
            // Traitement des Acls
            $Utilisateurs = $this->app->HTTPRequest->postData('users');
            foreach($Utilisateurs as $k => $v):
                $this->app->db->insert(PREFIX . 'documents_user', array('fichier_id' => $Fichier_id, 'user_id' => $v));
            endforeach;
            
            $this->notificationUsersFile($Utilisateurs, $Fichier);
            
            return $this->redirect( getLink('document/index'), 3, $this->lang['Fichier_ajoute']);
            
        endif;
        
        // Affichage du formulaire
        printform:
        
        $Utilisateurs   =   $this->app->db->select('u.id, u.identifiant')
                            ->from(PREFIX . 'user u')
                            ->where(array('u.actif =' => 1))
                            ->order('u.type, u.identifiant')
                            ->get();
                            
        $this->app->smarty->assign(array(
            'Utilisateurs'      =>  $Utilisateurs,
        ));
        
        return $this->app->smarty->fetch( VIEW_PATH . 'document' . DS . 'add.tpl' );
        
    }
    
    public function editAction($fichier_id){
        
        if( $this->app->HTTPRequest->postExists('fichier') ):
        
            $Fichier = $this->app->HTTPRequest->postData('fichier');
            
            $this->app->db->update(PREFIX . 'documents',$Fichier, array('id =' => $fichier_id) );
            
            // Traitement des Acls
            $Utilisateurs = $this->app->HTTPRequest->postData('users');
            $this->app->db->delete(PREFIX . 'documents_user', null, array('fichier_id =' => $fichier_id) );
            foreach($Utilisateurs as $k => $v):
                $this->app->db->insert(PREFIX . 'documents_user', array('fichier_id' => $fichier_id, 'user_id' => $v));
            endforeach;
            
            return $this->redirect( getLink('document/index'), 3, $this->lang['Fichier_modifie']);
            
        endif;
        
        // Affichage du formulaire
        printform:
        
        $Utilisateurs   =   $this->app->db->select('u.id, u.identifiant')
                            ->from(PREFIX . 'user u')
                            ->where(array('u.actif =' => 1))
                            ->order('u.type, u.identifiant')
                            ->get();
                            
        $this->app->smarty->assign(array(
            'Fichier'           =>  $this->app->db->get_one(PREFIX . 'documents', array('id =' => $fichier_id)),
            'Utilisateurs'      =>  $Utilisateurs,
            'UserInAcl'         =>  $this->app->db->get(PREFIX . 'documents_user', array('fichier_id =' => $fichier_id))
        ));
        
        return $this->app->smarty->fetch( VIEW_PATH . 'document' . DS . 'edit.tpl' );
    }
    
    /**
     *  Traite la suppression des documents
     *
     */
    public function deleteAction($fichier_id){
        
        // Recuperation des informations sur le fichier
        $Fichier = $this->app->db->get_one(PREFIX . 'documents', array('id =' => $fichier_id));
        
        // Suppression dans la base des données
        $this->app->db->delete(PREFIX . 'documents', $fichier_id);
        
        // Suppression des ACLs
        $this->app->db->delete(PREFIX . 'documents_user', null, array('fichier_id =' => $fichier_id));
        
        // Suppression du fichier
        @unlink(ROOT_PATH . 'web' . DS. 'upload' . DS. 'documents' . DS . $Fichier['fichier']);
        
        // Redirection du l utilisateur
        return $this->redirect( getLink('document/index'), 3, $this->lang['Fichier_supprime']);
    }
    
    /**
     *  Verifie la presence du dossiers documents et le créer sil n exise pas
     *
     */
    private function dirDocumentExists(){
        if( !is_dir(ROOT_PATH . 'web' . DS. 'upload' . DS. 'documents' . DS) ):
            mkdir(ROOT_PATH . 'web' . DS. 'upload' . DS. 'documents' . DS);
        endif;
    }
    
    /**
     *  Gere l envoie des emails aux utilisateurs
     *
     */
    private function notificationUsersFile($Utilisateurs, $Fichier){
        
        $Users = array();
        $Emails = array();
        
        // Recuperation des la listes utilisateurs ayant des adresses emails
        
        foreach( $Utilisateurs as $k => $v):
            $Users[] = $this->app->db->get_one(PREFIX . 'user', array('id =' => $v)); 
        endforeach;
        
        // On boucle sur les utilisateurs pour envoyer l email
        foreach($Users as $User):
            if( !empty($User['email']) ):
                $Emails[] = $User['email'];
            endif;
        endforeach;
        
        $Sujet = "Nouveau document disponible";
        $Corp_email = "Bonjour,\n\r\r\nUn nouveau document a ete mit a votre disposition.\r\n\r\nInformation sur le fichier :\r\n-". $Fichier['nom'] ."\r\n-" .$Fichier['description'] ." ";
        
        if( !empty($Emails)):
          sendEmail($Emails, $this->app->config['email_contact'], $Sujet, $Corp_email, $Corp_email);
        endif;
    }
}