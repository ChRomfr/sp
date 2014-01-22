<?php

function getAclForUser($user){
	global $registry;
	
	// Verification si le joueur a les ACL dans la base
	$Result = $registry->db->count(PREFIX . 'acl', array('user_id =' => $user->id) );
	
	if( $Result == 0 ):
		// Recuperation des ACL dans les models pour les affectés
		$AclType = $registry->db->get_one(PREFIX . 'acl_model', array('account_type =' => $user->type) );
		
		// On insert les Acl dans la base
		unset($AclType['account_type'], $AclType['id']);
		$AclType['user_id'] = $user->id;
		$registry->db->insert(PREFIX . 'acl', $AclType);
	endif;
	
	// Recuperation des ACL$
	$Acl = $registry->db->get_one(PREFIX . 'acl', array('user_id =' => $user->id) );
	
	$_SESSION['acl'] = $Acl;
	
	return 1;	
}