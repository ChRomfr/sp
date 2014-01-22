<?php

class structureManager extends BaseModel{
	
	public function getAll(){
		return $this->db->get(PREFIX . 'structure',null,'nom');
	}
	
	public function getById($id){
		return $this->db->get_one(PREFIX . 'structure', array('id =' => $id));
	}
	
	public function insert(structure $Data){
		return $this->db->insert(PREFIX . 'structure', $Data);
	}
	
	public function update(structure $Data){
		$this->db->update(PREFIX . 'structure', $Data, array('id =' => $Data['id']) );
	}
}