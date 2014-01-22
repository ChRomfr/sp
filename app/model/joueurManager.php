<?php

class joueurManager extends BaseModel{
 	
	public function insert( joueur $joueur ){
		return $this->db->insert(PREFIX . 'joueur', $joueur);
	}
	
	public function update( joueur $joueur ){
		return $this->db->update(PREFIX . 'joueur', $joueur);
	}
	
	public function getById($id){
		return	$this->db->select('tj.*, u.identifiant as creat_auteur, u2.identifiant as edit_auteur,
					(SELECT tjt.taille FROM '. PREFIX . 'joueur_taille tjt WHERE tj.id = tjt.joueur_id AND id = (SELECT MAX(id) FROM '. PREFIX . 'joueur_taille tjt2 WHERE tj.id = tjt2.joueur_id )) AS taille,
					(SELECT tjp.poids FROM '. PREFIX . 'joueur_poids tjp WHERE tj.id = tjp.joueur_id AND id = (SELECT MAX(id) FROM '. PREFIX . 'joueur_poids tjp2 WHERE tj.id = tjp2.joueur_id )) AS poids'
				)
				->from(PREFIX . 'joueur tj')
                ->left_join(PREFIX . 'user u', 'tj.creat_by = u.id')
                ->left_join(PREFIX . 'user u2', 'tj.edit_by = u2.id')
				->where( array('tj.id =' => $id) )
				->limit(1)
				->get_one();
	}
	
	public function getByStructureId($id){
		return $this->db->get(PREFIX . 'joueur', array('structure_id =' => $id) );
	}
	
	public function getByEtabId($etab_id){
		return $this->db->get(PREFIX . 'joueur', array('etab_scolaire_id =' => $etab_id) );
	}
    
    public function getDisponibleForTrainning($date, $equipe = null){

        $this->db
        	->select(' DISTINCT(tj.id) ,tj.nom, tj.prenom,tj.date_entree, (SELECT MAX(tjm.dispo_rugby) FROM '.PREFIX .'joueur_medical tjm WHERE tjm.joueur_id = tj.id)AS dispo_rugby')
        	->from(PREFIX . 'joueur tj')
        	->left_join(PREFIX . 'joueur_equipe je','tj.id = je.joueur_id')
        	->where(array( 'tj.date_entree <' => $date, 'tj.actif =' => 1));

        if( !empty($equipe) && is_numeric($equipe) ):
        	$this->db->where( array('je.equipe_id =' => $equipe) );
    	endif;
        
        return $this->db->get();
    }
	
    public function getDisponibleForTrainningByEID($eid, $date){
       $this->db->select('tj.id,tj.nom, tj.prenom, tje.suivi, tje.presence, (SELECT MAX(tjm.dispo_rugby) FROM '.PREFIX .'joueur_medical tjm WHERE tjm.joueur_id = tj.id)AS dispo_rugby')
        ->from(PREFIX . 'joueur tj')
        ->left_join(PREFIX . 'joueur_entrainement tje', 'tj.id = tje.joueur_id')
        //->left_join(PREFIX . 'joueur_medical tjm','tjm.joueur_id = tj.id')
        ->where(array( 'tj.date_entree <' => $date, 'tj.date_sortie >' => $date, 'tje.entrainement_id=' => $eid));
        
        return $this->db->get(); 
    }
    
    public function getAll($param = null){
        $this->db->select(' DISTINCT(tj.id), tj.*, tc.nom AS structure')
			->from(PREFIX . 'joueur tj')
			->left_join(PREFIX . 'structure tc', 'tj.structure_id = tc.id')
			->left_join(PREFIX . 'joueur_equipe je','tj.id = je.joueur_id');
		
		if( !empty($param) ) $this->db->where( $param );
		
        $this->db->order('tj.nom, tj.prenom');
		
        return $this->db->get();
    }
    
}