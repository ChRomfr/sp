<!--
Chargement du modele
file : cycle_seance_exercice_send_modele.tpl
-->
{strip}<h1>{$lang.Seance} : {$seance_number}</h1>

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

{* START Liste des exercices *}
	<table class="tadmin" id="exercice_seance_{$seance_number}">
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
		{foreach $Exercices as $Row name=exo}
		<tr>
			<td><input type="hidden" name="cycle[seance][{$seance_number}][exo][{$smarty.foreach.exo.iteration}][exercice_id]" value="{$Row.exercice_id}" />{$Row.exercice_nom}</td>
			<td><input type="text" name="cycle[seance][{$seance_number}][exo][{$smarty.foreach.exo.iteration}][poids]" value="{$Row.poids}" size="3"/>%</td>
			<td><input type="text" name="cycle[seance][{$seance_number}][exo][{$smarty.foreach.exo.iteration}][repetition]" value="{$Row.repetition}" size="3"/></td>
			<td><input type="text" name="cycle[seance][{$seance_number}][exo][{$smarty.foreach.exo.iteration}][serie]" value="{$Row.serie}" size="3"/></td>
			<td class="center"><img src="{$config.url}{$config.url_dir}web/images/delete.png" class="delete" /></td>
		</tr>
		{/foreach}
		</tbody>
	</table>
	<br/>
	<div class="center">
		<a href="javascript:addLigneSeance{$seance_number}();" title="{$lang.Ajouter_exercice}" class="submit">{$lang.Ajouter_exercice}</a>	
	</div>
{* END Liste des exercices *}

<br/>

{* START Nom & Description *}
<dl>
	<dt><label>{$lang.Nom} :</label></dt>
	<dd><input type="text" name="cycle[seance][{$seance_number}][modele_nom]" id="cycle_nom_seance_{$seance_number}" class="validate[required]" value="{$Seance.nom}" size="50" /></dd>
</dl>
<dl>
	<dt><label>{$lang.Description} :</label></dt>
	<dd><textarea cols="50" rows="3" name="cycle[seance][{$seance_number}][description]" id="">{$Seance.description}</textarea></dd>
</dl>
{* END Nom & Description *}

<br/>{/strip}