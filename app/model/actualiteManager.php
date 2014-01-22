<?php 

class actualiteManager extends BaseModel{
	
	public function save( actualite $Data ){
		if( empty($Data->id) ):
			return $this->insert($Data);
		else:
			return $this->update($Data);
		endif;
	}
	
	private function insert($Data){
		return $this->db->insert(PREFIX . 'actualite', $Data);
	}
	
	private function update($Data){
		return $this->db->update(PREFIX . 'actualite', $Data, array('id =' => $Data->id) );
	}
	
	public function getById( $id ){
		return	$this->db->select('a.*, u.identifiant as auteur')
				->from(PREFIX . 'actualite a')
				->left_join(PREFIX . 'user u', 'a.auteur_id = u.id')
				->where(array('a.id =' => $id))
				->order('a.creat_on DESC')
				->get_one();
	}
	
	public function getAll(){
		return	$this->db->select('a.*, u.identifiant as auteur')
				->from(PREFIX . 'actualite a')
				->left_join(PREFIX . 'user u', 'a.auteur_id = u.id')
				->order('a.creat_on DESC')
				->get();
	}
	
	public function getForWidget(){
		return	$this->db->select('a.*, u.identifiant as auteur')
				->from(PREFIX . 'actualite a')
				->left_join(PREFIX . 'user u', 'a.auteur_id = u.id')
				->order('a.creat_on DESC')
				->limit(10)
				->get();		
	}
	
	/**
	 * Execute la requete de suppression
	 * @param int $id
	 * @return int number of row delete
	 */
	public function delete($id){
		return $this->db->delete(PREFIX . 'actualite', $id);
	}
}