<?php

class utilisateurManager extends BaseModel{
	
	public function getAll(){
		
		return	$this->db->select('u.*')
				->from(PREFIX . 'user u')
				->where(array('u.identifiant !=' => 'admin'))
				->order('u.identifiant')
				->get();
		
	}
	
	public function getById( $user_id ){
		
		return	$this->db->select('u.*')
				->from(PREFIX . 'user u')
				->where(array('u.id =' => $user_id))
				->get_one();
		
	}
	
	public function save($user){
		if( empty($user['id']) )
			return $this->db->insert(PREFIX . 'user', $user);
		else
			return $this->db->update(PREFIX . 'user', $user, array('id =' => $user['id']));
	}
	
	public function delete( $user_id ){
		
		return $this->db->delete(PREFIX . 'user',null, array('id =' => $user_id) );
		
	}
}