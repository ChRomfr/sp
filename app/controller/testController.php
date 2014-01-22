<?php

class testController extends Controller{
	
	public function indexAction(){
		
		$Tests = $this->app->db->get(PREFIX . 'test', null, 'date_test DESC');
		
		$this->app->smarty->assign(array(
			'Tests'		=>	$Tests,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'index.tpl' );
		
	}
	
	public function addAction(){
	
		if( $_SESSION['acl']['gest_entrainement'] != 1 ) return $this->redirect( getLink('index/index'),0,'');
		
		if( $this->app->HTTPRequest->postExists( 'test' ) ){
			
			$test = $this->app->HTTPRequest->postData( 'test' );
			
			// Sauvegarde du test
			/* comment 15/11/2012 */
			//$test_id = $this->app->db->insert(PREFIX . 'test', array('date_test' => FormatDateToTimestamp($test['date_test']) ));
			//unset($test['date_test']);
			/* comment 15/11/2012 */
			 
			$test_id = $this->app->db->insert(PREFIX . 'test', array('date_test' => FormatDateToTimestamp($test['date_test']), 'creat_on' => $test['creat_on'], 'creat_by' => $test['creat_by'], 'edit_on' => $test['edit_on'], 'edit_by' => $test['edit_by']) );
            unset($test['date_test'],$test['creat_by'],$test['creat_on'],$test['edit_by'],$test['edit_on']);
			
			// Sauvegarde des resultat par rapport au utilisateur
			foreach($test as $Row):
				
				if( isset($Row['present']) ):
					$this->app->db->insert(PREFIX . 'test_joueur', array('test_id' => $test_id, 'joueur_id' =>$Row['joueur_id']) );
					// On reparcourt les valeurs pour l'array contenant l exo_id et le resultat.
					foreach($Row as $k => $v):
						if( is_array($v) ):
							// On complete les infos et on enregistre en base
							$v['test_id'] = $test_id;
							$v['joueur_id'] = $Row['joueur_id']; 
							$this->app->db->insert(PREFIX . 'test_resultat', $v);
						endif;
					endforeach;
				endif;
			endforeach;
						
			return $this->redirect( getLink('test/index') ,3 ,$this->lang['Test_ajoute']);
		}
		
		print_form:
		
		$this->app->smarty->assign(array(
			'Exercices'		=>	$this->app->db->get(PREFIX . 'test_exercices'),
			'Joueurs'		=>  $this->app->db->get(PREFIX . 'joueur', array('date_entree <' => time(), 'actif =' => 1), 'nom')
		));
		
		$this->getFormValidatorJs();
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'add.tpl' );
		
	}
	
	public function detailTestAction($test_id){
		$param = NULL;
		
		$Test = $this->app->db->get_one(PREFIX . 'test', array('id =' => $test_id) );
		
		if( $this->app->HTTPRequest->getExists('sexe')  ):
			$param = array('j.sexe =' => $this->app->HTTPRequest->getData('sexe'), 'tj.test_id =' => $test_id );
		else:
			$param = array( 'tj.test_id =' => $test_id );
		endif;
		
		$Exercices = $this->app->db->get(PREFIX . 'test_exercices', array('date_add <' => time() ));
		//$Joueurs =  $this->app->db->get(PREFIX . 'joueur', $param , 'nom');
		
		$Joueurs = $this->app->db->select('j.id, j.prenom, j.nom')->from(PREFIX . 'test_joueur tj')->left_join(PREFIX . 'joueur j','tj.joueur_id = j.id')->where( $param )->order('j.nom')->get();
		
		$tableau = '
			<table class="table table-bordered table-striped table-hover table-condensed" id="tableau_test">
			<thead>
			<tr>
			<th>'. $this->lang['Joueur'] .'</th>';
		
		foreach($Exercices as $Exercice):
			$tableau .= '<th>'. $Exercice['nom'] .'</th>';
		endforeach;
		
		$tableau .= '</tr></thead><tbody>';
		
		foreach($Joueurs as $Joueur):
			$tableau .= '<tr><td><a href="'. getLink('joueur/fiche/'. $Joueur['id']) .'">'. $Joueur['nom'] .' ' . $Joueur['prenom'];
			
			if( $_SESSION['acl']['gest_entrainement'] == 1 ):
				$tableau .= '&nbsp;&nbsp;<a href="javascript:deleteUserTest('. $Joueur['id'] .','. $test_id .')" title=""><i class="icon-trash"></i></a>';
			endif;
			
			$tableau .= '</td>';
			foreach($Exercices as $Exercice):
				$Data = $this->app->db->get_one(PREFIX . 'test_resultat', array('joueur_id =' => $Joueur['id'], 'test_id =' => $test_id, 'exercice_id =' => $Exercice['id']));
				$tableau .= '<td><a href="javascript:getDataByExoAndPlayer('.$Data['exercice_id'].','.$Joueur['id'].');" title="">'. $Data['resultat'] .'</a></td>';
			endforeach;
			$tableau .= '</tr>';
		endforeach;
		
		$this->app->smarty->assign(array(
			'Tableau'		=>	$tableau  . '</tbody></table>',
			'Test'			=>	$this->app->db->get_one(PREFIX . 'test', array('id =' => $test_id)),
		));
		
		$this->app->addJS('jquery.tablesorter.min.js');
		

		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'detail_test.tpl' );
	}
	
	/**
	 * Supprime un utilisateur d'un test
	 * 
	 */
	public function removeUserFormTestAction(){
		
		// Verification des droits
		if( $_SESSION['acl']['gest_entrainement'] != 1 ):
			return $this->redirect( getLink('index/index'),0,'');
		endif;
		
		// Recuperation des variables
		$Joueur_id	=	$this->app->HTTPRequest->getData('joueur_id');
		$Test_id	=	$this->app->HTTPRequest->getData('test_id');
		
		// Suppression
		$this->app->db->delete(PREFIX . 'test_joueur', null, array('joueur_id =' => $Joueur_id, 'test_id =' => $Test_id));
		$this->app->db->delete(PREFIX . 'test_resultat', null, array('joueur_id =' => $Joueur_id, 'test_id =' => $Test_id));
		
		// Redirection de l utilisateur
		return $this->redirect( getLink('test/detailTest/'. $Test_id), 3, $this->lang['Joueur_supprime']);
		
	}
	
	public function addJoueurInTestAction($Test_id){
		
		if( $this->app->HTTPRequest->postExists('resultat') ):
		
			$Resultat = $this->app->HTTPRequest->postData('resultat');
			
			$Joueur_id = $Resultat['joueur_id'];
			unset($Resultat['joueur_id']);
			
			// Enregistrement de l utilisateur dans la table de liaison
			$this->app->db->insert(PREFIX . 'test_joueur', array('test_id' => $Test_id, 'joueur_id' => $Joueur_id));
			
			// On boucle sur les resultats
			foreach( $Resultat as $Row ):
				if( !empty($Row['resultat']) ):
					$Row['joueur_id'] = $Joueur_id;
					$Row['test_id'] = $Test_id;
					$this->app->db->insert(PREFIX . 'test_resultat', $Row);
				endif;
			endforeach;
			
			return $this->redirect( getLink('test/detailTest/' . $Test_id), 3, $this->lang['Joueur_ajoute_au_test']);
		endif;
		
		// Recuperation des informations du tests
		$Test = $this->app->db->get_one(PREFIX . 'test', array('id =' => $Test_id));
		
		// Recuperation des joueurs a exclure et construction du in
		$in = '(';
		
		$Joueurs = $this->app->db->get(PREFIX . 'test_joueur', array('test_id =' => $Test_id));
		
		if( count($Joueurs) > 0):

			foreach($Joueurs as $Row):
				$in .= ' '. $Row['joueur_id'] .',';
			endforeach;
			
			$in = substr($in,0,-1);
			$in .= ')';
			
			$Joueurs	=	$this->app->db->select('j.id, j.prenom, j.nom')
							->from(PREFIX . 'joueur j')
							->where_free(' j.id NOT IN '. $in .' AND j.actif = 1')
							->order('j.prenom')
							->get();
		else:
			$Joueurs	=	$this->app->db->select('j.id, j.prenom, j.nom')
							->from(PREFIX . 'joueur j')
							->where_free(' j.actif = 1')
							->order('j.prenom')
							->get();

		endif;
						
		// Recuperation des exerices
		$Exercices	=	$this->app->db->get(PREFIX . 'test_exercices'/*, array('date_add < ' => $Test['date_test'])*/);
		
		// On envoie toute les données recuperer a smarty
		$this->app->smarty->assign(array(
			'Joueurs'		=>	$Joueurs,
			'Exercices'		=>	$Exercices,
			'Test'			=>	$Test
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'add_joueur_in_test.tpl');
	}
	
	public function indexExerciceAction(){
		
		$Exercices = $this->app->db->get(PREFIX . 'test_exercices', null, 'nom');
		
		$this->app->smarty->assign(array(
			'Exercices'		=>	$Exercices,
		));
		
		
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'index_exercice.tpl' );
	}
	
	/**
	*	Gere l ajout des exercices
	*
	*/
	public function addExerciceAction(){
	
		if( $_SESSION['acl']['gest_entrainement'] != 1 ) return $this->redirect( getLink('index/index'),0,'');
		
		if( $this->app->HTTPRequest->postExists( 'exercice' ) ){
			
			$exercice = $this->app->HTTPRequest->postData( 'exercice' );
			$exercice['date_add'] = time();
			
			$this->app->db->insert(PREFIX . 'test_exercices', $exercice);
			
			return $this->redirect( getLink('test/indexExercice') ,3 ,$this->lang['Exercice_ajoute']);
		}
		
		print_form:
		$this->getFormValidatorJs();
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'add_exercice.tpl' );
		
	}
	
	/**
	*	Gere l edition des exercices
	*
	*/
	public function editExerciceAction( $exercice_id ){
		
		if( $_SESSION['acl']['gest_entrainement'] != 1 ) return $this->redirect( getLink('index/index'),0,'');
		
		
		if( $this->app->HTTPRequest->postExists( 'exercice' ) ){
			
			$exercice = $this->app->HTTPRequest->postData( 'exercice' );
			
			$this->app->db->update(PREFIX . 'test_exercices', $exercice, array('id =' => $exercice['id']) );
			
			return $this->redirect( getLink('test/indexExercice') ,3 ,$this->lang['Exercice_modifie']);
		}
		
		print_form:
		
		$this->getFormValidatorJs();
		
		$this->app->smarty->assign(array(
			'Exercice'		=>	$this->app->db->get_one(PREFIX . 'test_exercices', array('id =' => $exercice_id) ),
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'edit_exercice.tpl' );
	}
	
	/**
	*	Gere la suppression d un exercice
	*
	*/
	public function deleteExerciceAction( $exercice_id ){
		if( $_SESSION['acl']['gest_entrainement'] != 1 ) return $this->redirect( getLink('index/index'),0,'');
		
		$this->app->db->delete(PREFIX . 'test_exercices', $exercice_id);
		
		return $this->redirect( getLink('test/indexExercice'), 3, $this->lang['Exercice_supprime']);
	}
	
    /**
    * Gere la suppression des test
    * 
    */
    public function deleteAction($tid){
        if( $_SESSION['acl']['gest_entrainement'] != true) return $this->redirect(getLink('index/index'),0,'');
        
        $this->app->db->delete(PREFIX . 'test', $tid);
        $this->app->db->delete(PREFIX . 'test_resultat',null, array('test_id =' => $tid));
        $this->app->db->delete(PREFIX . 'test_joueur',null, array('test_id =' => $tid));
        
        return $this->redirect( getLink('test/index'), 3, $this->lang['Test_supprime']);
    }

    public function ajaxGetDataGraph(){

    	$joueur_id 		= $this->app->HTTPRequest->getData('joueur');
    	$exercice_id 	= $this->app->HTTPRequest->getData('exercice');

    	$Datas	=	$this->app->db->select('tr.resultat,t.date_test, te.nom')
			    	->from(PREFIX . 'test_resultat tr')
			    	->left_join(PREFIX . 'test t','tr.test_id = t.id')
			    	->left_join(PREFIX . 'test_exercices te','tr.exercice_id = te.id')
			    	->where(array('tr.joueur_id =' => $joueur_id, 'tr.exercice_id =' => $exercice_id))
			    	->order('t.date_test')
			    	->get();

		$Result = array();
		$Date = array();

		foreach ($Datas as $Row) {
			array_push($Result, $Result['resultat']);
			array_push($Data, date('m-Y',$Row['date_test']));
		}

		return  json_encode(array($Result, $Date), JSON_NUMERIC_CHECK);

    }
    
    /**
     * Genere les graphiques affiché dans l'onglet TEST de la fiche joueur
     * 
     */
    public function graphAction(){
    	
    	$joueur_id 		= $this->app->HTTPRequest->getData('joueur');
    	$exercice_id 	= $this->app->HTTPRequest->getData('exercice');
		
		$taille_graph = 800;
		
		if( $this->app->HTTPRequest->getExists('width') ):
			$taille_graph = $this->app->HTTPRequest->getData('width');
		endif;
		
    	
    	$Datas	=	$this->app->db->select('tr.resultat,t.date_test, te.nom')
			    	->from(PREFIX . 'test_resultat tr')
			    	->left_join(PREFIX . 'test t','tr.test_id = t.id')
			    	->left_join(PREFIX . 'test_exercices te','tr.exercice_id = te.id')
			    	->where(array('tr.joueur_id =' => $joueur_id, 'tr.exercice_id =' => $exercice_id))
			    	->order('t.date_test')
			    	->get();
    	
    	// Appel librairie
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pData.class.php';
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pDraw.class.php';
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pImage.class.php';
    	
    	// Gestion des Datas.
    	$MyData = new pData();
    	
    	// 1er Boucle pour recuperer le poids dans un array
    	$data_resultat = array();
    	$data_duree = array();
    	$Name_graph = null;
    	foreach($Datas as $Row){
    	
    		$data_resultat[] = $Row['resultat'];
    		$data_duree[] = date('m-Y',$Row['date_test']);
    		$Name_graph = $Row['nom'];
    	}
    	
    	$MyData->addPoints($data_resultat, "Resultat");
    	$MyData->addPoints($data_duree, "Temps");
    	$MyData->setPalette("Resultat", array("R"=>55,"G"=>91,"B"=>127));
    	$MyData->setAbscissa("Temps");
    	
    	$myPicture = new pImage($taille_graph,230,$MyData);
    	$myPicture->FontName = ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "GeosansLight.ttf";
    	
    	$Settings = array("StartR"=>220,"StartG"=>220,"StartB"=>220,"EndR"=>255,"EndG"=>255,"EndB"=>255,"Alpha"=>100);
    	$myPicture->drawGradientArea(0,0,$taille_graph,230,DIRECTION_VERTICAL,$Settings);
    	
    	$myPicture->drawRectangle(0,0,$taille_graph - 1,229,array("R"=>200,"G"=>200,"B"=>200));
    	
    	$myPicture->setGraphArea(60,60,$taille_graph - 50,190);
    	$myPicture->drawFilledRectangle(60,60,$taille_graph - 50,190,array("R"=>255,"G"=>255,"B"=>255,"Surrounding"=>-200,"Alpha"=>10));
    	$myPicture->drawScale(array("DrawSubTicks"=>TRUE));
    	$myPicture->setShadow(TRUE,array("X"=>1,"Y"=>1,"R"=>0,"G"=>0,"B"=>0,"Alpha"=>10));
    	$myPicture->setFontProperties(array("FontName"=> ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "pf_arma_five.ttf","FontSize"=>8));
    	$myPicture->drawLineChart(array("DisplayValues"=>TRUE,"DisplayColor"=>DISPLAY_AUTO));
    	$myPicture->setShadow(FALSE);
    	
    	/* Write the picture title */
    	$myPicture->setFontProperties(array("FontName"=>ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "Forgotte.ttf","FontSize"=>11));
    	$myPicture->drawText(60,35,$Name_graph,array("FontSize"=>20,"Align"=>TEXT_ALIGN_BOTTOMLEFT));
    	
    	
    	$myPicture->stroke();
    	
    }
	
	public function graphResultTestAction(){
		$Test_id	=	$this->app->HTTPRequest->getData('test');
		
		// Recuperation des exercices
		$Exercices	=	$this->app->db->select('DISTINCT(tr.exercice_id), te.nom')
						->from(PREFIX . 'test_resultat tr')
						->left_join(PREFIX . 'test_exercices te','tr.exercice_id = te.id')
						->where(array('tr.test_id =' => $Test_id))
						->get();
						
		// Recuperation des joueurs
		$Joueurs	=	$this->app->db->select('DISTINCT(tr.joueur_id), j.nom, j.prenom')
						->from(PREFIX . 'test_resultat tr')
						->left_join(PREFIX . 'joueur j','tr.joueur_id = j.id')
						->where(array('tr.test_id =' => $Test_id))
						->get();
						
		/*var_dump($Joueurs);
		var_dump($Exercices);*/
		
		// Appel librairie
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pData.class.php';
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pDraw.class.php';
    	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pImage.class.php';
    	
    	// Gestion des Datas.
    	$MyData = new pData();
		$Name_graph = null;
		$ExoName = array();
		// Recuperation des datas
		foreach( $Joueurs as $Joueur):
			$Result = array();
			
			foreach($Exercices as $Exercice):
			
				$Data = $this->app->db->get_one(PREFIX . 'test_resultat', array('test_id =' => $Test_id, 'joueur_id =' => $Joueur['joueur_id'], 'exercice_id =' => $Exercice['exercice_id']));
				
				if( !empty($Data) ):
					$Result[] = $Data['resultat'];
				else:
					$Result = 0;
				endif;
				
			endforeach;
			
			$MyData->addPoints($Result, $Joueur['prenom'] . ' ' . $Joueur['nom']);
			
		endforeach;
		
		foreach($Exercices as $Exercice):
			$ExoName[] = $Exercice['nom'];
		endforeach;
		
		$MyData->addPoints($ExoName, "Exercices");
		$MyData->setPalette("Resultat", array("R"=>55,"G"=>91,"B"=>127));
    	$MyData->setAbscissa("Exercices");
		
		$myPicture = new pImage(800,230,$MyData);
    	$myPicture->FontName = ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "GeosansLight.ttf";
    	
    	$Settings = array("StartR"=>220,"StartG"=>220,"StartB"=>220,"EndR"=>255,"EndG"=>255,"EndB"=>255,"Alpha"=>100);
    	$myPicture->drawGradientArea(0,0,800,230,DIRECTION_VERTICAL,$Settings);
    	
    	$myPicture->drawRectangle(0,0,799,229,array("R"=>200,"G"=>200,"B"=>200));
    	
    	$myPicture->setGraphArea(60,60,750,190);
    	$myPicture->drawFilledRectangle(60,60,750,190,array("R"=>255,"G"=>255,"B"=>255,"Surrounding"=>-200,"Alpha"=>10));
    	$myPicture->drawScale(array("DrawSubTicks"=>TRUE));
    	$myPicture->setShadow(TRUE,array("X"=>1,"Y"=>1,"R"=>0,"G"=>0,"B"=>0,"Alpha"=>10));
    	$myPicture->setFontProperties(array("FontName"=> ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "pf_arma_five.ttf","FontSize"=>8));
    	$myPicture->drawLineChart(array("DisplayValues"=>TRUE,"DisplayColor"=>DISPLAY_AUTO));
    	$myPicture->setShadow(FALSE);
    	
    	/* Write the picture title */
    	$myPicture->setFontProperties(array("FontName"=>ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "Forgotte.ttf","FontSize"=>11));
    	$myPicture->drawText(60,35,$Name_graph,array("FontSize"=>20,"Align"=>TEXT_ALIGN_BOTTOMLEFT));
    	
    	$myPicture->setFontProperties(array("FontName"=> ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "pf_arma_five.ttf","FontSize"=>6));
		$myPicture->setShadow(TRUE,array("X"=>1,"Y"=>1,"R"=>0,"G"=>0,"B"=>0,"Alpha"=>10));
		$myPicture->drawLegend(70,60);
		
    	$myPicture->stroke();
		
	}
    
	/**
	 * Genere un fichier CVS du test
	 * 
	 */
	public function exportCsvAction($Test_id){
		$param = NULL;
		$CsvFile = '';
		
		$Test = $this->app->db->get_one(PREFIX . 'test', array('id =' => $Test_id) );
		
		if( $this->app->HTTPRequest->getExists('sexe')  ):
			$param = array('t.sexe =' => $this->app->HTTPRequest->getData('sexe'), 'tj.test_id =' => $Test_id );
		else:
			$param = array( 'tj.test_id =' => $Test_id );
		endif;
		
		$Exercices = $this->app->db->get(PREFIX . 'test_exercices', array('date_add <' => time() ));
		//$Joueurs =  $this->app->db->get(PREFIX . 'joueur', $param , 'nom');
		
		$Joueurs = $this->app->db->select('j.id, j.prenom, j.nom')->from(PREFIX . 'test_joueur tj')->left_join(PREFIX . 'joueur j','tj.joueur_id = j.id')->where( $param )->order('j.nom')->get();
		
		
		$string = $this->lang['Joueur'] .';';
		
		foreach($Exercices as $Exercice):
			$string .= $Exercice['nom'] .';';
		endforeach;
		
		// Suppression du dernier ;
		$CsvFile .= substr($string,0,-1);
		
		$CsvFile .= "\n";
		
		foreach($Joueurs as $Joueur):
			$string = $Joueur['nom'] .' ' . $Joueur['prenom'] .';';
			foreach($Exercices as $Exercice):
				$Data = $this->app->db->get_one(PREFIX . 'test_resultat', array('joueur_id =' => $Joueur['id'], 'test_id =' => $Test_id, 'exercice_id =' => $Exercice['id']));
				$string .= $Data['resultat'] .';';
			endforeach;
			$CsvFile .= substr($string,0,-1);
			$CsvFile .= "\n";
		endforeach;
		
		// On affiche le fichier
		header('Content-Type: application/csv-tab-delimited-table');
		header('Content-disposition: filename=result_test_'. $Test_id .'.csv');
		echo $CsvFile;
		exit;
	}
	
	public function getAllResultByExoAndJoueurAction(){
		
		$this->load_manager('exercice');
		$this->load_manager('joueur');
		
		$Exercice_id 	=	$this->app->HTTPRequest->getData('exercice_id');
		$Joueur_id 		=	$this->app->HTTPRequest->getData('joueur_id');
		
		$Exercice = $this->manager->exercice->getById($Exercice_id);
		$Joueur = $this->manager->joueur->getById($Joueur_id);
		
		$Resultats	=	$this->app->db->select('tr.resultat, t.date_test')
						->from(PREFIX . 'test_resultat tr')
						->left_join(PREFIX . 'test t','tr.test_id = t.id')
						->where(array('exercice_id =' => $Exercice_id, 'joueur_id =' => $Joueur_id))
						->order('t.date_test DESC')
						->get();
			
		$this->app->smarty->assign(array(
			'Exercice'		=>	$Exercice,
			'Joueur'		=>	$Joueur,
			'Resultats'		=>	$Resultats,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'test' . DS . 'get_all_result_by_exo_and_joueur.tpl');
	}

	/**
	 * Recupere les resultat d un test en fonction de l id d'un exercice et id de joueur
	 * @return json array encodé en JSON
	 */
	public function ajaxGetExerciceDataAction(){

		// Recuperation des donnes Get
		$eid = $this->registry->HTTPRequest->getData('eid');
		$jid = $this->registry->HTTPRequest->getData('jid');

		// Recuperation des données
		$Datas	=	$this->app->db->select('tr.resultat,t.date_test, te.nom')
			    	->from(PREFIX . 'test_resultat tr')
			    	->left_join(PREFIX . 'test t','tr.test_id = t.id')
			    	->left_join(PREFIX . 'test_exercices te','tr.exercice_id = te.id')
			    	->where(array('tr.joueur_id =' => $jid, 'tr.exercice_id =' => $eid))
			    	->order('t.date_test')
			    	->get();

		$result = array();
		$date = array();

		foreach($Datas as $row){
			array_push($result, $row['resultat']);
			array_push($date, date('m-Y',$row['date_test']));
		}

		return json_encode(array($result, $date), JSON_NUMERIC_CHECK);
	}

}