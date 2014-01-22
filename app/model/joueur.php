<?php

class joueur extends Record{
	
	const Table = 'joueur';
	
	public $id;
	public $num_licence;
	public $numero_homologation;
	public $nom;
	public $prenom;
	public $date_naissance;
	public $lieu_naissance;
	public $adresse;
	public $code_postal;
	public $ville;
	public $telephone;
	public $portable;
	public $email;
	public $date_entree;
	public $date_sortie;
	public $date_saisie;
	public $parent_situation;
	public $selection;
	public $classe;
	public $diplome_prepare;
	public $poste;
	public $structure_id;
	public $etab_scolaire_id;
	public $sexe;
	public $suivi_scolaire_identifiant;
	public $suivi_scolaire_password;
	public $entraineur_id;
	public $actif;
	public $site_id;
    
    // DATA POUR LE SUIVI
    public $creat_on;
    public $creat_by;
    public $edit_on;
    public $edit_by;
	
	public function isValid(){
		
		return true;
	}
	/*
	public function save( $manager ){
		if( empty($this->id) ):
			$this->date_saisie = time();
            $this->id = $manager->insert($this);
        else:
            $manager->update($this);
		endif;
	}
	*/

	/**
	*	Complete les donnees necessaire pour l ajout d un nouvel enregistrement dans la base
	*	@return void
	*/
	public function newRecord(){

		if( empty($this->site_id) ):
			$this->site_id = 0;
		endif;

		$this->creat_by = $_SESSION['utilisateur']['id'];
		$this->creat_on = time();
		$this->edit_by = $_SESSION['utilisateur']['id'];
		$this->edit_on;
	}

	public function editRecord(){

	}

	public function setEntraineurId( $id ){
		$this->entraineur_id = $id;
	}
	
	public function getId(){
		return $this->id;
	}
	
	public function getEntraineurId(){
		return $this->entraineur_id;
	}
}