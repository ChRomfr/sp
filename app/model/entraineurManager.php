<?php

class entraineurManager extends BaseModel{
	
	public function getAll(){
		return $this->db->select('e.*, s.nom as structure')
        ->from(PREFIX . 'entraineur e')
        ->left_join(PREFIX . 'structure s','s.id = e.structure_id')
        ->order('nom,prenom')
        ->get();
	}
	
	public function getById( $Entraineur_id ){
		return	$this->db->select('e.*, s.nom as structure')->from(PREFIX . 'entraineur e')->left_join(PREFIX . 'structure s','e.id = e.structure_id')->where(array('e.id =' => $Entraineur_id))->get_one();
	}
	
	/**
	*	Retourne la liste des entraineurs pour les select
	*	@return array
	*/
	public function getForListe(){
		return	$this->db->select('id, nom, prenom')
				->from(PREFIX . 'entraineur')
				->order('nom, prenom')
				->get();
	}
	
	public function save(entraineur $Entraineur){
		
		if( empty($Entraineur->id) ):
			return $this->insert($Entraineur);
		else:
			$this->update($Entraineur);
		endif;
	}
	
	private function insert($Entraineur){
		return $this->db->insert(PREFIX . 'entraineur', $Entraineur);
	}
	
	private function update($Entraineur){
		return $this->db->update(PREFIX . 'entraineur', $Entraineur, array('id =' => $Entraineur->id) );
	}
	
	public function delete( $Entraineur_id ){
		$this->db->delete(PREFIX . 'entraineur', $Entraineur_id);
		$this->db->update(PREFIX . 'joueur', array('entraineur_id' => 0), array('entraineur_id =' => $Entraineur_id) );
	}
}