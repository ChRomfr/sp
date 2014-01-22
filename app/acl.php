<?php
if( $_SESSION['utilisateur']['id'] != 'Visiteur' ):
	if( $_SESSION['utilisateur']['type'] == 'admin' ):
   /* $acl = array(
        // Joueur
        'add_joueur'        =>  true,
        'edit_joueur'       =>  true,
        'delete_joueur'     =>  true,
        'show_all_fiche'    =>  true,
        'joueur_physique'   =>  true,
        'joueur_documents'  =>  true,
        // Medical
        'suivimed_add'      =>  true,
        'suivimed_edit'     =>  true,
        'suivimed_delete'   =>  true,
    );*/
    
    
        //JOUEUR
		$_SESSION['acl']['add_joueur'] 							= true;					// Permet l ajout d un joueur dans la base
		$_SESSION['acl']['edit_joueur'] 						= true;					// Permet l edition de la fiche
		$_SESSION['acl']['delete_joueur'] 						= true;				    // Permet la suppression d un joueur
		$_SESSION['acl']['show_all_fiche'] 						= true;				    // Permet l'affichage de toute les fiches joueurs
		$_SESSION['acl']['joueur_physique'] 					= true;				    // Permet la gestion des données physyque (taille, poids ... )
        $_SESSION['acl']['joueur_documents']                    = true;                 // permet la suppression de documents dans la fiche des joueurs
		// SUIVI MEDICAL
		$_SESSION['acl']['suivimed_edit'] 						= true;
        $_SESSION['acl']['suivimed_add'] 						= true;
        $_SESSION['acl']['suivimed_delete']						= true;
        //PARENT
        $_SESSION['acl']['parent_edit'] 			            = true;
        $_SESSION['acl']['parent_add'] 				            = true;
        $_SESSION['acl']['parent_delete']			            = true;
        //CLUB
        $_SESSION['acl']['club_view'] 				            = true;
        $_SESSION['acl']['club_edit'] 				            = true;
        $_SESSION['acl']['club_add'] 				            = true;
        $_SESSION['acl']['club_delete'] 			            = true;
        //ENTRAINEMENT && CYCLE ENTRAINEMENT
        $_SESSION['acl']['entrainement_view'] 		            = true;
        $_SESSION['acl']['entrainement_add'] 		            = true;
        $_SESSION['acl']['entrainement_edit'] 		            = true;
        $_SESSION['acl']['entrainement_delete'] 	            = true;
		// ENTRAINEUR
		$_SESSION['acl']['entraineur_gestion']					= true;
        //TRIMESTRE ET BULLETIN
        $_SESSION['acl']['bulletin_view'] 			            = true;
        $_SESSION['acl']['bulletin_add'] 			            = true;
        $_SESSION['acl']['bulletin_edit'] 			            = true;
        $_SESSION['acl']['bulletin_delete'] 		            = true;
        //MUSCULATION
        $_SESSION['acl']['musculation_exercice_add'] 			= true;
        $_SESSION['acl']['musculation_exercice_edit']			= true; 
		$_SESSION['acl']['musculation_exercice_delete']			= true;
        // MUSCYLATION CYCLE
        $_SESSION['acl']['musculation_cycle_add'] 				= true;
		$_SESSION['acl']['musculation_cycle_edit'] 				= true;
		$_SESSION['acl']['musculation_cycle_delete'] 			= true;
		// MUSCYLATION CYCLE TEMPLATE
		$_SESSION['acl']['musculation_cycle_template_view'] 	= true;
        $_SESSION['acl']['musculation_cycle_template_add'] 		= true;
		$_SESSION['acl']['musculation_cycle_template_edit'] 	= true;
		$_SESSION['acl']['musculation_cycle_template_delete'] 	= true;		
		// MUSCULATION SEANCE
		$_SESSION['acl']['musculation_seance_add'] 				= true;
		$_SESSION['acl']['musculation_seance_delete'] 			= true;
        // MUSCULATION TEST
        $_SESSION['acl']['muscu_test_view']                     = true;
        $_SESSION['acl']['muscu_test_add']                      = true;
        $_SESSION['acl']['muscu_test_delete']                   = true;
        // TEST
        $_SESSION['acl']['test_add']                            = true;
        $_SESSION['acl']['test_edit']                           = true;
        $_SESSION['acl']['test_delete']                         = true;                            
	endif;
    
    if( $_SESSION['utilisateur']['type'] == 'medic' ):
        $_SESSION['acl']['add_joueur'] = false;
        $_SESSION['acl']['edit_joueur'] = false;
        $_SESSION['acl']['delete_joueur'] = false;
        $_SESSION['acl']['show_all_fiche'] = true;    
        $_SESSION['acl']['parent_edit'] = false;
        $_SESSION['acl']['parent_add'] = false;
        $_SESSION['acl']['parent_delete'] = false;
    endif;
	
	if( $_SESSION['utilisateur']['type'] == 'joueur' ):
        //JOUEUR
		$_SESSION['acl']['add_joueur'] = false;
		$_SESSION['acl']['edit_joueur'] = false;
		$_SESSION['acl']['delete_joueur'] = false;
		$_SESSION['acl']['show_all_fiche'] = false;	
        //PARENT
        $_SESSION['acl']['parent_edit'] = false;
        $_SESSION['acl']['parent_add'] = false;
        $_SESSION['acl']['parent_delete'] = false;
        //CLUB
        $_SESSION['acl']['club_view'] = true;
        $_SESSION['acl']['club_edit'] = false;
        $_SESSION['acl']['club_add'] = false;
        $_SESSION['acl']['club_delete'] = false;
        //ENTRAINEMENT
        $_SESSION['acl']['entrainement_view'] = true;
        $_SESSION['acl']['entrainement_add'] = false;
        $_SESSION['acl']['entrainement_edit'] = false;
        $_SESSION['acl']['entrainement_delete'] = false;
        //TRIMESTRE ET BULLETIN
        $_SESSION['acl']['bulletin_view'] = true;
        $_SESSION['acl']['bulletin_add'] = false;
        $_SESSION['acl']['bulletin_edit'] = false;
        $_SESSION['acl']['bulletin_delete'] = false;
        //MUSCULATION
        $_SESSION['acl']['musculation_exercice_add'] = false;
        $_SESSION['acl']['musculation_exercice_edit'] = false;
        
        // MUSCYLATION CYCLE
        $_SESSION['acl']['musculation_cycle_add'] = false;
    endif;
    
    $_SESSION['acl']['suivi_medical_add_commentaire'] = $_SESSION['utilisateur']['suivi_medical_add_commentaire'];
else:
	$_SESSION['acl'] = array(
		// Joueurs
		'add_joueur'		=>	false,
		'edit_joueur'		=>	false,
		'delete_joueur'		=>	false,
		'show_all_fiche'	=>	false,
		'joueur_physique'	=>	false,
		'joueur_documents'	=>	false,
		// SUIVI MEDICAL
		'suivimed_edit'		=>	false,
        'suivimed_add'		=>	false,
        'suivimed_delete'	=>	false,
        //PARENT
        'parent_edit'		=> 	false,
		'parent_add'		=>	false,
        'parent_delete'		=>	false,
        //CLUB
        'club_view'			=>	false,
        'club_edit'			=>	false,
        'club_add' 			=>	false,
        'club_delete'		=>	false,
	);
endif;

