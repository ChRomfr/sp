<?php

class etabScolaire extends Record{

	const Table = 'etab_scolaire';
	
	public $id;
	public $nom;
	public $adresse;
	public $code_postal;
	public $ville;
	public $telephone;
	public $email;
	public $url_portail_note;
	
	/*
	public function save( $manager ){
		
		if( empty($this->id) ):
			$this->id = $manager->insert($this);
		else:
			$manager->update($this);
		endif;
	}
	*/
	

}