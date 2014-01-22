{strip}<tr>
	<td>
		<select name="seance[exo][{$Ligne}][exercice_id]">
			<option></option>
			{foreach $Exercices as $Row}
			<option value="{$Row.id}">{$Row.nom}</option>
			{/foreach}
		</select>
	</td>
	<td class="center"><input type="text" name="seance[exo][{$Ligne}][poids]" size="3" />%</td>
	<td class="center"><input type="text" name="seance[exo][{$Ligne}][repetition]" size="3" /></td>
	<td class="center"><input type="text" name="seance[exo][{$Ligne}][serie]" size="3" /></td>
	<td class="center"><img src="{$config.url}{$config.url_dir}web/images/delete.png" class="delete" /></td>
</tr>{/strip}