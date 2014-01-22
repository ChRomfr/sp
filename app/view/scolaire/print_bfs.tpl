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
	<!-- Annee -->
	<tr>
		<td style="width:25%;">{$lang.Annee}</td>
		<td>{$Bfs.annee}</td>
	</tr>
		
	<!-- Date du BFS -->
	<tr>
		<td>{$lang.Date}</td>
		<td>{$Bfs.date_bfs}</td>
	</tr>

	<!-- Liste des formations en cour ... -->
	<tr>
		<td>{$lang.Formation}</td>
		<td>				
			{foreach $Formations as $Row}
			{if $Row.id == $Bfs.formation_id}{$Row.nom}{/if}
			{/foreach}		
		</td>
	</tr>

	<!-- Attendu -->
	<tr>
		<td>{$lang.Attendu}</td>
		<td>{$Bfs.attendu|nl2br}</td>
	</tr>

	<!-- Modifie -->
	<tr>
		<td>{$lang.Modifie}</td>
		<td>{$Bfs.modifie|nl2br}</td>
	</tr>

	<!-- Resultat -->
	<tr>
		<td>{$lang.Resultat}</td>
		<td>{$Bfs.resultat|nl2br}</td>
	</tr>

	<!-- Matiere synthese -->
	<tr>
		<td><label for="matieres">{$lang.Matieres} :</label></td>
		<td>
			<table>
				<tr>
					<td>{$lang.Matiere}</td>
					<td>{$lang.Note}</td>
				</tr>
				<!-- Listing des matieres -->
				{foreach $Matieres as $Row name=foo}
				<tr>
					<td>{$Row.matiere}</td>
					<td>
						{foreach $Notes as $data}
							{if $data.matiere_id == $Row.id}{$data.note}{/if}
						{/foreach}
					</td>
				</tr>
				{/foreach}
			</table>
		</td>
	</tr>

	<!-- Remarque -->
	<tr>
		<td>{$lang.Remarque}</td>
		<td>{$Bfs.remarque|nL2br}</td>
	</tr>

	<!-- Avis equipe pedago -->
	<tr>
		<td>{$lang.Avis_equipe_pedagogique|nl2br}</td>
		<td>{$Bfs.avis_equipe_peda|nl2br}</td>
	</tr>
</table>
</body>
</html>