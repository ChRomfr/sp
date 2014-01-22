<form class="form" id="formEditMatiere" method="post" action="{getLink("administration/matiereEdit/{$Matiere.id}")}" >
	<dl>
		<dt><label for="matiere">{$lang.Matiere} :</label></dt>
		<dd><input type="text" name="matiere[matiere]" id="matiere" class="validate[required]" required value="{$Matiere.matiere}"/></dd>
	</dl>
	<div class="center">
		<input type="hidden" name="matiere[id]" value="{$Matiere.id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>