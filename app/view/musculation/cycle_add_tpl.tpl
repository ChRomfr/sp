<dl>
	<dt><label for="nom">{$lang.Nom} :</label></dt>
	<dd><input type="text" name="cycle[nom]" id="nom" class="validate[required]" size="60" value="{$tpl.nom}" /></dd>
</dl>
<dl>
	<dt><label for="description">{$lang.Description} :</label></dt>
	<dd><textarea cols="50" rows="3" name="cycle[description]" id="description" class="validate[required]">{$tpl.description}</textarea></dd>
</dl>
 
<dl>
	<dt><label for="date_debut">{$lang.Date_debut} :</label></dt>
	<dd><input type="text" name="cycle[date_debut]" id="date_debut" class="validate[required,custom[date]]" size="10" /></dd>
</dl>
<dl>
	<dt><label for="date_fin">{$lang.Date_fin} :</label></dt>
	<dd><input type="text" name="cycle[date_fin]" id="date_fin" class="validate[required,custom[date]]" size="10" /></dd>
</dl>
<table class="tadmin" style="width:100%">
	<thead>
		<tr>
			<td>{$lang.Exercice}</td>
			<td>{$lang.Poids}</td>
			<td>{$lang.Repetition}</td>
			<td>{$lang.Serie}</td>
		</tr>
	</thead>
	<tbody>
	{foreach $Exercices as $Row}
	<tr>
		<td>{$Row.nom} <input type="hidden" name="exercice[{$Row.exercice_id}][exercice_id]" value="{$Row.exercice_id}" /></td>
		<td><input type="text" name="exercice[{$Row.exercice_id}][poid]" /></td>
		<td><input type="text" name="exercice[{$Row.exercice_id}][repetition]" value="{$Row.repetition}" /></td>
		<td><input type="text" name="exercice[{$Row.exercice_id}][serie]" value="{$Row.serie}" /></td>
	</tr>
	{/foreach}
	</tbody>
</table>
<div class="form_submit center">        
	<br/>
	<br/>
	<input type="hidden" name="cycle[joueur_id]" value="{$joueur_id}" />
	<input type="submit" value="{$lang.Enregistrer}" />
</div>