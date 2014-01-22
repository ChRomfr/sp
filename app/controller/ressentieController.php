<?php

class ressentieController extends Controller{
  
  
    const ECHELLE = 10;
    
    public function indexAction(){
        
        if( $this->app->HTTPRequest->getExists('semaine') &&  $this->app->HTTPRequest->getExists('year')):
            $semaine    = $this->app->HTTPRequest->getData('semaine');
            $year       = $this->app->HTTPRequest->getData('year');
        else:
            $semaine    = date("W");
            $year       = date("Y");
        endif;
        
        $Sportifs   =   $this->app->db->select('DISTINCT(s.sportif_id), j.nom, j.prenom, j.id')
                        ->from(PREFIX . 'sequence s')
                        ->left_join(PREFIX . 'joueur j','s.sportif_id = j.id')
                        ->where(array('semaine =' => $semaine, 'annee =' => $year))
                        ->get();
    
        $MaxSequence = 0;
        $i=0;
        
        foreach( $Sportifs as $Row ):
        
            $Sequences  =   $this->app->db->select('s.id, sne.note')
                            ->from(PREFIX . 'sequence s')
                            ->left_join(PREFIX . 'sequence_note_entraineur sne','s.id = sne.sequence_id')
                            ->where(array('semaine =' => $semaine, 'annee =' => $year, 'sportif_id =' => $Row['id']))
                            ->order('s.numero ASC')
                            ->get();
                            
            if( count($Sequences) > $MaxSequence):
                $MaxSequence = count($Sequences);
            endif;
            
            $Sportifs[$i]['sequences'] = $Sequences;
            
            $i++;
        endforeach;
        
        $Lundi = new DateTime();
        $Dimanche = new DateTime();
        $Lundi->setISODate($year, $semaine);
        $Dimanche->setISODate($year, $semaine,7);
        
        if( $semaine == 1 ):
            $Previous = array(
                'Year'      =>  ($year - 1),
                'Semaine'   =>  52,
            );
		else:
            $Previous = array(
                'Year'      =>  $year,
                'Semaine'   =>  $semaine - 1,
            );
		endif;
		
		if( $semaine == 52 ):
            $Next = array(
                'Year'      =>  ($year + 1),
                'Semaine'   =>  1,
            );
		else:
            $Next = array(
                'Year'      =>  $year,
                'Semaine'   =>  ($semaine + 1),
            );
		endif;
        
        
        $this->app->smarty->assign(array(
            'semaine'       =>  $semaine,
            'year'          =>  $year,
            'Sportifs'      =>  $Sportifs,
            'MaxSequence'   =>  $MaxSequence,
            'Lundi'         =>  $Lundi->format('d M Y'),
            'Dimanche'      =>  $Dimanche->format('d M Y'),
            'Previous'      =>  $Previous,
            'Next'          =>  $Next,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'ressentie' . DS . 'index.tpl');
        
    }
    
    public function addAction(){
        
        if( $this->app->HTTPRequest->postExists('notes') ):
            $Notes = $this->app->HTTPRequest->postData('notes');
            
            // On parcours les notes
            foreach( $Notes as $Note):
                // On parcours les sequences
                foreach($Note['sequence'] as $Sequence):
                    
                    if( !empty($Sequence['note']) &&  $Sequence['note'] != ''):
                        $Sequence['user_id'] = $_SESSION['utilisateur']['id'];
                        $this->app->db->insert(PREFIX . 'sequence_note_entraineur', $Sequence);
                    endif;
                    
                endforeach;
            endforeach;
            
            return $this->redirect( getLink("ressentie"), 3, $this->lang['Notes_ajoutees']);
            
        endif;
        
        printform:
        
        if( $this->app->HTTPRequest->getExists('semaine') &&  $this->app->HTTPRequest->getExists('year')):
            $semaine    = $this->app->HTTPRequest->getData('semaine');
            $year       = $this->app->HTTPRequest->getData('year');
        else:
            $semaine    = date("W");
            $year       = date("Y");
        endif;
        
        $Sportifs   =   $this->app->db->select('DISTINCT(s.sportif_id), j.nom, j.prenom, j.id')
                        ->from(PREFIX . 'sequence s')
                        ->left_join(PREFIX . 'joueur j','s.sportif_id = j.id')
                        ->where(array('semaine =' => $semaine, 'annee =' => $year))
                        ->get();
    
        $MaxSequence = 0;
        $i=0;
        
        foreach( $Sportifs as $Row ):
        
            $Sequences  =   $this->app->db->select('s.id, sne.note')
                            ->from(PREFIX . 'sequence s')
                            ->left_join(PREFIX . 'sequence_note_entraineur sne','s.id = sne.sequence_id')
                            ->where(array('semaine =' => $semaine, 'annee =' => $year, 'sportif_id =' => $Row['id']))
                            ->order('s.numero ASC')
                            ->get();
                            
            if( count($Sequences) > $MaxSequence):
                $MaxSequence = count($Sequences);
            endif;
            
            $Sportifs[$i]['sequences'] = $Sequences;
            
            $i++;
        endforeach;
        
        $Lundi = new DateTime();
        $Dimanche = new DateTime();
        $Lundi->setISODate($year, $semaine);
        $Dimanche->setISODate($year, $semaine,7);
        
        $this->app->smarty->assign(array(
            'semaine'       =>  $semaine,
            'year'          =>  $year,
            'Sportifs'      =>  $Sportifs,
            'MaxSequence'   =>  $MaxSequence,
            'Lundi'         =>  $Lundi->format('d M Y'),
            'Dimanche'      =>  $Dimanche->format('d M Y'),
            'ECHELLE'       =>  self::ECHELLE,
        ));
        
        return $this->app->smarty->fetch(VIEW_PATH . 'ressentie' . DS . 'add.tpl');
    }
    
	public function ajaxGetGraphAction(){
		$sportif_id		=	$this->app->HTTPRequest->getData('sportif');
		$semaine		=	$this->app->HTTPRequest->getData('semaine'); 
		$year			=	$this->app->HTTPRequest->getData('year');
		
		$this->app->smarty->assign(array(
			'Joueur_id'		=>	$sportif_id,
			'Semaine'		=>	$semaine,
			'Year'			=>	$year,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'ressentie' . DS . 'ajax_get_graph.tpl');
	}
	
	public function getGraphiqueAction(){
	
		$sportif_id		=	$this->app->HTTPRequest->getData('sportif');
		$semaine		=	$this->app->HTTPRequest->getData('semaine'); 
		$year			=	$this->app->HTTPRequest->getData('year');
		$type			=	$this->app->HTTPRequest->getData('type');
		
		$Cumul = 0;
		$Totam = 0;
		$Qte = 0;
		$TitreGraph = "";
		
		// Recuperation des sequences de la semaine
		$Sequences	=	$this->app->db->select('s.*, sne.note as ressentie_entraineur')
						->from(PREFIX . 'sequence s')
						->left_join(PREFIX . 'sequence_note_entraineur sne','s.id = sne.sequence_id')
						->where(array('sportif_id =' => $sportif_id, 'annee =' => $year, 'semaine =' => $semaine))
						->order('s.numero')
						->get();
						
		if( $type == 'fatigue' ):
			foreach($Sequences as $Row):
				if( !empty($Row['fatigue']) ):
					$Cumul = $Cumul + $Row['fatigue'];
					$Qte++;
				endif;
				$TitreGraph = "Fatigue";
			endforeach;
		elseif( $type == 'entrainement' ):
			foreach($Sequences as $Row):
				if( !empty($Row['ressentie_entrainement']) ):
					$Cumul = $Cumul + $Row['ressentie_entrainement'];
					$Qte++;
				endif;
				$TitreGraph = "Entrainement";
			endforeach;
		elseif( $type == 'entraineur' ):
			foreach($Sequences as $Row):
				if( !empty($Row['ressentie_entraineur']) ):
					$Cumul = $Cumul + $Row['ressentie_entraineur'];
					$Qte++;
				endif;
			endforeach;
			$TitreGraph = "Entraineur";
		endif;
		
		// Generation du graph
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pData.class.php';
        require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pDraw.class.php';
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pPie.class.php';
        require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pImage.class.php';
		//echo $type;
		//var_dump($Sequences);
		$MyData = new pData();   
		$MyData->addPoints(array($Cumul, (($Qte*self::ECHELLE)-$Cumul) ),"ScoreA");  
		$MyData->setSerieDescription("ScoreA","Application A");
		
		$MyData->addPoints(array("Positif","Negatif"),"Labels");
		$MyData->setAbscissa("Labels");
		
		/* Create the pChart object */
		$myPicture = new pImage(300,150,$MyData);
		
		
		 
		/* Draw a gradient background */
		$myPicture->drawGradientArea(0,0,300,300,DIRECTION_HORIZONTAL,array("StartR"=>220,"StartG"=>220,"StartB"=>220,"EndR"=>180,"EndG"=>180,"EndB"=>180,"Alpha"=>100));
		 
		/* Add a border to the picture */
		$myPicture->drawRectangle(0,0,299,149,array("R"=>0,"G"=>0,"B"=>0));
		 
		/* Create the pPie object */
		$PieChart = new pPie($myPicture,$MyData);
		
		$PieChart->setSliceColor(0,array("R"=>143,"G"=>197,"B"=>0));
		$PieChart->setSliceColor(1,array("R"=>97,"G"=>177,"B"=>63));
		$PieChart->setSliceColor(2,array("R"=>97,"G"=>113,"B"=>63));
		 
		/* Enable shadow computing */
		$myPicture->setShadow(FALSE);
		 
		/* Set the default font properties */
		$myPicture->setFontProperties(array("FontName"=> ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "pf_arma_five.ttf","FontSize"=>10,"R"=>80,"G"=>80,"B"=>80));
		 
		/* Draw a splitted pie chart */
		$PieChart->draw3DPie(150,100,array("WriteValues" => TRUE, "Radius"=>80,"DrawLabels"=>TRUE,"DataGapAngle"=>10,"DataGapRadius"=>6,"Border"=>TRUE));
		
		$myPicture->stroke();
	}
	
	public function graphAnnuelAction(){		
		
		$Cumul = 0;
		$Totam = 0;
		$Qte = 0;
		$TitreGraph = "";
		$Sportif_id = $this->app->HTTPRequest->getData('sportif');
		$type = $this->app->HTTPRequest->getData('type');
	
		if( $this->app->HTTPRequest->getExists('year') ):
			$Year = $this->app->HTTPRequest->getData('year');
			$d_start = $Year .'-09-01';
			$d_end = ($Year+1) . '-06-30';
		else:
			$Year = date("Y");
			if( date("m") < 9 ):
				$d_start = ($Year-1) .'-09-01';
				$d_end = $Year. '-06-30';
			else:				
				$d_start = $Year .'-09-01';
				$d_end = ($Year+1) . '-06-30';
			endif;
		endif;		
		
		// Recuperation des sequences de la semaine
		$Sequences	=	$this->app->db->select('s.*, sne.note as ressentie_entraineur')
						->from(PREFIX . 'sequence s')
						->left_join(PREFIX . 'sequence_note_entraineur sne','s.id = sne.sequence_id')
						->where(array('sportif_id =' => $Sportif_id, 'date_s >=' => $d_start, 'date_s <=' => $d_end))
						->order('s.numero')
						->get();
						
		if( $type == 'fatigue' ):
			foreach($Sequences as $Row):
				if( !empty($Row['fatigue']) ):
					$Cumul = $Cumul + $Row['fatigue'];
					$Qte++;
				endif;
				$TitreGraph = "Fatigue";
			endforeach;
		elseif( $type == 'entrainement' ):
			foreach($Sequences as $Row):
				if( !empty($Row['ressentie_entrainement']) ):
					$Cumul = $Cumul + $Row['ressentie_entrainement'];
					$Qte++;
				endif;
				$TitreGraph = "Entrainement";
			endforeach;
		elseif( $type == 'entraineur' ):
			foreach($Sequences as $Row):
				if( !empty($Row['ressentie_entraineur']) ):
					$Cumul = $Cumul + $Row['ressentie_entraineur'];
					$Qte++;
				endif;
			endforeach;
			$TitreGraph = "Entraineur";
		endif;
		
		// Generation du graph
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pData.class.php';
        require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pDraw.class.php';
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pPie.class.php';
        require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . 'class' . DS . 'pImage.class.php';
		
		$MyData = new pData();   
		$MyData->addPoints(array($Cumul, (($Qte*self::ECHELLE)-$Cumul) ),"ScoreA");  
		$MyData->setSerieDescription("ScoreA","Application A");
		
		$MyData->addPoints(array("Positif","Negatif"),"Labels");
		$MyData->setAbscissa("Labels");
		
		/* Create the pChart object */
		$myPicture = new pImage(300,150,$MyData);		
		 
		/* Draw a gradient background */
		$myPicture->drawGradientArea(0,0,300,300,DIRECTION_HORIZONTAL,array("StartR"=>220,"StartG"=>220,"StartB"=>220,"EndR"=>180,"EndG"=>180,"EndB"=>180,"Alpha"=>100));
		 
		/* Add a border to the picture */
		$myPicture->drawRectangle(0,0,299,149,array("R"=>0,"G"=>0,"B"=>0));
		 
		/* Create the pPie object */
		$PieChart = new pPie($myPicture,$MyData);
		
		$PieChart->setSliceColor(0,array("R"=>143,"G"=>197,"B"=>0));
		$PieChart->setSliceColor(1,array("R"=>97,"G"=>177,"B"=>63));
		$PieChart->setSliceColor(2,array("R"=>97,"G"=>113,"B"=>63));
		 
		/* Enable shadow computing */
		$myPicture->setShadow(FALSE);
		 
		/* Set the default font properties */
		$myPicture->setFontProperties(array("FontName"=> ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'pChart' . DS . "fonts" . DS . "pf_arma_five.ttf","FontSize"=>10,"R"=>80,"G"=>80,"B"=>80));
		 
		/* Draw a splitted pie chart */
		$PieChart->draw3DPie(150,100,array("WriteValues" => TRUE, "Radius"=>80,"DrawLabels"=>TRUE,"DataGapAngle"=>10,"DataGapRadius"=>6,"Border"=>TRUE));
		
		$myPicture->stroke();
	}
    
    /**
     * Code affichage ressenti du joueur dans sa fiche
     *
     */
    public function tabFicheAction( $Joueur_id ){
      // Recuperation du numero de semaine en cours
		$SemaineNumber = date("W");
		
		// Recuperation annee en cours
		$Year = date("Y");
		
		if( date('m') < 9 ):
			$YearForGraphAnnuel = $Year - 1;
		else:
			$YearForGraphAnnuel = $Year;
		endif;
		
		// Recuperation des sequences de la semaine
		$Sequences	=	$this->app->db->select('s.*, sne.note as ressentie_entraineur')
						->from(PREFIX . 'sequence s')
						->left_join(PREFIX . 'sequence_note_entraineur sne','s.id = sne.sequence_id')
						->where(array('sportif_id =' => $Joueur_id, 'annee =' => $Year, 'semaine =' => $SemaineNumber))
						->order('s.numero')
						->get();
					
		// Generation des liens previous and next
		if( $SemaineNumber == 1 ):
			$TmpYear = ($Year - 1);
			$Previous = "$Joueur_id,52,$TmpYear";
		else:
			$PreviousSemaine = $SemaineNumber - 1;
			$Previous = "$Joueur_id,$PreviousSemaine,$Year";
		endif;
		
		if( $SemaineNumber == 52 ):
			$TmpYear = ($Year + 1);
			$Next = "$Joueur_id,1,$TmpYear";
		else:
			$PreviousSemaine = $SemaineNumber + 1;
			$Next = "$Joueur_id,$PreviousSemaine,$Year";
		endif;
					
		// Envoie au template
		$this->app->smarty->assign(array(
			'Sequences'				=>	$Sequences,
			'Year'					=>	$Year,
			'Semaine'				=>	$SemaineNumber,
			'Previous'				=>	$Previous,
			'Next'					=>	$Next,
			'Stats'					=>	$this->sequenceGetTotal($Sequences),
			'Joueur_id'				=>	$Joueur_id,
			'YearForGraphAnnuel'	=>	$YearForGraphAnnuel,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'fiche_tab_ressentie.tpl');
    }
	
    /**
     *  Calcul le nombre TOTAL de points pour la sequence
     *
     **/
    private function sequenceGetTotal($Sequences){
		$NbSequences = count($Sequences);
		$Total = $NbSequences * self::ECHELLE;
		$Stats = array('fatigue' => 0, 'ressentie_entrainement' => 0, 'ressentie_entraineur' => 0,'global'	=> $Total);
		foreach($Sequences as $Row):
			$Stats['fatigue'] = $Stats['fatigue'] + $Row['fatigue'];
			$Stats['ressentie_entrainement'] = $Stats['ressentie_entrainement'] + $Row['ressentie_entrainement'];
			$Stats['ressentie_entraineur'] = $Stats['ressentie_entraineur'] + $Row['ressentie_entraineur'];
		endforeach;
		
		return $Stats;
	}
    
    /**
     *  GENERE LE CODE HTML DE LA SEMAINE SUIVANTE OU PRECENDANTE EN FONCTION
     *  DES PARAMETRES PASSER EN URL
     * */
    public function ajaxGetTableauRessentieAction(){
	
		$Joueur_id	=	$this->app->HTTPRequest->getData('joueur');
		$Semaine	=	$this->app->HTTPRequest->getData('semaine');
		$Year		= 	$this->app->HTTPRequest->getData('year');
		
		// Recuperation des sequences de la semaine
		$Sequences	=	$this->app->db->select('s.*, sne.note as ressentie_entraineur')
						->from(PREFIX . 'sequence s')
						->left_join(PREFIX . 'sequence_note_entraineur sne','s.id = sne.sequence_id')
						->where(array('sportif_id =' => $Joueur_id, 'annee =' => $Year, 'semaine =' => $Semaine))
						->order('s.numero')
						->get();
					
		// Generation des liens previous and next
		if( $Semaine == 1 ):
			$TmpYear = ($Year - 1);
			$Previous = "$Joueur_id,52,$TmpYear";
		else:
			$PreviousSemaine = $Semaine - 1;
			$Previous = "$Joueur_id,$PreviousSemaine,$Year";
		endif;
		
		if( $Semaine == 52 ):
			$TmpYear = ($Year + 1);
			$Next = "$Joueur_id,1,$TmpYear";
		else:
			$NextSemaine = $Semaine + 1;
			$Next = "$Joueur_id,$NextSemaine,$Year";
		endif;
					
		// Envoie au template
		$this->app->smarty->assign(array(
			'Sequences'		=>	$Sequences,
			'Year'			=>	$Year,
			'Semaine'		=>	$Semaine,
			'Previous'		=>	$Previous,
			'Next'			=>	$Next,
			'Stats'			=>	$this->sequenceGetTotal($Sequences),
			'Joueur_id'		=>	$Joueur_id
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'ajax_tab_ressentie_contenu.tpl');
	}
    
	/**
	*	Affiche le formulaire pour les notes les sequences directement dans la fiche du joueur
	*
	*/
	public function ajaxGetFormEntraineurInFicheAction($sequence_id){
	
		if( $this->app->HTTPRequest->postExists('note') ):
		
			$note = $this->app->HTTPRequest->postData('note');
			$this->app->db->insert(PREFIX . 'sequence_note_entraineur',$note);
			$Sequence = $this->app->db->get_one(PREFIX . 'sequence', array('id =' => $sequence_id));
			return $this->redirect( getLink("joueur/fiche/". $Sequence['sportif_id']."?tab=ressentie"),3,$this->lang['Ressentie_ajoute']);
			
		endif;
		
		printform:
		
		$this->app->smarty->assign(array(
			'sequence_id'		=>	$sequence_id,
			'ECHELLE'       	=>  self::ECHELLE,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'sequence_form_entraineur.tpl');
	}
	
    /**
	*	Affiche et traite le formulaire d ajout de sequence par les sportifs
	*
	*/
    public function sequenceAddAction(){
      // Verification que l utilisateur est bien un sportif
		if( $_SESSION['utilisateur']['type'] != 'joueur' ) exit;
		
		//
		// Traitement du formulaire
		//
		if( $this->app->HTTPRequest->postExists('sequence') ):
			$Sequence = $this->app->HTTPRequest->postData('sequence');
			
			$Sequence['date_timestamp'] = FormatDateToTimestamp($Sequence['date_s']);
			$Sequence['date_s'] = FormatDateToMySQL($Sequence['date_s']);
			$Sequence['annee'] = date("Y",$Sequence['date_timestamp']);
			
			$this->app->db->insert(PREFIX . 'sequence', $Sequence);
			
			return $this->redirect( getLink("joueur/fiche/". $Sequence['sportif_id']."?tab=ressentie"),3,$this->lang['Sequence_ajoutee']);
		endif;
		
		//
		// Affichage du formulaire
		//
		printform:
		
		$this->app->smarty->assign(array(
			'joueur_id'		=>	$_SESSION['utilisateur']['id_liaison'],
            'ECHELLE'       =>  self::ECHELLE,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'joueur' . DS . 'sequence_add.tpl');
    }
    
    
}