<?php
class SuiviMedical extends Record{
    
    public $id;
    public $joueur_id;
    public $type;
    public $suivi;
    public $suivi_prive;
    public $date_saisie;
    
    /**
    * Date jusqu'à laquel le joueur est dispensé de rugby
    * 
    * @var mixed
    */
    public $dispo_rugby;
    
    /**
    * Date jusqu'à laquel le joueur est dispensé de musculation
    * 
    * @var mixed
    */
    public $dispo_muscu;
    
    /**
    * Date de la blessure sinon de la visite
    * 
    * @var mixed
    */
    public $date_medical;
    
    public function formatForSave(  ){
        
        if( empty($this->id) ){
        
            if( !empty($this->dispo_muscu) ){
                $tmp = explode('/', $this->dispo_muscu);
                $this->dispo_muscu = mktime(23,59,59,$tmp[1],$tmp[0],$tmp[2]);
            }
            
             if( !empty($this->dispo_rugby) ){
                $tmp = explode('/', $this->dispo_rugby);
                $this->dispo_rugby = mktime(23,59,59,$tmp[1],$tmp[0],$tmp[2]);
            }
            
            $tmp = explode('/', $this->date_medical);
            $this->date_medical = mktime(23,59,59,$tmp[1],$tmp[0],$tmp[2]); 
            
            $this->date_saisie = time();
                    
        }else{
            
        } 
    }
    
}
?>
