<?php

class parenManager extends BaseModel{
	
	public function insert(paren $Parent){
		$this->db->insert(PREFIX . 'parent', $Parent);
	}
	
	public function update(paren $Parent){
		$this->db->update(PREFIX . 'parent', $Parent);
	}
    
    public function delete($pid){
        $this->db->delete(PREFIX . 'parent', $pid);
    }
	
	public function getByJoueurId($joueur_id){
		return $this->db->get(PREFIX . 'parent', array('joueur_id =' => $joueur_id));
	}
    
    public function getById( $parent_id ){
        return $this->db->get_one(PREFIX . 'parent', array('id =' => $parent_id));
    }
}