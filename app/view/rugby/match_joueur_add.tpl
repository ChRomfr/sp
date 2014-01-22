<tr>
	<td>
		<select name="match[joueur][{$i_joueur}][joueur_id]">
			<option></option>
			{foreach $Joueurs as $Joueur}
			<option value="{$Joueur.id}">{$Joueur.nom} {$Joueur.prenom}</option>
			{/foreach}
		</select>
	</td>
	<td>
		<select name="match[joueur][{$i_joueur}][equipe]">
			<option></option>
			<option value="A">A</option>
			<option value="B">B</option>
		</select>	
	</td>
	<td><input type="text" name="match[joueur][{$i_joueur}][temps_jeu]" size="3" />&nbsp;min</td>
	<td><input type="text" name="match[joueur][{$i_joueur}][poste]" /></td>
	<td><input type="text" name="match[joueur][{$i_joueur}][points]" size="3" /></td>
	<td><textarea name="match[joueur][{$i_joueur}][commentaire]" rows="3" cols="40"></textarea></td>
</tr>
