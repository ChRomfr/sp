<form class="form" id="formAddMatiere" method="post" action="{getLink("administration/matiereAdd")}" >
	<dl>
		<dt><label for="matiere">{$lang.Matiere} :</label></dt>
		<dd><input type="text" name="matiere[matiere]" id="matiere" class="validate[required]" required /></dd>
	</dl>
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>