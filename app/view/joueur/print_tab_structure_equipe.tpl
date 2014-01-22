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
        '{getLink("joueur/ajaxGetEnTetePourImpression/{$Joueur->id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#enTete').html(data); }
    )
    {/literal}
}	
</script>
	
	<div id="enTete"></div>
	
	<table class="tadmin" >
		
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
	    <tr><td class="center" colspan="2"><strong>{$lang.Structure}</strong></td></tr>
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
	
	{if isset($EquipesJoueur) && count($EquipesJoueur) >0}
	<h1>{$lang.Equipes}</h1>
	<div class="clear"></div>	
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Equipe}</td>
			</tr>
		</thead>
		<tbody>
		{foreach $EquipesJoueur as $Row}
		<tr>
			<td><a href="javascript:getEquipeDetail({$Row.id});" title="{$lang.Detail}">{$Row.nom}</a></td>
		</tr>
		{/foreach}
		</tbody>
	</table>
	{/if}
	
	{if $config.view_joueur_club == true && $config.sport_champ_structure == 1 && !empty($Joueurs)}
	<h1>{$lang.Joueurs_dans_la_meme_stucture}</h1>
	<table class="tadmin">
		<thead>
			<td>{$lang.Nom}</td>
			<td>{$lang.Prenom}</td>
		</thead>
		<tbody>
			{foreach $Joueurs as $Row}
			<tr>
				<td>{$Row.nom}</td>
				<td>{$Row.prenom}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
	{/if}
		
<script>
getEnTete();
</script>	
</body>
</html>
