{if $smarty.session.utilisateur.id != "Visiteur"}
{strip}
{* MB MENU *}
<div id="blok_menu">
		<h5>{$lang.Navigation}</h5>
		<div class="corpmenu">
	<div class="vertMenu">
		<table class="rootVoices vertical" cellspacing='0' cellpadding='0' border='0'>
			<tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("index/index")}'">{$lang.Accueil}</td></tr>
			{if $smarty.session.acl.view_all_fiche == true}
              <tr><td {literal}class="rootVoice {menu: 'menu_joueurs'}"{/literal} >{$lang.Joueurs}</td></tr>
            {/if}
			{if $smarty.session.utilisateur.type == 'joueur'}
              <tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("joueur/index")}'">{$lang.Fiche}</td></tr>
            {/if}
			
				<!-- START Documents -->
				{if $InfosInstall.i_type == 'full'}
				<tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("document/index")}'">{$lang.Documents}</td></tr>
				{/if}
				<!-- END Documents -->
				
				<!-- START Musculation -->
				{if $InfosInstall.i_type == 'full'}
					<tr><td {literal}class="rootVoice {menu: 'menu_musculation'}"{/literal} >{$lang.Musculation}</td></tr>
				{/if}
				<!-- END Musculation -->
				
				<!-- START Test physiqye -->
				{if $smarty.session.acl.gest_entrainement == 1}
				<tr><td {literal}class="rootVoice {menu: 'menu_testphysique'}"{/literal} >{$lang.Test_physique}</td></tr>
				{/if}
				<!-- END Test physique -->

				<!-- START Entrainements -->
				{if $smarty.session.acl.gest_entrainement == 1}
	            <tr><td {literal}class="rootVoice {menu: 'menu_entrainement'}"{/literal} >{$lang.Entrainements}</td></tr>
	            {/if}
	            <!-- END Entrainement -->	            

				<!-- START Ressentie -->
				{if ($smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_joueur == 1) && $InfosInstall.i_type == 'full'}
		          <tr>
		            <td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("ressentie")}'">{$lang.Ressentie}</td>
		          </tr>
				{/if}
				<!-- END Ressentie -->
		
			<tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("programmation/index")}'">{$lang.Programmation}</td></tr>

			
			
			{* *** MODULES COMPLEMENTAIRES *** *}
	        {foreach $config.modules as $module}
				{if $module.m_view_in_menu == 1}
				<tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("{$module.m_module}/index")}'">{$module.m_name}</td></tr>
				{/if}
	        {/foreach}
			
            <tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("organigramme/index")}'">{$lang.Organigramme}</td></tr>
            
			<tr><td {literal}class="rootVoice {menu: 'menu_profil'}"{/literal} onclick="javascript:window.location.href='{getLink("utilisateur/index")}'">{$lang.Your_profil}</td></tr>
			
			{if $smarty.session.utilisateur.type == 'admin'}<tr><td {literal}class="rootVoice {menu: 'menu_administration'}"{/literal} onclick="javascript:window.location.href='{getLink("administration/index")}'">{$lang.Administration}</td></tr>{/if}
			
			<tr><td {literal}class="rootVoice {menu: 'empty'}"{/literal} onclick="javascript:window.location.href='{getLink("connexion/logout")}'">{$lang.Deconnexion}</td></tr>
		</table>
	</div>
	</div>
</div>

{* MENU JOUEURS *}
<div id="menu_joueurs" class="mbmenu">
	<a href="{getLink("joueur")}" {literal}class="{img:'icon_14.png'}"{/literal}>{$lang.Liste}</a>
	{if $smarty.session.acl.gest_joueur == true}
	<a rel="separator"> </a>
	<a href="{getLink("joueur/add")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>
	<li><a href="{getLink("joueur/sendGroupeMail")}" title="" {literal}class="{img:'mail.png'}"{/literal}>Envoie e-mail</a>
	<a rel="separator"> </a>
	{/if}
</div>

{* MENU MUSCULATION *}
<div id="menu_musculation" class="mbmenu">
	<a href="{getLink("musculation")}" title="{$lang.Exercice}">{$lang.Exercice}</a>
	<a href="{getLink("muscu/cycleListe")}" {literal}class="{menu: 'sub_menu_musculation_cycle'}"{/literal}>{$lang.Cycle}</a>
	<a href="{getLink("muscu/seanceListe")}" title="{$lang.Liste_des_seances}" {literal}class="{menu: 'sub_menu_musculation_seance'}"{/literal}>{$lang.Liste_des_seances}</a>
	<a href="{getLink("muscu/testListe")}" {literal}class="{menu: 'sub_menu_musculation_test'}"{/literal} title="{$lang.Tests}">{$lang.Tests}</a>
</div>

{* SOUS MENU MUSCULATION CYCLE *}
<div id="sub_menu_musculation_cycle" class="mbmenu">
	<a href="{getLink("muscu/cycleListe?all")}">Tous</a>
	{if $smarty.session.acl.gest_muscu == 1}<a href="{getLink("muscu/cycleAdd")}" title="{$lang.Ajouter_un_cycle}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Ajouter_un_cycle}</a>{/if}
</div>

{* SOUS MENU MUSCULATION SEANCE *}
<div id="sub_menu_musculation_seance" class="mbmenu">
	{if $smarty.session.acl.gest_muscu == 1}<a href="{getLink("muscu/seanceAdd")}" title="{$lang.Ajouter_un_modele}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Ajouter_un_modele}</a>{/if}
</div>

{* SOUS MENU MUSCULATION TEST *}
<div id="sub_menu_musculation_test" class="mbmenu">
	{if $smarty.session.acl.gest_muscu == 1}<a href="{getLink("muscu/testAdd")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>{/if}
</div>

{* MENU TEST PHYSYQUE *}
<div id="menu_testphysique" class="mbmenu">
	<a href="{getLink("test/index")}" title="{$lang.Liste}" {literal}class="{menu: 'sub_menu_test_physique'}"{/literal}>{$lang.Liste}</a>
	<a href="{getLink("test/indexExercice")}" title="{$lang.Exercice}" {literal}class="{menu: 'sub_menu_test_physique_exercice'}"{/literal}>{$lang.Exercice}</a>
</div>

{* SOUS MENU TEST PHYSIQUE *}
<div id="sub_menu_test_physique" class="mbmenu">
	{if $smarty.session.acl.gest_entrainement == 1}<a href="{getLink("test/add")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>{/if}
</div>

{* SOUS MENU TEST PHYSIQUE EXERCICE *}
<div id="sub_menu_test_physique_exercice" class="mbmenu">
	{if $smarty.session.acl.gest_entrainement == 1}<a href="{getLink("test/addExercice")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>{/if}
</div>

{* MENU ENTRAINEMENT *}
<div id="menu_entrainement" class="mbmenu">
	<a href="{getLink("entrainement")}" title="{$lang.Liste}" {literal}class="{img:'icon_14.png'}"{/literal}>{$lang.Liste}</a>
	<a href="{getLink("entrainement/add")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>
</div>

{* MENU STRUCTURE *}
<div id="menu_structure" class="mbmenu">
	<a href="{getLink("structure")}" title="{$lang.Liste}" {literal}class="{img:'icon_14.png'}"{/literal}>{$lang.Liste}</a>
	<a href="{getLink("structure/add")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>
</div>

{* MENU PROFIL *}
<div id="menu_profil" class="mbmenu">
	<a href="{getLink("utilisateur/editProfil")}" title="{$lang.Edition}" {literal}class="{img:'profile.png'}"{/literal}>{$lang.Edition}</a>
	<a href="{getLink("utilisateur/changePassword")}" title="{$lang.Edition}" {literal}class="{img:'key.png'}"{/literal}>{$lang.Changement_de_password}</a>
</div>

{* MENU ADMINISTRATION *}
<div id="menu_administration" class="mbmenu">
	<a href="{getLink("administration/aclIndex")}" title="ACLs" {literal}class="{}"{/literal}>ACLs</a>
	<a href="{getLink("administration/actuIndex")}" title="{$lang.Actualite}" {literal}class="{img:'actualite.png'}"{/literal}>{$lang.Actualite}</a>
	{if $config.joueur_entraineur == 1}<a href="{getLink("entraineur")}" title="{$lang.Entraineurs}" {literal}class="{}"{/literal}>{$lang.Entraineurs}</a>{/if}
	<a href="{getLink("administration/equipeIndex")}" title="{$lang.Equipe}" {literal}class="{}"{/literal}>{$lang.Equipe}</a>
	{if $config.joueur_suivi_scolaire == 1}<a href="{getLink("administration/etabScolaireIndex")}" title="{$lang.Etablissement_scolaire}">{$lang.Etablissement_scolaire}</a>{/if}
	{if $config.multi_site == 1}<a href="{getLink("administration/siteIndex")}" title="{$lang.Site}">{$lang.Site}</a>{/if}
	{if $config.joueur_suivi_scolaire == 1}<a href="{getLink("administration/matiereIndex")}" title="ACLs" {literal}class="{}"{/literal}>{$lang.Matiere}</a>{/if}
    <a href="{getLink("administration/organigrammeIndex")}" title="{$lang.Organigramme}" {literal}class="{img:'organigramme.png'}"{/literal}>{$lang.Organigramme}</a>
	<a href="{getLink("administration/setting")}" title="{$lang.Preferences}" {literal}class="{img:'preferences.png'}"{/literal} >{$lang.Preferences}</a>
	{if $config.sport_champ_structure == 1}<a href="{getLink("structure")}" title="{$lang.Structures}" {literal}class="{}"{/literal}>{$lang.Structures}</a>{/if}
	<a href="{getLink("administration/programmationTypeIndex")}" title="{$lang.Type_de_programmation}" {literal}class="{img:''}"{/literal} >{$lang.Type_de_programmation}</a>
	<a href="{getLink("administration/userIndex")}" title="{$lang.Utilisateurs}" {literal}class="{menu:'sub_menu_administration_utilisateurs',img:'users.png'}"{/literal}>{$lang.Utilisateurs}</a>
    <a href="#" title="" {literal}class="{menu:'sub_menu_administration_system', img:'system.png'}"{/literal}>System</a>
</div>

	<div id="sub_menu_administration_utilisateurs" class="mbmenu">
		<a href="{getLink("administration/userAdd")}" title="{$lang.Nouveau}" {literal}class="{img:'24-tag-add.png'}"{/literal}>{$lang.Nouveau}</a>
	</div>
    
    <div id="sub_menu_administration_system" class="mbmenu">
        <a href="{getLink("administration/errorPhpListe")}" title="" {literal}class="{img:'php.png'}"{/literal}>Error PHP</a>
        <a href="{getLink("administration/connexionListe")}" title="" {literal}class="{img:'log.png'}"{/literal}>History of connection</a>
        <a href="{getLink("administration/resizeImageJoueur")}" title="" {literal}class="{}"{/literal}>Resize images</a>
    </div>
{/strip}	

{elseif $InfosInstall.i_show_pub == 1 || $InfosInstall.i_show_pub_login == 1}
	<div class="blok">
		{$InfosInstall.pubs.2.code}
	</div>
{/if}