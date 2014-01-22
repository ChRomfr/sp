<?php
/*

                                                                               
                                     _,,                                   ,dW 
                                   ,iSMP                                  JIl; 
                                  sPT1Y'                                 JWS:' 
                                 sIl:l1                                 fWIl?  
                                dIi:Il;                                fW1"    
                               dIi:l:I'                               fWI:     
                              dIli:l:I;                              fWI:      
                            .dIli:I:S:S                     .       fWIl`      
                          ,sWSSIIIiISIIS w,_             .sMW     ,MWIl;       
                     _.,sWWW*"'*" , SWW' MWWMm mu,,._  .iSYISb, ,MM*SI!:       
                 _,s YMMWW'',sd,'MM WMMi "*MW* WWWMWMb MMS WWP`,MW' S1!`       
            _,os,'MMi YW' m,'WW; WWb`SWM Im,,  SIS ISW SISIP*  WSi  II!.       
         .osSMWMW,'WSi ',MMP SSb WSW ISII`SYYi III !Il lIi,ui:,*1:li:l1!       
      ,sSMMWWWSSSS,'SWbdWW*  *YSbiSS:'IlI 7llI il1: l! 'l:+'+l; `''+1i:1i      
   ,sYSMWMWY**"""'` 'WWSSIIiu,'**Y11';IIIb ?!li ?l:i,         `      `'l!:     
  sPITMWMW'`.M.wdWWb,'YIi `YT" ,u!1",ISIWWm,'+?+ `'+Ili                `'l:,   
  YIi1lTYfPSkyLinedI!i`I!" .,:!1"',iSWWMMMMMmm,                                
    "T1l1lI**"'`.2006? ',o?*'``  ```""**YSWMMMWMm,                             
         "*:iil1I!I!"` '                 ``"*YMMWWM,                           
               ii!                             '*YMWM,                         
               I'                                  "YM                         
                                                                               

*/

function MyAutoload($class){

# Definition d un table avec le nom de la class et son chemin
$ClassList = array(
	// Kernel / core
	'EPO'					=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'DB' . DS . 'EPDO.php',
	'EPOStatement'			=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'DB' . DS . 'EPDO.php',
	'Db'					=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'DB' . DS . 'Db.class.php',
	'Controller'			=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Controller.class.php',
	'HTTPRequest'			=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'HTTPRequest.class.php',
	'BaseModel'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Model.class.php',
	'Record'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Record.class.php',
	'myObject'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Record.class.php',
	'Registry'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Registry.class.php',
	'Router'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Router.class.php',
	'Session'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Session.class.php',
	'Tree'					=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Tree.class.php',
	'Captcha'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Captcha.class.php',
	'Helper'				=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Helper.class.php',
	'Http'					=>	ROOT_PATH . 'kernel' . DS . 'core' . DS . 'Http.class.php',
	
	// Kernel / lib
	'Smarty'				=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'smarty' . DS . 'smarty.php',
	'MySmarty'				=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'MySmarty.class.php',
	'MyCache'				=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'MyCache.class.php',
	'Cache_Lite'			=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'PEAR' . DS . 'Lite.php',
	'Form'					=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'Form.class.php',	
	'GoogleMapAPI'			=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'GoogleMapAPIv3.class.php',
	'PHPMailer'				=>	ROOT_PATH . 'kernel' . DS . 'lib' . DS . 'class.phpmailer.php',
	'Pager'					=>	ROOT_PATH .	'kernel' . DS . 'lib' . DS . 'PEAR'. DS .'Pager.php',
	
	// Kernel / base_app
	'Basearticlecontroller'		=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'controller' . DS . 'BaseArticleController.php',
	'Baseconnexioncontroller'	=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'controller' . DS . 'BaseConnexionController.php',
	'Baseutilisateurcontroller'	=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'controller' . DS . 'BaseUtilisateurController.php',
	'Basedownloadcontroller'	=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'controller' . DS . 'BaseDownloadController.php',
	'Basecontactcontroller'		=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'controller' . DS . 'BaseContactController.php',

	'Baseutilisateurmanager'	=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'manager' . DS . 'BaseutilisateurManager.php',
	'Basedownloadrmanager'		=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'manager' . DS . 'BasedownloadManager.php',
	'Basearticlemanager'		=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'manager' . DS . 'BasearticleManager.php',

	'Baseutilisateur'			=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'model' . DS . 'Baseutilisateur.php',
	'Basecontact'				=>	ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'model' . DS . 'Basecontact.php',
);	

foreach( $ClassList as $k => $v ):
	if( $class = $k ):
		require_once $v;
	endif;
endforeach;
	
}

spl_autoload_register('MyAutoload');