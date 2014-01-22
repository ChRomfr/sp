{*
    FORMULAIRE D EDITION UTILISATEUR
*}

<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formEdit").validationEngine();
});

//-->
</script>{strip}

<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/userIndex")}" title="">{$lang.Utilisateurs}</a>&nbsp;>>&nbsp;
	{$lang.Edition}
</div>

<form method="post" action="" class="form" id="formEdit">
    <h1>{$lang.Edit_user}</h1>
    <dl>
        <dt><label for="identifiant">{$lang.Identifiant} :</label></dt>
        <dd><input type="text"  name="user[identifiant]" id="identifiant" value="{$User.identifiant}"  class="validate[required]" readonly="readonly" requried/></dd>
    </dl>
    <dl>
        <dt><label for="type">{$lang.Account_type} :</label></dt>
        <dd>
            <select name="user[type]" class="validate[required]" id="type" required>
                {foreach $TUAC as $Row}
				<option value="{$Row.value}" {if $User.type == $Row.value}selected="selected"{/if}>{$Row.libelle}</option>
				{/foreach}
            </select>
        </dd>    
    </dl>
     <div id="joueur_liste">
     	{if $User.type == 'joueur'}
     	<dl>
			<dt><label for="id_liaison">{$lang.Joueur} :</label></dt>
			<dd>
				<select name="user[id_liaison]" id="id_liaison" required>
					<option></option>
					{foreach $Joueurs as $Row}
					<option value="{$Row.id}" {if $User.id_liaison == $Row.id}selected="selected"{/if}>{$Row.nom} {$Row.prenom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>   
		{/if}  	
     </div>
    {* ACL de voir le suivi prive dans le dossier medical *}
    <dl>
    	<dt><label for="suivi_medical_show_prive">{$lang.Voir_les_donnes_privees_dans_le_suivi_med} :</label></dt>
    	<dd><input type="checkbox" name="user[suivi_medical_show_prive]" id="suivi_medical_show_prive" {if $User.suivi_medical_show_prive == 1}checked="checked"{/if} /></dd>
    </dl>
    {* ACL droit de commenter le suivi med *}
    <dl>
    	<dt><label for="suivi_medical_add_commentaire">{$lang.Commenter_le_suivi_med} :</label></dt>
    	<dd><input type="checkbox" name="user[suivi_medical_add_commentaire]" id="suivi_medical_add_commentaire" {if $User.suivi_medical_add_commentaire == 1}checked="checked"{/if} /></dd>
    </dl>
    <dl>
        <dt><label for="email">{$lang.Email} :</label></dt>
        <dd><input type="email" name="user[email]" id="email" class="validate[custom[email]]" value="{$User.email}" /></dd>
    </dl>
    <div class="center">
    	<input type="hidden" name="user[id]" value="{$User.id}" id="id" />
		<input type="hidden" id="resultEmail" value="" />
		<input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>{/strip}