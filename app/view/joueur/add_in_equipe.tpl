<form method="post" action="{getLink("joueur/addInEquipe")}" id="formAddInEquipe" class="form">
	<dl>
		<dt><label for="equipe_id">{$lang.Equipe} :</label></dt>
		<dd>
			<select name="equipe[equipe_id]" id="equipe_id">
				<option></option>
				{foreach $Equipes as $Row}
				<option value="{$Row.id}">{$Row.nom}{if !empty($Row.structure)} - {$Row.structure}{/if}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	<div class="center">
		<input type="hidden" name="equipe[joueur_id]" value="{$Joueur_id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>