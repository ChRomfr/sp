<form method="post" action="{getLink("ressentie/ajaxGetFormEntraineurInFiche/{$sequence_id}")}" id="formAddNoteEntrainteur" class="form">
	<h1>{$lang.Ressentie}</h1>
	<dl>
		<dt><label for="ressentie_entraineur">{$lang.Ressentie} :</label></dt>
		<dd>
			<select name="note[note]" id="ressentie_entraineur" required>
				<option></option>
				{for $it=1 to $ECHELLE}
                <option value="{$it}">{$it}</option>
                {/for}
			</select>
		</dd>
	</dl>
	<div class="center">
		<input type="hidden" name="note[user_id]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="note[sequence_id]" value="{$sequence_id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>