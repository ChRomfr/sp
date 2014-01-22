<?php

class programmationController extends Controller{
		
	
	public function indexAction(){
		
		$date = array();
		
		if( $this->app->HTTPRequest->getExists('year') ):
			$date['year'] = $this->app->HTTPRequest->getData('year');
		else:
			$date['year'] = date("Y");
		endif;
		
		if( $this->app->HTTPRequest->getExists('month') ):
			$date['month'] = $this->app->HTTPRequest->getData('month');
		else:
			$date['month'] = date("m");
		endif;
		
		if( strlen($date['month']) == 1 && $date['month']  < 10 ):
			$date['month']  = '0' . $date['month'];
		endif;
		
		$date['month_txt'] = $this->lang['m'. $date['month'] .''];
		
		// Construction lien precedant
		if( $date['month'] == 1 ):
			$previous = '?month=12&year='. ($date['year'] - 1);
		else:
			$previous = '?month='. ($date['month'] - 1) .'&year='. $date['year'] ;
		endif;
		
		// Construction lien suivant
		if( $date['month'] == 12 ):
			$next = '?month=1&year='. ($date['year'] + 1);
		else:
			$next = '?month='. ($date['month'] + 1) .'&year='. $date['year'] ;
		endif;
		
		$this->load_manager('equipe');
		
		$this->app->smarty->assign(array(
			'Date'		=>	$date,
			'Calendar'	=>	$this->getCalendar($date),
			'Next'		=>	$next,
			'Previous'	=>	$previous,
			'Equipes'	=>	$this->manager->equipe->getAll(),
		));
		
		$this->getFormValidatorJs();
		
		return $this->registry->smarty->fetch(VIEW_PATH . 'programmation' . DS . 'index.tpl');
	}
	
	/**
	 * Affiche le formulaire pour ajouter une programmation dans
	 * le calendrier
	 * @return string
	 */
	public function ajaxFormAddProgAction(){
		
		$this->load_manager('equipe');
		
		$this->app->smarty->assign(array(
			'Types'		=>	$this->app->db->get(PREFIX . 'programmation_type', null, 'nom'),
			'Equipes'	=>	$this->manager->equipe->getAll(),
		));
		return $this->app->smarty->fetch(VIEW_PATH . 'programmation' . DS . 'ajax_form_add.tpl');
	}
	
	/**
	 * Ajoute la programmation dans la base de donnees en 
	 * formatant les donnees
	 * @return string
	 */
	public function addAction(){
	
		if( $this->app->HTTPRequest->postExists('prog') ):
		
			$Data = $this->app->HTTPRequest->postData('prog');
            // Formatage de la date
			$Date = explode('/', $Data['date_prog']);
			
			$Data['date_prog'] = $Date[2] .'-'. $Date[1] .'-'. $Date[0];
			
            if( $Data['moment_jour'] == 99):
            
                // Matin
				$Matin = $Data;
				$Matin['moment_jour'] = 2;
				$Matin['journee_entiere'] = 1;
				$this->app->db->insert(PREFIX . 'programmation', $Matin);
				
				//Apres midi
				$Aprem = $Data;
				$Aprem['moment_jour'] = 3;
				$Aprem['journee_entiere'] = 1;
				$this->app->db->insert(PREFIX . 'programmation', $Aprem);
				
            else:			
		        $this->app->db->insert(PREFIX . 'programmation', $Data);
            endif;
			
			$url_redirect = getLink('programmation?year='. $Date[2] . '&month='. $Date[1]);
			
			if( !empty($Data['equipe_id'])):
				$url_redirect .= '&equipe=' . $Data['equipe_id'];
			endif;
			
			return $this->redirect( $url_redirect ,3,$this->lang['Programmation_ajoutee'] );
			
		endif;
	}
	
	public function editAction( $pid ){
		if( $_SESSION['acl']['gest_programmation'] == 0 ) exit;
		
		if( $this->app->HTTPRequest->postExists('prog') ):
		
			$Data = $this->app->HTTPRequest->postData('prog');
			
			// Formatage de la date
			$Date = explode('/', $Data['date_prog']);
			
			$Data['date_prog'] = $Date[2] .'-'. $Date[1] .'-'. $Date[0];

			$this->app->db->update(PREFIX . 'programmation', $Data);
			
			$url_redirect = getLink('programmation?year='. $Date[2] . '&month='. $Date[1]);
			
			if( !empty($Data['equipe_id']) ):
				$url_redirect .= '&equipe=' . $Data['equipe_id'];
			endif;
			
			return $this->redirect( $url_redirect ,3,$this->lang['Programmation_modifiee'] );
			
		endif;
		
		$Prog = $this->app->db->get_one(PREFIX . 'programmation', array('id =' => $pid));
		$Tmp = explode('-', $Prog['date_prog']);
		$Prog['date_prog'] = $Tmp[2] .'/'. $Tmp[1] .'/'. $Tmp[0];
		$this->load_manager('equipe');
		
		$this->app->smarty->assign(array(
			'Types'		=>	$this->app->db->get(PREFIX . 'programmation_type', null, 'nom'),
			'Prog'		=>	$Prog,
			'Equipes'	=>	$this->manager->equipe->getAll(),
		));
		
		return $this->registry->smarty->fetch(VIEW_PATH . 'programmation' . DS . 'ajax_form_edit.tpl');
	}
	
	/**
	 * Traite la suppression
	 * @param int $pid ID de la programmation dans la base
	 * @return mixed CODE HTML
	 */
	public function deleteAction($pid){
		if( $_SESSION['acl']['gest_programmation'] == 0 ) exit;
		
		$Data = $this->app->db->get_one(PREFIX . 'programmation', array('id =' => $pid));
		$this->app->db->delete(PREFIX . 'programmation', $pid);
		$Date = explode('-', $Data['date_prog']);
		
		return $this->redirect( getLink('programmation?year='. $Date[0] . '&month='. $Date[1]),3,$this->lang['Programmation_supprimee'] );
	}
	
	public function ajaxDetailProgAction($id){
		
		$Prog	=	$this->app->db->select('pt.nom, pt.couleur, p.date_prog, p.moment_jour, p.id, p.description')
					->from(PREFIX . 'programmation p')
					->left_join(PREFIX . 'programmation_type pt','p.type = pt.id')
					->where(array('p.id =' => $id))
					->get_one(); 
		
		$this->app->smarty->assign(array(
			'Prog'		=>	$Prog,
		));
		
		return $this->registry->smarty->fetch(VIEW_PATH . 'programmation' . DS . 'ajax_detail.tpl');
		
	}
	
	private function getCalendar($date){
		
		if( $this->app->HTTPRequest->getExists('equipe') ):
			$Datas	=	$this->app->db->select('pt.nom, pt.couleur, p.date_prog, p.moment_jour, p.id, p.description')
							->from(PREFIX . 'programmation p')
							->left_join(PREFIX . 'programmation_type pt','p.type = pt.id')
							->where_free('p.equipe_id = '. $this->app->HTTPRequest->getData('equipe') .' AND p.date_prog LIKE "'. $date['year'] .'-'. $date['month'] .'-%"')
							->order('p.date_prog')
							->get();
		else:
			$Datas	=	$this->app->db->select('pt.nom, pt.couleur, p.date_prog, p.moment_jour, p.id, p.description')
						->from(PREFIX . 'programmation p')
						->left_join(PREFIX . 'programmation_type pt','p.type = pt.id')
						->where_free('(p.equipe_id IS NULL OR p.equipe_id = 0) AND p.date_prog LIKE "'. $date['year'] .'-'. $date['month'] .'-%"')
						->order('p.date_prog')
						->get();
		endif;		
							
		// Mise en forme des datas	
		$Programmation = array();
		
		foreach($Datas as $Row):
			$Programmation[''. $Row['date_prog'] .'-'. $Row['moment_jour']  .''] = $Row;
		endforeach;
		
		$TimestampMonth = mktime(0,0,0,$date['month'],1,$date['year']);
		$NbDaysInMonth = date("t", $TimestampMonth);
		$NumberFirstDay = date("N",$TimestampMonth);
		
		
		$Calendar = '<table class="calendrier">';
			$Calendar .= '<tr>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Lundi'] .'</td>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Mardi'] .'</td>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Mercredi'] .'</td>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Jeudi'] .'</td>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Vendredi'] .'</td>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Samedi'] .'</td>';
				$Calendar .= '<td class="calendrier_jour">'. $this->lang['Dimanche'] .'</td>';
			$Calendar .= '</tr>';
			
		for($i = 1; $i <= $NbDaysInMonth; $i++){
		      if( $i < 10)
                    $i = '0'.$i;
			// Traitement 1er ligne
			if( $i == 1 ){
				$Calendar .= '<tr>';
				$Calendar .= str_repeat('<td></td>',( $NumberFirstDay - 7)+6 );
                
                
				
				$Calendar .= '<td class="calendrier_cellule">
					<div class="calendrier_day_number">'. $i . '</div>';
					
					if( isset($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']) ):
						$Calendar .= '<div class="calendrier_programmation_matin" onclick="getDetail('.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']['id'].')"; style="background-color:'.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']['couleur'].'; cursor:pointer">&nbsp;'. substr($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']['description'],0,20) .'</div>';
					else:
						$Calendar .= '<div class="calendrier_programmation_matin" onclick=\'getFormAdd("'. $i.'/'.$date['month'].'/'.$date['year'].'","2")\'></div>';
					endif;
					
					if( isset($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']) ):
						$Calendar .= '<div class="calendrier_programmation_aprem" onclick="getDetail('.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']['id'].')"; style="background-color:'.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']['couleur'].'; cursor:pointer">&nbsp;'. substr($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']['description'],0,20) .'</div>';
					else:
						$Calendar .= '<div class="calendrier_programmation_aprem" onclick=\'getFormAdd("'. $i.'/'.$date['month'].'/'.$date['year'].'","3")\'></div>';
					endif;
					
					
				$Calendar .= '</td>';
				
				
			}else{
				$Calendar .= '<td class="calendrier_cellule">
					<div class="calendrier_day_number">'. $i . '</div>';
					
					if( isset($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']) ):
						$Calendar .= '<div class="calendrier_programmation_matin" onclick="getDetail('.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']['id'].')"; style="background-color:'.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']['couleur'].'; cursor:pointer">&nbsp;'. substr($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-2']['description'],0,20) .'</div>';
					else:
						$Calendar .= '<div class="calendrier_programmation_matin" onclick=\'getFormAdd("'. $i.'/'.$date['month'].'/'.$date['year'].'","2")\'></div>';
					endif;
					
					if( isset($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']) ):
						$Calendar .= '<div class="calendrier_programmation_aprem" onclick="getDetail('.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']['id'].')"; style="background-color:'.$Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']['couleur'].'; cursor:pointer">&nbsp;'. substr($Programmation[''. $date['year'].'-'.$date['month'].'-'.$i.'-3']['description'],0,20) .'</div>';
					else:
						$Calendar .= '<div class="calendrier_programmation_aprem" onclick=\'getFormAdd("'. $i.'/'.$date['month'].'/'.$date['year'].'","3")\'></div>';
					endif;
					
					
				$Calendar .= '</td>';
			}
			
			if( date("N", mktime(0,0,0,$date['month'],$i,$date['year'])) % 7 == 0){
				$Calendar .= '</tr><tr>';
			}
		}
		
		$Calendar .= '</tr></table>';
		
		return $Calendar;
	}
	
}