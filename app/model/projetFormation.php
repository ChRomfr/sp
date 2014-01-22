<?php 

class projetFormation extends Record{
	
	public 	$id;
	public	$joueur_id;
	public	$auteur_id;
	public	$year;
	public	$terme;
	public	$intitule;
	public	$observation;
	public	$projection_cycle;
	public	$creat_on;
	public	$edit_on;
	
	public function isValid(){
		$error = 0;
		
		if( $error == 0)
			return true;
	}
	
}