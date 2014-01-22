<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/actuIndex")}" title="">{$lang.Actualite}</a>&nbsp;>>&nbsp;
	{$lang.Nouvelle}
</div>

<form method="post" action="{getLink("administration/actuAdd")}" class="form" id="formAdd">
	<h1>{$lang.Nouvelle}</h1>
	<dl>
		<dt><label for="titre">{$lang.Titre} :</label></dt>
		<dd><input type="text" name="actu[titre]" size="50" class="validate[required]" required id="titre" /></dd>
	</dl> 
	<dl>
		<dt><label for="contenu">{$lang.Contenu} :</label></dt>
		<dd><textarea rows="5" cols="50" id="contenu" name="actu[contenu]" required class="validate[required]"></textarea></dd>
	</dl>
	<div class="center">
		<input type="hidden" name="actu[categorie_id]" value="0" />
		<input type="hidden" name="actu[auteur_id]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="actu[creat_on]" value="{$smarty.now}" />
		<input type="hidden" name="actu[edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>