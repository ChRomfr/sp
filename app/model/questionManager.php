<?php

class questionManager extends BaseModel{
	
	public function save( question $Question ){
		if( empty($Question->id) ):
			return $this->insert($Question);
		else:
			return $this->update($Question);
		endif;
	}
	
	private function insert( $Question ) {
		return $this->db->insert(PREFIX . 'question', $Question);
	}
	
}