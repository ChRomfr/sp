<?php 

class projetFormationManager extends BaseModel{
	
	public function save( projetFormation $Data ){
		
		if( isset($Data->id) && !empty($Data->id) )
			return $this->update($Data);
		else
			return $this->insert($Data);
		
	}
	
	private function insert(projetFormation $Data){
		return $this->db->insert(PREFIX . 'projet_formation', $Data);
	}
	
	private function update(projetFormation $Data){
		return $this->db->update(PREFIX . 'projet_formation', $Data, array('id =' => $Data->id));
	}
	
	public function getById($id){
		return	$this->db->select('pj.*')
				->from(PREFIX . 'projet_formation pj')
				->where(array('pj.id =' => $id))
				->get_one();
	}
	
	public function getByJoueurIdTermeYear($Joueur_id, $Terme, $Year){
		
		return	$this->db->select('pj.*')
				->from(PREFIX . 'projet_formation pj')
				->where(array('pj.joueur_id =' => $Joueur_id, 'pj.terme =' => $Terme, 'pj.year =' => $Year))
				->get_one();
		
	}
}