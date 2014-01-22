<?php
class SuiviMedicalManager extends BaseModel{
    
    public function save(SuiviMedical $Suivi){
        if( empty($Suivi->id) )
            return $this->db->insert(PREFIX . 'joueur_medical', $Suivi);
        else
            return $this->db->update(PREFIX . 'joueur_medical', $Suivi);
    }
    
   /* public function getByJoueurId( $joueur_id ){
        return $this->db->get(PREFIX . 'joueur_medical', array('joueur_id =' => $joueur_id), 'date_sasie DESC');
    }*/
    
    public function getById($suivi_id){
        return $this->db->get_one(PREFIX . 'joueur_medical', array('id =' => $suivi_id));
    }
    
    public function getMaxDispoRugbyByJoueurId($joueur_id ){
        $tmp = $this->db->select('MAX(dispo_rugby) as dispo')
        ->from(PREFIX . 'joueur_medical')
        ->where(array('joueur_id =' => $joueur_id))
        ->get_one();
        
        return $tmp['dispo'];
    }
    
    public function getMaxDispoMuscuByJoueurId($joueur_id ){
        $tmp = $this->db->select('MAX(dispo_muscu) as dispo')
        ->from(PREFIX . 'joueur_medical')
        ->where(array('joueur_id =' => $joueur_id))
        ->get_one();
        
        return $tmp['dispo'];
    }
    
    public function getByJoueurId( $Joueur_id ){
        return  $this->db->select('tjm.*, (SELECT COUNT(tjmc.id) FROM '. PREFIX . 'joueur_medical_commentaire tjmc WHERE tjm.id = tjmc.suivi_id) AS NbCommentaire')
                ->from(PREFIX . 'joueur_medical tjm')
                ->where( array('tjm.joueur_id =' => $Joueur_id) )
                ->order( 'tjm.date_saisie DESC' )
                ->get();       
    }
    
    public function getByDate( $date ){
        return  $this->db->select('tjm.*, tj.prenom, tj.nom, tj.id as jid')
                ->from(PREFIX . 'joueur_medical tjm')
                ->left_join(PREFIX . 'joueur tj', 'tjm.joueur_id = tj.id')
                ->where( array('dispo_rugby >' => $date ))
                ->get();
    }
}
