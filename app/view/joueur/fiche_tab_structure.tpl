<!-- START view/joueur/fiche_tab_structure.tpl -->
{strip}
<div class="pull-right">
	<a href="{$Helper->getLink("joueur/printTabStructureEquipe/{$Joueur->id}?nohtml&print")}" title="Print" target="_blank"><i class="fa fa-print"></i></a>
</div>
<div class="clearfix"></div>

{if $config.sport_champ_poste == 1 || $config.sport_champ_selection == 1 || $config.sport_champ_structure == 1}
{if !empty($Structure) || !empty($Joueur->poste) || !empty($Joueur->selection)}
<div>
	
	<table class="table table-condensed" >
		
		{if $config.sport_champ_poste == 1}
	    <tr>
	        <th>{$lang.Poste}</th>
	        <td>{$Joueur->poste}</td>
	    </tr>
	    {/if}
	    
	    {if $config.sport_champ_selection == 1}
	    <tr>
	        <th>{$lang.Selection}</th>
	        <td>{$Joueur->selection}</td>
	    </tr>
	    {/if}
	    
	    {if $config.sport_champ_structure == 1 && !empty($Structure)}
		<tr>
			<th>{$lang.Structure}</td>
			<td>{$Structure.nom}</td>
		</tr>
		<tr>
			<th>{$lang.Adresse}</th>
			<td>{$Structure.adresse}<br/>{$Structure.code_postal} {$Structure.ville}</td>
		</tr>
		<tr>
			<th>{$lang.Telephone}</th>
			<td>{$Structure.telephone}</td>
		</tr>
	    	{if $Structure.email != ''}
		<tr>
			<th>{$lang.Email}</th>
			<td>{$Structure.email}</th>
		</tr>
	    	{/if}
	    {/if}
	</table>	
</div>
{/if}{/if}

{* GESTION DES EQUIPES *}
{if isset($Equipes) && count($Equipes) >0}	
	{if $smarty.session.acl.gest_joueur == 1}
	<div class="pull-right">
		<a href="{$Helper->getLink("joueur/addInEquipe?joueur_id={$Joueur->id}&nohtml")}" title="" id="fbformaddequipe"><i class="fa fa-plus"></i></a>
	</div>
	{/if}
	<div class="clearfix"></div>
	
	{if isset($EquipesJoueur) && count($EquipesJoueur) >0}
	<table class="table table-bordered table-striped  table-condensed">
		<caption><h4>{$lang.Equipe}</h4></caption>
		<thead>
			<tr>
				<th>{$lang.Equipe}</th>
				<th>{$lang.Structure}</th>
				{if $smarty.session.acl.gest_joueur == 1}<th></th>{/if}
			</tr>
		</thead>
		<tbody>
		{foreach $EquipesJoueur as $Row}
			<tr>
				<td><a href="{getLink("equipe/ajaxDetail/{$Row.id}?nohtml")}" class="fbequipedetail" title="{$Row.nom}">{$Row.nom}</a></td>
				<td>{$Row.structure}</td>
				{if $smarty.session.acl.gest_joueur == 1}
				<td class="center"><a href="javascript:removeForEquipe({$Row.jeid});"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a></td>                
				{/if}
			</tr>
		{/foreach}
		</tbody>
	</table>
	{else}
	<div class="alert alert-info">	{$lang.Joueur_inscrit_dans_aucune_equipe}</div>
	{/if}
{/if}

{if $config.view_joueur_club == true && $config.sport_champ_structure == 1 && !empty($Joueurs)}
<div>	
	<table class="table table-bordered table-condensed table-striped">
		<caption><h4>{$lang.Joueurs_dans_la_meme_stucture}</h4></caption>
		<thead>
			<th>#</td>
			<th>{$lang.Nom}</th>
			<th>{$lang.Prenom}</th>
		</thead>
		<tbody>
			{foreach $Joueurs as $Row}
			<tr>
				<td>{if $smarty.session.acl.view_all_fiche == true}<a href="{getLink("joueur/fiche/{$Row.id}")}">{/if}{$Row.id}{if $smarty.session.acl.view_all_fiche == true}</a>{/if}</td>
				<td>{$Row.nom}</td>
				<td>{$Row.prenom}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/if}
<div id="diag-form-equipe"></div>
{/strip}
<script type="text/javascript">
<!--
$(document).ready(function() {
    $("a#fbformaddequipe").fancybox();
    $("a.fbequipedetail").fancybox();
});

{if $smarty.session.acl.gest_joueur == 1}
function removeForEquipe(jeid){
	window.location.href = '{getLink("equipe/removeJoueurEquipe/'+ jeid +'")}';
}
{/if}
//-->
</script>
<!-- END view/joueur/fiche_tab_structure.tpl -->