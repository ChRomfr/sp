<?php 

class actualite extends Record{

	const Table = 'news';
	
	public	$id;
	public	$titre;
	public	$contenu;
	public	$auteur_id;
	public	$categorie_id;
	public	$creat_on;
	public	$edit_on;
	
	public function isValid(){
		
		$error = 0;
		
		if( empty($this->titre) ):
			$error++;
		endif;
		
		if( empty($this->contenu) ):
			$error++;
		endif;
		
		if( empty($this->auteur_id) || !is_numeric($this->auteur_id) ):
			$error++;
		endif;
		
		if( !is_numeric($this->categorie_id) ):
			$error++;
		endif;
		
		if( empty($this->creat_on) || !is_numeric($this->creat_on) ):
			$error++;
		endif;
		
		if( empty($this->edit_on) || !is_numeric($this->edit_on) ):
			$error++;
		endif;
		
		if( $error == 0):
			return true;
		else:
			return $error;
		endif;
		
	}
	
}