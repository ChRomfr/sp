<form method="post" action="{getLink("test/addJoueurInTest/{$Test.id}")}" id="formAddJoueur" class="form">
	<dl>
		<dt><label for="joueur_id">{$lang.Joueur} :</label></dt>
		<dd>
			<select name="resultat[joueur_id]" id="joueur_id" required class="validate[required]">
				<option></option>
				{foreach $Joueurs as $Row}
				<option value="{$Row.id}">{$Row.prenom} {$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	{foreach $Exercices as $Row}
	<dl>
		<dt><label for="exo_{$Row.id}">{$Row.nom}</label></dt>
		<dd>
			<input type="hidden" name="resultat[exo_{$Row.id}][exercice_id]" value="{$Row.id}" />
			<input type="text" name="resultat[exo_{$Row.id}][resultat]" value="" size="5" />
		</dd>
	</dl>
	{/foreach}
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
<form>