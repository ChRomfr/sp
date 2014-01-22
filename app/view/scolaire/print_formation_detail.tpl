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
        '{getLink("joueur/ajaxGetEnTetePourImpression/{$Formation.sportif_id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#enTete').html(data); }
    )
    {/literal}
}	
getEnTete();
</script>
	
<div id="enTete"></div>
<h1>{$lang.Formation}</h1>
<table class="tadmin">
	<tr>
		<td>{$lang.Etablissement} :</td>
		<td>{$Formation.etablissement}</td>		
	</tr>	
	
	<tr>
		<td>{$lang.Formation} :</label></td>
		<td>{$Formation.nom}</td>
	</tr>
	
	<tr>
		<td>{$lang.Description} :</td>
		<td>{$Formation.description|nl2br}</td>
	</tr>
	
	<!-- RESULTAT -->
	<tr>
		<td><label for="resultat">{$lang.Resultat} :</label></td>
		<td>		
			{if $Formation.resultat == 0}{$lang.En_cour}
			{elseif $Formation.resultat == 1}{$lang.Reussie}
			{elseif $Formation.resultat == 2}{$lang.Echec}
			{/if}
		</td>
	</tr>
	
	<!-- BILAN -->
	<tr>
		<td>{$lang.Bilan} :</td>
		<td>{$Formation.bilan|nl2br}</td>
	</tr>
	
	<!-- Duree -->
	<tr>
		<td><label for="duree">{$lang.Duree} :</label></td>
		<td>
			{if $Formation.duree == 1}1
			{elseif $Formation.duree == 2}2
			{elseif $Formation.duree == 3}3
			{elseif $Formation.duree == 4}4
			{elseif $Formation.duree == 5}5
			{/if}
		</td>
	</tr>
	
	<!-- Date -->
	<tr>
		<td>{$lang.Date_debut} :</td>
		<td>{$Formation.timestamp_debut|date_format:$config.format_date_day}</td>
	</tr>
	<tr>
		<td>{$lang.Date_fin} :</label></td>
		<td>{$Formation.timestamp_fin|date_format:$config.format_date_day}</td>
	</tr>
</table>
	