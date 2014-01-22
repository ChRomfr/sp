<?php

class exerciceManager extends BaseModel{

	public function getById( $id ){
		return	$this->db->select('e.*')
				->from('test_exercices e')
				->where(array('e.id =' => $id) )
				->get_one();
	}
	
}