<?php

class siteManager extends BaseModel{
	
	public function getById($id){
		return $this->db->get_one(PREFIX . 'site', array('id =' => $id) );
	}
	
	public function getAll(){
		return $this->db->get(PREFIX . 'site', null, 'nom');
	}
	
	public function insert( $Data ){
		return $this->db->insert(PREFIX . 'site', $Data);
	}
	
	public function update( $Data ){
		return $this->db->update(PREFIX . 'site', $Data, array('id =' => $Data['id']) );
	}
	
}