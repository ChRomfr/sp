<script type="text/javascript">
<!--
function deleteLigne( ligne ){
	$("tr#"+ligne).remove();
}
//-->
</script>
{strip}
{foreach $Exercices as $Row}
<h3>{$Row.ME_NOM}</h3>
<table class="tadmin">
	<thead>
		<tr>
			<td>{$lang.Joueur}</td>
			<td>{$lang.Poids}</td>
			<td>{$lang.Repetition}</td>
			<td>{$lang.Serie}</td>
			<td></td>
		</tr>
	</thead>
	<tbody>
	{foreach $Joueurs as $Data}
		<tr id="ligne_{$Row.id}_{$Data.id}">
			<td>
				{$Data.nom} {$Data.prenom}
				<input type="hidden" name="exercice[{$Row.id}][{$Data.id}][joueur_id]" value="{$Data.id}" />
				<input type="hidden" name="exercice[{$Row.id}][{$Data.id}][exercice_id]" value="{$Row.id}" />
			</td>
			<td><input type="text" name="exercice[{$Row.id}][{$Data.id}][poids]" value="{$Row.poids}" size="3"/></td>
			<td><input type="text" name="exercice[{$Row.id}][{$Data.id}][repetition]" value="{$Row.repetition}" size="3"/></td>
			<td><input type="text" name="exercice[{$Row.id}][{$Data.id}][serie]" value="{$Row.serie}" size="3"/></td>
			<td class="center"><a href="javascript:deleteLigne('ligne_{$Row.id}_{$Data.id}');">X</a></td>
		</tr>
	{/foreach}
	</tbody>
</table>
{/foreach}
{/strip}