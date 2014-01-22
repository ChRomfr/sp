<script>
	
	var ligne_seance_{$seance_number} = 0;	// Correspond au nombre d exercice
	
	function {literal}addLigneSeance{/literal}{$seance_number}{literal}(){{/literal}
	
		ligne_seance_{$seance_number} = ligne_seance_{$seance_number} + 1;
		$.get(
            '{getLink("muscu/getLigneForTabExo")}',{literal}
            {ligne_number: ligne_seance_{/literal}{$seance_number}{literal},seance_number: {/literal}{$seance_number}{literal}, nohtml:'nohtml'},
            function(data){ $("#exercice_seance_{/literal}{$seance_number}{literal}").append(data); }
        )
		{/literal}
	}	
	
	function {literal}loadModel{/literal}{$seance_number}{literal}(){{/literal}
		
		$.get(
            '{getLink("muscu/getModelSeance")}',{literal}
            {seance_id: $("#seance_model_id_{/literal}{$seance_number}{literal}").val(),seance_number: {/literal}{$seance_number}{literal}, nohtml:'nohtml'},
            function(data){ $("#seance_number_{/literal}{$seance_number}{literal}").html(data); }
        )
		{/literal}
		
	}
	
</script>
<form method="post" action="{getLink("muscu/addSeanceInCycle/{$CID}")}">
<div id="seance_number_{$seance_number}">
	<h3>{$lang.Seance} : {$seance_number}</h3>
	
	{* START Model de seance *}
	
		<dl>
			<dt>{$lang.Modeles} : </dt>
			<dd>
				<select id="seance_model_id_{$seance_number}" onchange="loadModel{$seance_number}();" >
					<option value=""></option>
					{foreach $Seances as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
	
	{* END Model de seance *}
	
	{* START Bouton nouvelle seance *}
	<div class="fright"><a href="javascript:addLigneSeance{$seance_number}();" title="{$lang.Ajouter_exercice}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="{$lang.Ajouter_exercice}" /></a></div>
	<div class="clear"></div>
	{* END Bouton nouvelle seance *}
	
	{* START Liste des exercices *}
	<table class="tadmin" id="exercice_seance_{$seance_number}">
		<thead>
			<tr>
				<td>{$lang.Exercice}</td>
				<td>{$lang.Poids}</td>
				<td>{$lang.Repetition}</td>
				<td>{$lang.Serie}</td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>	
	{* END Liste des exercices *}
	
	<br/>
	
	{* Enregistrement en model *}
	<dl>
		<dt><input type="checkbox" name="cycle[seance][{$seance_number}][modele]" value="1" onchange="showInputNameModel{$seance_number}();" /></dt>
		<dd>{$lang.Enregistrer_comme_modele}</dd>
	</dl>
	
	{* START Nom & Description *}
	<dl>
		<dt><label>{$lang.Nom} :</label></dt>
		<dd><input type="text" name="cycle[seance][{$seance_number}][modele_nom]" id="cycle_nom_seance_{$seance_number}" class="validate[required]" /></dd>
	</dl>
	<dl>
		<dt><label>{$lang.Description} :</label></dt>
		<dd><textarea cols="50" rows="3" name="cycle[seance][{$seance_number}][description]" id=""></textarea></dd>
	</dl>
	{* END Nom & Description *}
	
	<br/>
</div>
<div class="center form_submit">
	<input type="submit" value="{$lang.Enregistrer}" />
</div>