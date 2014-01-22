<?php

class gcalendarController extends Controller{
	
	public $client;
	
	public function __construct($app){
		parent::__construct($app);
		
		set_include_path(ROOT_PATH . 'kernel' . DS . 'lib' . DS);
		
		require_once ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'Zend' . DS . 'Loader.php';
		
		Zend_Loader::loadClass('Zend_Gdata');
		Zend_Loader::loadClass('Zend_Gdata_AuthSub');
		Zend_Loader::loadClass('Zend_Gdata_ClientLogin');
		Zend_Loader::loadClass('Zend_Gdata_Calendar');
		 
		$user = $_SESSION['utilisateur']['gmail_adr'];
		$pass = $_SESSION['utilisateur']['gmail_password'];
		$service = Zend_Gdata_Calendar::AUTH_SERVICE_NAME;
		 
		try
		{
			$this->client = Zend_Gdata_ClientLogin::getHttpClient($user,$pass,$service);			
		}
		catch(Exception $e)
		{
			// prevent Google username and password from being displayed
			// if a problem occurs
			//echo "$e Could not connect to calendar.";
            echo "Erreur during connect to calendar !";
			die();
		}
	}
	
	public function indexAction(){
		return $this->app->smarty->fetch( VIEW_PATH . 'gcalendar' . DS . 'index.tpl');
	}
	
	public function addAction(){
		$Event = $this->app->HTTPRequest->postData('event');
		
		// Reprise du code sur http://maestric.com/doc/php/gogole_calendar_api
		
		// parameters
		$title = $Event['title'];
		$where = "";
		$description = $Event['description'];
		 
		$Tmp = explode('/', $Event['date_start']);		 
		$start_date =  $Tmp[2].'-'.$Tmp[1].'-'.$Tmp[0].' '.$Event['heure_start'].':00'; // "2010-07-14 07:00:00";
		
		$Tmp = explode('/', $Event['date_end']);
		$end_date = $Tmp[2].'-'.$Tmp[1].'-'.$Tmp[0].' '.$Event['heure_end'].':00';
		
		//$end_date = "2010-07-14 07:00:00";
		 
		$calendar_user = $_SESSION['utilisateur']['gmail_adr'];
		$tzOffset = '+00'; // timezone offset
		 
		// build event
		$start_date = str_replace(' ', 'T', $start_date);
		$end_date = str_replace(' ', 'T', $end_date);
		 
		$gdataCal = new Zend_Gdata_Calendar($this->client);
		$newEvent = $gdataCal->newEventEntry();
		 
		$newEvent->title = $gdataCal->newTitle($title);
		$newEvent->where = array($gdataCal->newWhere($where));
		$newEvent->content = $gdataCal->newContent($description);
		 
		$when = $gdataCal->newWhen();
		$when->startTime = "{$start_date}.000{$tzOffset}:00";
		$when->endTime = "{$end_date}.000{$tzOffset}:00";
		$newEvent->when = array($when);
		 
		// insert event
		$createdEvent = $gdataCal->insertEvent($newEvent, "http://www.google.com/calendar/feeds/$calendar_user/private/full");
		 
		// event id
		$event_id = $createdEvent->id->text;
		
		return $this->redirect( getLink("gcalendar"),3, $this->lang['Evenement_ajoute']);
		//echo $event_id;
	}
	
	public function widgetgcalendarAction(){
		
		// parameters
		$calendar_user = $_SESSION['utilisateur']['gmail_adr'];
		$calendar_visibility = $_SESSION['utilisateur']['gmail_id_prv'];
		 
		$start_date = date('Y').'-'. date('m') . '-' . date('d'); //'2010-06-01';
		$end_date = date('Y').'-'. date('m') . '-' . (date('d') + 7);
		 
		// build query
		$gdataCal = new Zend_Gdata_Calendar($this->client);
		 
		$query = $gdataCal->newEventQuery();
		 
		$query->setUser($calendar_user);
		$query->setVisibility($calendar_visibility);			
		 
		$query->setSingleEvents(true);
		$query->setProjection('full');
		$query->setOrderby('starttime');
		$query->setSortOrder('ascending');
		$query->setMaxResults(100);
		 
		 
		$query->setStartMin($start_date);
		$query->setStartMax($end_date);
		 
		// execute and get results
		$event_list = $gdataCal->getCalendarEventFeed($query);
		
		$this->app->smarty->assign(array(
			'Events'		=>	$event_list,
		));
		
		return $this->app->smarty->fetch( VIEW_PATH . 'gcalendar' . DS . 'widget.tpl');
		
		var_dump($event_list);
		
	}
	
	public function showEventAction( $event_id ){
		$event_id = base64_decode($event_id);
		// get event
		$gdataCal = new Zend_Gdata_Calendar($this->client);
		$event = $gdataCal->getCalendarEventEntry($event_id);
		
		$this->app->smarty->assign(array(
			'event'		=>	$event,
		));
		
		return $this->app->smarty->fetch(VIEW_PATH . 'gcalendar' . DS . 'show_event.tpl');
	}
}


// FONCTION GENERIQUE SPECIFIQUE
function date_google_to_sql($str)
{
	$t = explode('T', $str);
    
	$date = $t[0];
    
    if( isset($t[1]) ):
	    $time = $t[1];
	    $time = substr($time, 0, 8);
    else:
        $time = '';
    endif;
 
	$str = $date . ' ' . $time;
	return $str;
}