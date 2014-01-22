<?php

class structure extends Record{
	
	const Table = 'structure';

	public $id;
	public $nom;
	public $adresse;
	public $code_postal;
	public $ville;
	public $telephone;
	/*public $email;*/
	
	/*
	public function save( $manager ){
		
		if( empty($this->id) ):
			$this->id = $manager->insert($this);
		else:
			$manager->update($this);
		endif;
	}
    */

    public function isValid(){
        if( empty($this->nom) ){
            return false;
        }
        
        return true;
    }

}