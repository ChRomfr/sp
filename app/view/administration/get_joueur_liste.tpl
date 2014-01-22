<dl>
	<dt><label for="id_liaison">{$lang.Joueur} :</label></dt>
	<dd>
		<select name="user[id_liaison]" id="id_liaison" required>
			<option></option>
			{foreach $Joueurs as $Row}
			<option value="{$Row.id}">{$Row.nom} {$Row.prenom}</option>
			{/foreach}
		</select>
	</dd>
</dl>