<?php

class question extends Record{
	
	/**
	*	ID de la question dans la base. Auto increment
	*	int
	*/
	public	$id;
	
	/**
	*	Question
	*	string
	*/
	public	$question;
	
	/**
	*	Choix des réponses separer par des ;
	*	string
	*/
	public	$reply_choice;
	
	/**
	*	Dertermine si la question peut avoir plusieurs reponse
	*	bool
	*/
	public	$multi_reply;
	
	/**
	*	Contient l ID du questionnaire
	*	int
	*/
	public	$questionnaire_id;
	
	public function isValid(){
		$error = 0;
		
		if( empty($this->question) ):
			$error++;
		endif;
		
		if( empty($this->questionnaire_id) ):
			$error++;
		endif;
		
		if( $error == 0 ):
			return true;
		else:
			return false;
		endif;
	}
}