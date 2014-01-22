<?php

class entrainementManager extends BaseModel{
    
    public function getByJoueurData( $Joueur ){
        
        $this->db->select('te.*, tje.*, tjec.nom as cycle')
        ->from(PREFIX . 'entrainement te')
        //->right_join(PREFIX . 'joueur_entrainement tje', 'te.id = tje.entrainement_id')
        ->left_join(PREFIX . 'joueur_entrainement tje', 'te.id = tje.entrainement_id')
        ->left_join(PREFIX . 'joueur_entrainement_cycle tjec', 'tje.cycle_id = tjec.id')
        ->where( array('date_entrainement >' => $Joueur->date_entree, 'date_entrainement <' => $Joueur->date_sortie, 'tje.joueur_id =' => $Joueur->id) )
        ->order('te.date_entrainement DESC');
        
        return $this->db->get();
        
    }
	
	public function getByJoueurDataAndType( $Joueur, $Type ){

		$this->db
            ->select('te.*, tje.*, tjec.nom as cycle')
            ->from(PREFIX . 'entrainement te')
            ->left_join(PREFIX . 'joueur_entrainement tje', 'te.id = tje.entrainement_id')
            ->left_join(PREFIX . 'joueur_entrainement_cycle tjec', 'tje.cycle_id = tjec.id')
            ->where( array('date_entrainement >' => $Joueur->date_entree, 'date_entrainement <' => $Joueur->date_sortie, 'tje.joueur_id =' => $Joueur->id) );

        if( !empty($Type) && is_numeric($Type) ):
            $this->db->where( array('te.type =' => $Type) );
        endif;

        $this->db->order('te.date_entrainement DESC');
        
        return $this->db->get();
	}
    
    public function getByCycleId($cycle_id){
        $this->db->select('te.*, tje.*, tjec.nom as cycle')
        ->from(PREFIX . 'entrainement te')
        //->right_join(PREFIX . 'joueur_entrainement tje', 'te.id = tje.entrainement_id')
        ->left_join(PREFIX . 'joueur_entrainement tje', 'te.id = tje.entrainement_id')
        ->left_join(PREFIX . 'joueur_entrainement_cycle tjec', 'tje.cycle_id = tjec.id')
        ->where( array('tje.cycle_id =' => $cycle_id) )
        ->order('te.date_entrainement DESC');
        
        return $this->db->get();
    }
    
    
    public function getAll($order = 'e.date_entrainement DESC'){
        //return $this->db->get(PREFIX . 'entrainement', null, 'date_entrainement DESC');
		
		return	$this->db->select('e.*, cl.libelle as entrainement_type')
				->from(PREFIX . 'entrainement e')
				->left_join(PREFIX . 'commun_liste cl','e.type = cl.value')
				->where( array('cl.code =' => 'TENT') )
				->order($order)
				->get();
    }
    
    public function getCycleByJoueurId( $joueur_id ){
        $this->db->select('tc.*, (SELECT COUNT(tje.id) FROM '. PREFIX . 'joueur_entrainement tje WHERE tc.id = tje.cycle_id) AS NbEntrainement')
        ->from(PREFIX . 'joueur_entrainement_cycle tc')
        ->where(array('tc.joueur_id =' => $joueur_id));
        
        return $this->db->get();
    }
    
    public function getCycleByJoueurIdAndType( $joueur_id, $type ){
        $this->db->select('tc.*, (SELECT COUNT(tje.id) FROM '. PREFIX . 'joueur_entrainement tje WHERE tc.id = tje.cycle_id) AS NbEntrainement')
        ->from(PREFIX . 'joueur_entrainement_cycle tc')
        ->where(array('tc.joueur_id =' => $joueur_id));

        if( !is_null($type)):
            $this->db->where_free( '(tc.type = '. $type .' OR tc.type = 3 OR tc.type IS NULL)' );
        endif;
        
        return $this->db->get();
    }
	
	public function getByIdAndJoueurId($eid, $jid){
		return	$this->db->select('te.*, tje.*, tjec.nom as cycle')
				->from(PREFIX . 'entrainement te')
				->left_join(PREFIX . 'joueur_entrainement tje', 'te.id = tje.entrainement_id')
				->left_join(PREFIX . 'joueur_entrainement_cycle tjec', 'tje.cycle_id = tjec.id')
				->where( array( 'te.id =' =>	$eid, 'tje.joueur_id =' =>	$jid ) )
				->limit(1)
				->get_one();
					
	}
}
?>
