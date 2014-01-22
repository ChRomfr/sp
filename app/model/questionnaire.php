<?php

class questionnaire extends Record{

	public	$id;
	public	$name;
	public	$description;
	public	$creat_by;
	public	$date_creat;
	
	/**
	*	Verifie si le questionnaire est valide
	*
	*/
	public function isValid(){
	
		$Message = NULL;
		$error = 0;
	
		if( empty($this->name) ):
			$error++;
			$Message = "Name is required";
		endif;
		
		if( $error == 0 ):
			return true;
		endif;
		
		return $Message;
	}
}