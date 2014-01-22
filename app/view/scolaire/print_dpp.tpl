<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/design.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/print.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/design.css" type="text/css" media="print" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/print.css" type="text/css" media="print" />
	{if !empty($js_add)}
		{foreach $js_add as $k => $v}
		<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/{$v}"></script>
		{/foreach}
	{/if}
</head>
<body>
	
<script>
function getEnTete(){
    $.get(
        '{getLink("joueur/ajaxGetEnTetePourImpression/{$Sportif.id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#enTete').html(data); }
    )
    {/literal}
}	
getEnTete();
</script>
	
<div id="enTete"></div>
<h1>{$lang.Definition_projet_professionnel}</h1>
<table class="tadmin">
	<!-- Date du DPP -->
	<tr>
		<td style="width:25%;">{$lang.Date}</td>
		<td>{$Dpp.date_dpp}</td>
	</tr>
	
	<!-- Personnes du cf rencontre -->
	<tr>
		<td>{$lang.Personnes_rencontrees_cf}</td>
		<td>
			<ul>
				{foreach $Personnes as $Row}
				{if $Dpp.personne_cf_1 == $Row.id}<li>{$Row.nom} {$Row.prenom}</li>{/if}
				{/foreach}
				
				{foreach $Personnes as $Row}
				{if $Dpp.personne_cf_2 == $Row.id}<li>{$Row.nom} {$Row.prenom}</li>{/if}
				{/foreach}
				
				{foreach $Personnes as $Row}
				{if $Dpp.personne_cf_3 == $Row.id}<li>{$Row.nom} {$Row.prenom}</li>{/if}
				{/foreach}				
			</ul>
		</td>
	</tr>
	<!-- personne conseil peda -->
	<tr>
		<td>{$lang.Personnes_rencontrees_cp} </td>
		<td>{$Dpp.personne_conseil_ped|nl2br}</td>
	</tr>
	<!-- Liste des formations en cour ... -->
	<tr>
		<td>{$lang.Formation}</td>
		<td>
			{foreach $Formations as $Row}
				{$Row.nom}
			{/foreach}
		</td>
	</tr>
	<!-- Diplome obtenu -->
	<tr>
		<td>{$lang.Diplome_obtenu}</td>
		<td>{$Dpp.diplome_obtenu}</td>
	</tr>
	<!-- Formation effecue -->
	<tr>
		<td>{$lang.Formation_effectuee}</td>
		<td>{$Dpp.formation_effectuee|nl2br}</td>
	</tr>
	<!-- Definition du projet -->
	<tr>
		<td>$lang.Definition_du_projet}</td>
		<td>{$Dpp.definition_projet|nl2br}</td>
	</tr>

	<!-- objectif_plan_formation -->
	<tr>
		<td>{$lang.Objectif}</td>
		<td>{$Dpp.objectif_plan_formation|nl2br}</td>
	</tr>

	<!-- plan 0 -->
	<tr>
		<td>{$lang.Plan_n} 0 :</td>
		<td>{$Dpp.plan_n0|nl2br}</td>
	</tr>

	<!-- plan +1 -->
	<tr>
		<td>{$lang.Plan_n} +1 :</td>
		<td>{$Dpp.plan_n1|nl2br}</td>
	</tr>
</table>