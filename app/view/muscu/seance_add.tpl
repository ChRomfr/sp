<script type="text/javascript">
<!--
	jQuery(document).ready(function(){
	    
		// Code JQUERY suppression ligne a la vole
		$('td img.delete').live('click', function(){
			$(this).parent().parent().remove();
		});	    
	});
	
	var nb_exo = 0;
	
	{if isset($Exos) && !empty($Exos)}
	nb_exo = {$NbExos};
	{/if}	
	
	function addLigneSeance(){	
		
		$.get(
		'{getLink("muscu/getLigneForTabExo2")}',{literal}
		{nb_exo: nb_exo, nohtml:'nohtml'},
		function(data){ $("#exercice_seance").append(data); }
		)
		nb_exo = nb_exo + 1;
		{/literal}
	}	
//-->	
</script>{strip}
<form method="post" class="form" action="{getLink("muscu/seanceAdd")}">
	<h1>{$lang.Nouveau_modele_de_seance} :</h1>
	
	{* START Nom & Description *}
	<dl>
		<dt><label>{$lang.Nom} :</label></dt>
		<dd><input type="text" name="seance[nom]" id="cycle_nom_seance" class="validate[required]" /></dd>
	</dl>
	<dl>
		<dt><label>{$lang.Description} :</label></dt>
		<dd><textarea cols="50" rows="3" name="seance[description]" id=""></textarea></dd>
	</dl>
	{* END Nom & Description *}
		
	{* START Liste des exercices *}
	<table class="tadmin" id="exercice_seance">
		<thead>
			<tr>
				<td>{$lang.Exercice}</td>
				<td>{$lang.Poids}</td>
				<td>{$lang.Repetition}</td>
				<td>{$lang.Serie}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{if isset($Exos) && !empty($Exos)}
				{foreach $Exos as $Exo name=foo}
				<tr>
					<td>
						<select name="seance[exo][{$smarty.foreach.foo.iteration}][exercice_id]">
							<option></option>
							{foreach $Exercices as $Row}
							<option value="{$Row.id}" {if $Exo.id == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
							{/foreach}
						</select>
					</td>
					<td class="center"><input type="text" name="seance[exo][{$smarty.foreach.foo.iteration}][poids]" size="3" />%</td>
					<td class="center"><input type="text" name="seance[exo][{$smarty.foreach.foo.iteration}][repetition]" size="3" /></td>
					<td class="center"><input type="text" name="seance[exo][{$smarty.foreach.foo.iteration}][serie]" size="3" /></td>
					<td class="center"><img src="{$config.url}{$config.url_dir}web/images/delete.png" class="delete" /></td>
				</tr>
				{/foreach}
			{/if}
		</tbody>
	</table>	
	{* END Liste des exercices *}
	<br/>
	<!-- Bouton ajout exercice -->
	<div class="center">
		<a href="javascript:addLigneSeance();" title="{$lang.Ajouter_exercice}" class="submit">{$lang.Ajouter_exercice}</a>	
	</div>
	
	<br/><br/>
	<div class="center">
		<input type="hidden" name="seance[modele]" value="1" />
		<input type="hidden" name="token" value="{$smarty.session.token}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>{/strip}