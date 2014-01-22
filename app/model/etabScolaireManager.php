<?php

class etabScolaireManager extends BaseModel{
	
	public function save( etabScolaire $Data ){
		
		if( empty($Data->id) )
			return $this->insert($Data);
		else
			return $this->update($Data);		
	}
	
	public function getAll(){
		return $this->db->get(PREFIX . 'etab_scolaire',null,'nom');
	}
	
	public function getById($id){
		return $this->db->get_one(PREFIX . 'etab_scolaire',array('id =' => $id));
	}
	
	public function insert($Etab){
		return $this->db->insert(PREFIX . 'etab_scolaire', $Etab);
	}
	
	public function update($Etab){
		$this->db->update(PREFIX . 'etab_scolaire', $Etab, array('id =' => $Etab->id) );
	}
	
	public function delete($etab_id){		
		$this->db->delete(PREFIX . 'etab_scolaire', $etab_id);		
	}
}