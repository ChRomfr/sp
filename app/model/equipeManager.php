<?php

class equipeManager extends BaseModel{
	
	public function getById($id){
		return	$this->db->select('e.*, s.nom as structure')
				->from(PREFIX . 'equipe e')
				->left_join(PREFIX . 'structure s','e.structure_id = s.id')
				->where(array('e.id =' => $id))
				->order('e.nom')
				->get_one();
	}
	
	public function getAll(){
		return	$this->db->select('e.*, s.nom as structure')
				->from(PREFIX . 'equipe e')
				->left_join(PREFIX . 'structure s','e.structure_id = s.id')
				->order('e.nom')
				->get();
	}
	
	/**
	 * Recuperer la liste des equipes avec le nom de la structure
	 * par rapport a un id de structure
	 * @param int $structure_id
	 * @return array
	 */
	public function getByStructureId($structure_id){
		return	$this->db->select('e.*, s.nom as structure')
				->from(PREFIX . 'equipe e')
				->left_join(PREFIX . 'structure s','e.structure_id = s.id')
				->where(array('structure_id =' => $structure_id))
				->order('e.nom')
				->get();
	}
	
	public function getByJoueurId($JoueurId){
		return	$this->db->select('e.*, s.nom as structure, je.id as jeid')
				->from(PREFIX . 'joueur_equipe je')
				->left_join(PREFIX . 'equipe e','je.equipe_id = e.id')
				->left_join(PREFIX . 'structure s','e.structure_id = s.id')
				->where(array('je.joueur_id = ' => $JoueurId))
				->order('e.nom')
				->get();		
	}
	
	public function save($Data){
		if( isset($Data['id']) && !empty($Data['id']) ):
			return $this->update($Data);
		else:
			return $this->insert($Data);
		endif;
	}
	
	private function insert($Data){
		return $this->db->insert(PREFIX . 'equipe', $Data);
	}
	
	private function update($Data){
		return $this->db->update(PREFIX . 'equipe', $Data, array('id =' => $Data['id']));
	}
	
	public function getJoueurInEquipe($equipe_id){
		return	$this->db->select('j.id, j.prenom, j.nom')
				->from(PREFIX . 'joueur_equipe je')
				->left_join(PREFIX . 'joueur j','je.joueur_id = j.id')
				->where(array('je.equipe_id =' => $equipe_id))
				->get();
	}
} // end class