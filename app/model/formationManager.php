<?php

class formationManager extends BaseModel{
	
	public function getById($formation_id){
		
		return	$this->db->select('sf.*, es.*, j.*, es.nom as etablissement')
					->from(PREFIX . 'scolaire_formation sf')
					->left_join(PREFIX . 'etab_scolaire es','sf.etablissement_id = es.id')
					->left_join(PREFIX . 'joueur j','sf.sportif_id = j.id')
					->where( array('sf.id =' => $formation_id) )
					->get_one();
		
	}
	
}