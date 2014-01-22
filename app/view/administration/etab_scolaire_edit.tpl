<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAdd").validationEngine();
});
//-->
</script>
<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/etabScolaireIndex")}" title="">{$lang.Etablissement_scolaire}</a>&nbsp;>>&nbsp;
	{$lang.Edition}
</div>

<form method="post" target="" id="formAdd" class="form">

	<dl>
		<dt><label for="etab_nom">{$lang.Nom} :</label></dt>
		<dd><input type="text" name="etab[nom]" id="etab_nom" value="{$Etab->nom}" class="validate[required]"/></dd>
	</dl>
	<dl>
		<dt><label for="etab_adresse">{$lang.Adresse} :</label></dt>
		<dd><textarea name="etab[adresse]" id="etab_adresse" rows="3">{$Etab->adresse}</textarea></dd>
	</dl>
	<dl>
		<dt><label for="etab_code_postal">{$lang.Code_postal} :</label></dt>
		<dd><input type="text" name="etab[code_postal]" id="etab_code_postal" value="{$Etab->code_postal}"/></dd>
	</dl>
	<dl>
		<dt><label for="etab_ville">{$lang.Ville} :</label></dt>
		<dd><input type="text" name="etab[ville]" id="etab_ville" value="{$Etab->ville}" /></dd>
	</dl>
	<dl>
		<dt><label for="etab_telephone">{$lang.Telephone} :</label></dt>
		<dd><input type="text" name="etab[telephone]" id="etab_ville" value="{$Etab->telephone}"/></dd>
	</dl>
	<dl>
		<dt><label for="etab_url_portail_note">{$lang.Adresse_portail_note} :</label></dt>
		<dd><input type="url" name="etab[url_portail_note]" id="etab_url_portail_note" value="{$Etab->url_portail_note}" /></dd>
	</dl>
	<div class="center">
		<input type="hidden" name="etab[id]" value="{$Etab->id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>