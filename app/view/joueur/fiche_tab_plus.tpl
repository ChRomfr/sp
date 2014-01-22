{strip}
<div class="well">
    <!-- On affiche les champs si present dans la base -->
	{$DataSup}
    
	<br/>
  <br/>
    
    <!-- Affichage infos ajout et edition date pour suivi -->
	<div><span>{$lang.Ajoute_le} <strong>{$Joueur.creat_on|date_format:$config.format_date}</strong> {$lang.par} <strong>{$Joueur.creat_auteur}</strong></span></div>
	{if $Joueur.creat_on != $Joueur.edit_on}
	<div><span>{$lang.Modifie_le} <strong>{$Joueur.edit_on|date_format:$config.format_date}</strong> {$lang.par} <strong>{$Joueur.edit_auteur}</strong></span></div>
	{/if}
	
    <!-- Affichage des infos sur le compte + bouton si en version full -->
    {if $InfosInstall.i_type == 'full'}
      {if $Account == 0}
          <br/>
          <div>{if $smarty.session.utilisateur.type == 'admin'}<a href="{getLink("administration/userCreatSportifAccount/{$Joueur.id}")}" class="submit">{$lang.Creer_un_utilisateur}</a>{/if}</div>
      {/if}
    {/if}
</div>
{/strip}