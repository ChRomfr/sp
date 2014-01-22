<?php

class saison extends Record{
	
	const Table = 'saison';

	public $id;

	public $name;

	public $date_start;

	public $date_end;

	public $add_by;

	public $add_on;

	/**
	 * Verifie si les donnees de la saison sont valides
	 * @return boolean [description]
	 */
	public function isValid(){

		if( empty($this->name) ){
			return false;
		}

		if( empty($this->date_start) ){
			return false;
		}

		if( empty($this->date_end) ){
			return false;
		}

		return true;
	}

}