<?php

class musculationController extends Controller{
    
	/**
	 * @desc : Affiche la liste des exercices
	 * @return mixed
	 */
    public function indexAction(){
        
		if( $this->app->HTTPRequest->getExists('zone') ):
			$param['mez.zone_id ='] = $this->app->HTTPRequest->getData('zone');
		endif;
		
        $this->app->db->select('me.id, me.nom,GROUP_CONCAT(mz.nom) as zones, GROUP_CONCAT(mz.muscle) as muscles')
		->from(PREFIX . 'musculation_exercice me')
		->left_join(PREFIX . 'musculation_exercice_zone mez','me.id = mez.exercice_id')
		->left_join(PREFIX . 'muscu_zone mz','mez.zone_id = mz.id');
		
		if( isset($param) && is_array($param) ) $this->app->db->where($param);
						
		$Exercices = 	$this->app->db->group_by('me.id')->get();
        //var_dump($Exercices);
		
        $this->app->smarty->assign(array(
			'Exercices'     =>  $Exercices,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'index.tpl');
    }
    
    public function addExerciceAction(){
        
        if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect(getLink('index/index'),0,'');
        
        if( $this->app->HTTPRequest->postExists('exercice') ){
        	
            $exercice = $this->app->HTTPRequest->postData('exercice');
            $exercice['date_add'] = time();
            $eid = $this->app->db->insert(PREFIX . 'musculation_exercice', $exercice);
			
			// Recuperation des zones
			$Zones = $this->app->HTTPRequest->postData('zone');
			
			foreach($Zones as $Row):
				if( !empty($Row['zone_id']) ):
					$Row['exercice_id'] = $eid;
					$this->app->db->insert(PREFIX . 'musculation_exercice_zone', $Row);
				endif;
			endforeach;
            
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS, 0777);
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS, 0777);
            mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'images' . DS, 0777);
            
            // Traitement du fichier video si present
            require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
            $video = new Upload($_FILES['video']);
            if($video->uploaded):
	            $video->file_overwrite = true;
	            $video->file_new_name_body   = time();
	            $video->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS);
            endif;
            
           ///////////////////////////
           // Traitement des photos //
           ///////////////////////////
           
            // Recuperation ordre max des photos pour mettre a la suite
            $Tmp = $this->app->db->select('MAX(mep.ordre) as max_ordre')->from(PREFIX . 'muscu_exercice_photo mep')->get_one();
            
            if( empty($Tmp) ):
            	$Ordre = 1;
           	else:
           		$Ordre = $Tmp['max_ordre'] + 1;
           	endif;
           	
           	// Traitement de l upload
           	for ($i = 1; $i < 5; $i++) {
           		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
           		$image = new Upload($_FILES['image'.$i]);
           		if($image->uploaded):
	           		$image->file_overwrite = true;
	           		$image->file_new_name_body   = time().$i;
	           		$image->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'images' . DS);
	           		
	           		// Enregistrement dans la base
	           		$this->app->db->insert(PREFIX . 'muscu_exercice_photo', array('exercice_id' => $eid, 'photo' => $image->file_dst_name, 'ordre' => $Ordre));
	           		
	           		// On increment l ordre
	           		$Ordre++;
	           		
           		endif;
           	}
            
            
            return $this->redirect(getLink('musculation/index'),3,$this->lang['Exercice_ajoute']);
        }
        
        printform:
        $this->getFormValidatorJs();
        $this->getCkeditorJs();
		
		$this->app->smarty->assign(array(
			'Zones'		=>	$this->app->db->get(PREFIX . 'muscu_zone mz', null, 'mz.id'),
		));
		
        return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'exercice_add.tpl');
        
    }
    
    public function editExerciceAction($eid){
        
        if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect(getLink('index/index'),0,'');
        
        if( $this->app->HTTPRequest->postExists('exercice') ){
            $exercice = $this->app->HTTPRequest->postData('exercice');
            
            $this->app->db->update(PREFIX . 'musculation_exercice', $exercice);
			
			// Recuperation des zones
			$Zones = $this->app->HTTPRequest->postData('zone');
			$this->app->db->delete(PREFIX . 'musculation_exercice_zone', null, array('exercice_id =' => $exercice['id']));
			foreach($Zones as $Row):
				if( !empty($Row['zone_id']) ):
					$Row['exercice_id'] = $exercice['id'];
					$this->app->db->insert(PREFIX . 'musculation_exercice_zone', $Row);
				endif;
			endforeach;
            
            // Verification existance des dossiers
            // muscu ID
            // video
            // images
            if( !is_dir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS) ):
            	mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS, 0777);
            endif;
            
            if( !is_dir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS) ):
            	mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS, 0777);
            endif;
            
            if( !is_dir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'images' . DS) ):
            	mkdir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'images' . DS, 0777);
            endif;
            
            // Traitement du fichier video si present
            require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
	            $video = new Upload($_FILES['video']);
	            if($video->uploaded):
	            $video->file_overwrite = true;
	            $video->file_new_name_body   = time();
	            $video->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS);
            endif;
            
            ///////////////////////////
            // Traitement des photos //
            ///////////////////////////
             
            // Recuperation ordre max des photos pour mettre a la suite
            $Tmp = $this->app->db->select('MAX(mep.ordre) as max_ordre')->from(PREFIX . 'muscu_exercice_photo mep')->get_one();
            
            if( empty($Tmp) ):
            $Ordre = 1;
            else:
            $Ordre = $Tmp['max_ordre'] + 1;
            endif;
            
            // Traitement de l upload
            for ($i = 1; $i < 5; $i++) {
            	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'upload' . DS . 'class.upload.php';
            	$image = new Upload($_FILES['image'.$i]);
            	if($image->uploaded):
            	$image->file_overwrite = true;
            	$image->file_new_name_body   = time().$i;
            	$image->process(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'images' . DS);
            
            	// Enregistrement dans la base
            	$this->app->db->insert(PREFIX . 'muscu_exercice_photo', array('exercice_id' => $eid, 'photo' => $image->file_dst_name, 'ordre' => $Ordre));
            
            	// On increment l ordre
            	$Ordre++;
            
            	endif;
            }
            
            return $this->redirect(getLink('musculation/index'),3,$this->lang['Exercice_modifie']);
        }
        
        printform:
        $this->getFormValidatorJs();
        $this->getCkeditorJs();
		
		$Zones = $this->app->db->get(PREFIX . 'musculation_exercice_zone', array('exercice_id =' => $eid) );
		
		if( isset($Zones[0]) ) $this->app->smarty->assign('Z1',$Zones[0]['zone_id']);
		if( isset($Zones[1]) ) $this->app->smarty->assign('Z2',$Zones[1]['zone_id']);
		
        $this->app->smarty->assign(array(
            'Exercice'      =>  $this->app->db->get_one(PREFIX . 'musculation_exercice', array('id =' => $eid)),
			'Zones'			=>	$this->app->db->get(PREFIX . 'muscu_zone mz', null, 'mz.id'),
        ));
        return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'exercice_edit.tpl');
        
    }
    
    public function deleteExerciceAction($eid){
        if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect(getLink('index/index'),0,'');
        
		$this->app->db->delete(PREFIX . 'musculation_exercice', $eid);
		
		return $this->redirect( getLink('musculation/index'), 3, $this->lang['Exercice_supprime']);
    }
    
    public function ficheExerciceAction($eid){
		
		$Exercice	=	$this->app->db->select('me.*, GROUP_CONCAT(mz.nom) as zones, GROUP_CONCAT(mz.muscle) as muscles')
						->from(PREFIX . 'musculation_exercice me')
						->left_join(PREFIX . 'musculation_exercice_zone mez','me.id = mez.exercice_id')
						->left_join(PREFIX . 'muscu_zone mz','mez.zone_id = mz.id')
						->where(array('me.id =' => $eid))
						->group_by('me.id')
						->get_one();
               
        $this->app->smarty->assign(array(
            'Exercice'      =>  $Exercice,
        	'Photos'		=>	$this->app->db->get(PREFIX . 'muscu_exercice_photo', array('exercice_id =' => $eid), 'ordre'),
        ));
        
        if( $this->app->HTTPRequest->getExists('pdf') ){
            require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'mpdf' . DS . 'mpdf.php';
            $mpdf=new mPDF('c');           
            $mpdf->WriteHTML($this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'exercice_fiche.tpl'),2);
            $mpdf->Output();            
        }else{
        	// Recuperation des fichiers videos
        	$Videos = getFilesInDir(ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS, ROOT_PATH . 'web' . DS . 'upload' . DS . 'muscu' . DS . $eid . DS . 'video' . DS);
        	
        	$this->app->addJs('jwplayer.js');
        	$this->app->addJS('jquery.lightbox-0.5.min.js');
        	$this->app->addCSS('jquery.lightbox-0.5.css');
        	
        	$this->app->smarty->assign(array(
        		'Videos'		=>	$Videos,	
        	));
        	
            return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'exercice_fiche.tpl');
        }
        
    }
    
    public function addCycleAction($joueur_id){
		
		if( $this->app->HTTPRequest->postExists('cycle') ):

			$Cycle 		= $this->app->HTTPRequest->postData('cycle');
			$Exercices 	= $this->app->HTTPRequest->postData('exercice');
			
			// Verification données cycles
			
			// Formatage des données pour enregistrement
			$Cycle['date_debut'] = FormatDateToTimestamp($Cycle['date_debut']);
			$Cycle['date_fin'] = FormatDateToTimestamp($Cycle['date_fin']);
			
			// Sauvegarde en base
			$Cycle_id = $this->app->db->insert(PREFIX . 'musculation_cycle', $Cycle);
			
			if( isset($_POST['save_as_template']) ):
				$tpl_id = $this->app->db->insert(PREFIX . 'musculation_cycle_template', array('nom' => $Cycle['nom'], 'description' => $Cycle['description']) );
			endif;
			
			foreach($Exercices as $Row):
				if( $Row['poid'] != '' && $Row['repetition'] != '' && $Row['serie'] != ''):
					$Row['cycle_id'] = $Cycle_id;
					$this->app->db->insert(PREFIX . 'musculation_cycle_exercice', $Row);
						
					if( isset($_POST['save_as_template']) ):
						unset($Row['poid']);
						$Row['cycle_id'] = $tpl_id;
						$this->app->db->insert(PREFIX . 'musculation_cycle_template_exercice', $Row);
					endif;
					
				endif;				
			endforeach;
			
			return $this->redirect( getLink('joueur/fiche/'. $joueur_id .'?tab=musculation'), 3, $this->lang['Cycle_enregistre']);
			
		endif;
        
        printform:
		
		// Recuperation infos joueur
		$Joueur	= $this->app->db->get_one(PREFIX . 'joueur', array('id =' => $joueur_id));
        
		//	Recuperation des templates
		$Templates = $this->app->db->get(PREFIX . 'musculation_cycle_template', null, 'nom');
		
        // Recuperation des exercices
        $Exercices = $this->app->db->get(PREFIX . 'musculation_exercice', null, 'nom');
        
        // Envoie des datas a smarty
        $this->app->smarty->assign(array(
            'Exercices'     =>  $Exercices,
            'joueur_id'     =>  $joueur_id,
			'Templates'		=>	$Templates,
			'Joueur'		=>	$Joueur,
        ));
        
        $this->getFormValidatorJs();
        
        return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_add.tpl'); 
        
    } 

	public function editCycleAction( $cycle_id ){
		
		if( $this->app->HTTPRequest->postExists('cycle') ):

			$Cycle 		= $this->app->HTTPRequest->postData('cycle');
			$Exercices 	= $this->app->HTTPRequest->postData('exercice');
			$joueur_id	= $this->app->HTTPRequest->postData('joueur_id');
			
			// Verification données cycles
			
			// Formatage des données pour enregistrement
			$Cycle['date_debut'] = FormatDateToTimestamp($Cycle['date_debut']);
			$Cycle['date_fin'] = FormatDateToTimestamp($Cycle['date_fin']);
			
			// Sauvegarde en base
			$this->app->db->update(PREFIX . 'musculation_cycle', $Cycle);
			
			foreach($Exercices as $Row):
				
				if( isset($Row['ligne_db_id']) && ($Row['poid'] == '' || $Row['repetition'] == '' || $Row['serie'] == '') ):
					// Suppression de la ligne dans la base
					
					$this->app->db->delete(PREFIX . 'musculation_cycle_exercice', $Row['ligne_db_id']);
				elseif( isset($Row['ligne_db_id']) && !empty($Row['poid']) &&  !empty($Row['repetition']) &&  !empty($Row['serie'])  ):
					// Mise a jour de la ligne
					
					$id = $Row['ligne_db_id'];
					unset($Row['ligne_db_id']);
					$this->app->db->update(PREFIX . 'musculation_cycle_exercice', $Row, array('id =' => $id) );
				else:
					
					if( !empty($Row['poid']) &&  !empty($Row['repetition']) &&  !empty($Row['serie']) ):
						$Row['cycle_id'] = $cycle_id;
						$this->app->db->insert(PREFIX . 'musculation_cycle_exercice', $Row);
					endif;
				endif;
			endforeach;
			
			return $this->redirect( getLink('joueur/fiche/'. $joueur_id .'?tab=musculation'), 3, $this->lang['Cycle_enregistre']);
			
		endif;
        
        printform:
		
		$Exercices	=	$this->app->db->get(PREFIX . 'musculation_exercice');
		$Cycle 		= 	$this->app->db->get_one(PREFIX . 'musculation_cycle', array('id =' => $cycle_id) );
		
		$i=0;
		foreach( $Exercices as $Row ):
			$Data = "";
			$Data = $this->app->db->get_one(PREFIX . 'musculation_cycle_exercice', array('exercice_id =' => $Row['id'], 'cycle_id =' => $cycle_id) );
			if( !empty($Data) ):
				$Exercices[$i]['data'] = $Data;
			endif;
			$i++;
		endforeach;
		
		$this->app->smarty->assign(array(
			'Cycle'		=>	$Cycle,
			'Exercices'	=>	$Exercices,
		));
		
		$this->getFormValidatorJs();
		
		return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_edit.tpl');
		
	}
	
	public function getCycleByTemplateAction($tpl_id){
		
		if( $tpl_id != 'none'):
			$tpl = $this->app->db->get_one(PREFIX . 'musculation_cycle_template', array('id =' => $tpl_id) );
		endif;
		
		$joueur_id = $this->app->HTTPRequest->getData('joueur_id');
		
		if( $tpl_id == 'none' || empty($tpl) ):
			
			// Recuperation des exercices
			$Exercices = $this->app->db->get(PREFIX . 'musculation_exercice', null, 'nom');
			
			// Envoie des datas a smarty
			$this->app->smarty->assign(array(
				'Exercices'     =>  $Exercices,
				'joueur_id'     =>  $joueur_id,
			));
			
			return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_add_tpl_vide.tpl');
			
		else:
		
			// Recuperation des exercices
			$Exercices 	= 	$this->app->db->select('tmcte.repetition, tmcte.serie, tmcte.exercice_id, tme.nom')
							->from(PREFIX . 'musculation_cycle_template_exercice tmcte')
							->left_join(PREFIX . 'musculation_exercice tme', 'tmcte.exercice_id = tme.id')
							->where( array('cycle_id =' => $tpl_id) )
							->get();
					
			// Envoie des datas a smarty
			$this->app->smarty->assign(array(
				'Exercices'     =>  $Exercices,
				'joueur_id'     =>  $joueur_id,
				'tpl'			=>	$tpl,
			));
		
			return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_add_tpl.tpl');
		
		endif;		
	}
	
	public function detailCycleAction( $cycle_id ){
		$Cycle = $this->app->db->get_one(PREFIX . 'musculation_cycle', array('id =' => $cycle_id) );
		
		$Exercices	=	$this->app->db->select('tmce.*, tme.nom as exercice')
						->from(PREFIX . 'musculation_cycle_exercice tmce')
						->left_join(PREFIX . 'musculation_exercice tme', 'tmce.exercice_id = tme.id')
						->where(array('tmce.cycle_id =' => $cycle_id))
						->get();
						
		$this->app->smarty->assign(array(
			'Cycle'		=>	$Cycle,
			'Exercices'	=>	$Exercices,
		));
		
		if( $this->app->HTTPRequest->getExists('pdf') ):
		
		else:		
			return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_detail.tpl');
		endif;
	}
	
	/**
	 * @desc Gere la suppression d un cycle dans la base 
	 * @param int $cycle_id : identifiant du cycle dans la base
	 * @return mixed : Code Html de la page
	 */
	public function deleteCycleAction( $cycle_id ){
		if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect( getLink('index/index'), 0, '');
		
		$Cycle = $this->app->db->get_one(PREFIX . 'musculation_cycle', array('id =' => $cycle_id) );
		$this->app->db->delete(PREFIX . 'musculation_cycle', $cycle_id);
		$this->app->db->delete(PREFIX . 'musculation_cycle_exercice', null, array('cycle_id =' => $cycle_id));
		
		return $this->redirect( getLink('joueur/fiche/' . $Cycle['joueur_id'] . '?tab=musculation'), 3, $this->lang['Cycle_supprime']);
	}
	
	public function indexCycleTemplateAction(){
		
		if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect( getLink('index/index'), 0, '');
		
		$Cycles = $this->app->db->get( PREFIX . 'musculation_cycle_template', null, 'nom' );
		
		$this->app->smarty->assign(array(
			'Cycles'	=>	$Cycles,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_template_index.tpl');		
	}
	
	public function editCycleTemplateAction( $tpl_id ){
		if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect( getLink('index/index'), 0, '');
		
		if( $this->app->HTTPRequest->postExists('cycle') ):

			$Cycle 		= $this->app->HTTPRequest->postData('cycle');
			$Exercices 	= $this->app->HTTPRequest->postData('exercice');
			
			// Verification données cycles
					
			// Sauvegarde en base
			$this->app->db->update(PREFIX . 'musculation_cycle_template', $Cycle);
			
			foreach($Exercices as $Row):
				
				if( isset($Row['ligne_db_id']) && ( $Row['repetition'] == '' || $Row['serie'] == '') ):
					// Suppression de la ligne dans la base					
					$this->app->db->delete(PREFIX . 'musculation_cycle_template_exercice', $Row['ligne_db_id']);
					
				elseif( isset($Row['ligne_db_id']) && !empty($Row['repetition']) &&  !empty($Row['serie'])  ):
					// Mise a jour de la ligne
					
					$id = $Row['ligne_db_id'];
					unset($Row['ligne_db_id']);
					$this->app->db->update(PREFIX . 'musculation_cycle_template_exercice', $Row, array('id =' => $id) );
				else:
					
					if( !empty($Row['repetition']) &&  !empty($Row['serie']) ):
						$Row['cycle_id'] = $tpl_id;
						$this->app->db->insert(PREFIX . 'musculation_cycle_template_exercice', $Row);
					endif;
				endif;
			endforeach;
			
			return $this->redirect( getLink('musculation/indexCycleTemplate/'), 3, $this->lang['Cycle_enregistre']);
			
		endif;		
		
		printform:
		
		// Recuperation information cycle
		$Cycle = $this->app->db->get_one(PREFIX . 'musculation_cycle_template', array('id =' => $tpl_id) );
		
		// Traitement des exercices		
		$Exercices	=	$this->app->db->get(PREFIX . 'musculation_exercice');
		
		$i=0;
		foreach( $Exercices as $Row ):
			$Data = "";
			$Data = $this->app->db->get_one(PREFIX . 'musculation_cycle_template_exercice', array('exercice_id =' => $Row['id'], 'cycle_id =' => $tpl_id) );
			if( !empty($Data) ):
				$Exercices[$i]['data'] = $Data;
			endif;
			$i++;
		endforeach;
		
		$this->app->smarty->assign(array(
			'Cycle'		=>	$Cycle,
			'Exercices'	=>	$Exercices,
		));
		
		$this->getFormValidatorJs();
		
		return $this->app->smarty->fetch(VIEW_PATH . 'musculation' . DS . 'cycle_template_edit.tpl');
		
	}
	
	public function deleteCycleTemplateAction( $tpl_id ){
		if( $_SESSION['acl']['gest_muscu'] != true ) return $this->redirect( getLink('index/index'), 0, '');
		
		$this->app->db->delete( PREFIX . 'musculation_cycle_template', $tpl_id );
		
		$this->app->db->delete( PREFIX . 'musculation_cycle_template_exercice', null, array('cycle_id =' => $tpl_id) );
		
		return $this->redirect( getLink('musculation/indexCycleTemplate/'), 3, $this->lang['Modele_enregistre']);
	}
	
	
	
}