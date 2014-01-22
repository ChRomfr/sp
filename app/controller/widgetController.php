<?php
  class widgetController extends Controller{
      
      public function getWidgetBlessureAction(){
          $this->load_manager('SuiviMedical');
          
          $this->app->smarty->assign(array(
            'Blessures'         =>  $this->manager->SuiviMedical->getByDate(time()),
          ));
          
          return $this->app->smarty->fetch(VIEW_PATH . 'widget' . DS . 'blessure.tpl');
      }
      
	  /**
	  *	Recupere les FLUX RSS pour affichage en page d'accueil ou autre appel
	  *
	  */
      public function getWidgetRSSAction(){
      	require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'FeedReader.php';
      	          
          if( $this->app->HTTPRequest->getData('flux') == 'flux_1')
            $url = $_SESSION['utilisateur']['flux_rss_1'];
          
          if( $this->app->HTTPRequest->getData('flux') == 'flux_2')
            $url = $_SESSION['utilisateur']['flux_rss_2'];      
        
        	$Flux = new Feed ($url);    
        	$html = '';
        	
        	foreach( $Flux->find(10) as $item ){
        		$html .= '<span><i class="fa fa-rss"></i>&nbsp;<a href="'. $item->url .'" title="" target="_blank"><small>'. $item->title .'</small></a></span><br/>';
        	}        	
        	
        	return $html;        	
      }
      
	  /**
	  *	Affiche les actualités saisie dans l administration
	  *
	  */
      public function getWidgetActualiteAction(){
      	$this->load_manager('actualite');
      	
      	$this->registry->smarty->assign('Actus',$this->manager->actualite->getForWidget());
      	
      	return $this->registry->smarty->fetch(VIEW_PATH . 'widget' . DS . 'actualite.tpl');
      }
	
	/**
	*	Affiche le detail d'une actu en passant son ID
	*	@param int $actu_id
	*	@return text HTML CODE
	*/
	public function getWidgetActualiteDetailAction($actu_id){
		$this->load_manager('actualite');
	 
		$this->registry->smarty->assign('Actu',$this->manager->actualite->getById($actu_id));
	 
		return $this->registry->smarty->fetch(VIEW_PATH . 'widget' . DS . 'actualite_detail.tpl');
	}
}
?>
