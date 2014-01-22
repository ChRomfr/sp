<?php

//require_once ROOT_PATH . 'kernel' . DS . 'base_app' . DS . 'model' . DS . 'Baseutilisateur.php';

class utilisateur extends Baseutilisateur{

	const Table = 'user';
    
    public $widget_index_alerte;
    public $suivi_medical_add_commentaire;
    public $widget_index_rss;
    public $flux_rss_1;
    public $flux_rss_2;
    public $joueur_trombi;
	public $suivi_medical_show_prive;
	public $type;
	public $id_liaison;
	public $index_trombi;			// Bool determine si affichage du trombi sur la page d accueil
	public $widget_index_blessure;	// Bool determine si affichage des blessures sur la page d accuel
	public $gmail_adr;
	public $gmail_password;
	public $gmail_id_prv;
	
	public $isAdmin;
	
	/**
	*	Verifie la validite des donnees
	*	@return bool
	*/
	public function isValid(){
		
		if( empty($this->identifiant) ){
			return false;
		}
		
		return true;
	}
}
