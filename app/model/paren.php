<?php

class paren extends Record{

	const Table = 'parent';
	
	public $id;
	public $type;
	public $nom;
	public $prenom;
	public $adresse;
	public $code_postal;
	public $ville;
	public $telephone;
	public $portable;
	public $telephone_pro;
	public $emploi;
	public $joueur_id;
	
	/**
	*	Verifie la validite de l enregistrement
	*	@return bool
	*/
	public function isValid(){
	
		if( empty($this->nom) && empty($this->prenom) )
			return false;
			
		return true;
		
	}
}