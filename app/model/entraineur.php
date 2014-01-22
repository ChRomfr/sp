<?php

class entraineur extends Record{
	
	const Table = 'entraineur';
	
	public	$id;
	public	$nom;
	public	$prenom;
	public	$telephone;
	//public	$portable;
	public	$email;
    public  $structure_id;
	
	public function isValid(){
		
		$error = 0;
		
		if( empty($this->nom) ){
			$error++;
		}
		
		if( empty($this->prenom) ){
			$error++;
		}
		
		/*if( empty($this->telephone) ){
			$error++;
		}*/
		
		if( $error == 0 )
			return true;
		else 
			return false;
			
	}
	
}