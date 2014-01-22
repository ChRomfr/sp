<?php

class questionnaireManager extends BaseModel{

	public function save( questionnaire $Questionnaire ){
		if( empty($Questionnaire->id) )
			return $this->insert($Questionnaire);
		else
			return $this->update($Questionnaire);
	}
	
	private function insert( questionnaire $Questionnaire ){
		return $this->db->insert(PREFIX . 'questionnaire', $Questionnaire);
	}
	
	private function update( questionnaire $Questionnaire ){
	
	}

}