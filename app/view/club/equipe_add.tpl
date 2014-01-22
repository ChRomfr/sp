<form method="post" action="{getLink('clubs/equipeAdd')}" id="formAdd" class="form">

	<h1>{$lang.Nouvelle_equipe}</h1>
	
	<dl>
		<dt><label for="name">{$lang.Equipe} :</label></dt>
		<dd><input type="text" name="equipe[e_nom]" id="name" required size="50" class="validate[required]" /></dd>
	</dl>
	
	<dl>
		<dt><label for="description">{$lang.Description} :</label></dt>
		<dd><textarea name="equipe[e_description]" id="description" cols="50"  rows="3"></textarea></dd>
	</dl>
	
	<div class="center">
		<input type="hidden" name="equipe[e_creat_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="equipe[e_edit_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="equipe[e_creat_on]" value="{$smarty.now}" />
		<input type="hidden" name="equipe[e_edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
	
</form>	