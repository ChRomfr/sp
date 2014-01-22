<ul class="breadcrumb">
	<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li><a href="{getLink("joueur/index")}" title="{$lang.Joueur}">{$lang.Joueur}</a><span class="divider">/</span></li>
	<li><a href="{getLink("joueur/fiche/{$Joueur->id}")}" title="{$Joueur->prenom} {$Joueur->nom}">{$Joueur->prenom} {$Joueur->nom}</a><span class="divider">/</span></li>
	<li>{$lang.Projet_formation}</li>
</ul>

<form method="post" id="formAdd" class="form well">
	<h1>{$lang.Projet_formation}</h1>
	<dl>
		<dt><label for="year">{$lang.Annee} :</label></dt>
		<dd>
			<select name="projet[year]" id="year" class="validate[required]" required>
				<option></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
		</dd>
	</dl>
	
	<dl>
		<dt><label for="terme">{$lang.Terme} :</label></dt>
		<dd>
			<select name="projet[terme]" id="terme" class="validate[required]" required>
				<option></option>
				<option value="1">{$lang.Court}</option>
				<option value="2">{$lang.Moyen}</option>
				<option value="3">{$lang.Long}</option>
			</select>
		</dd>
	</dl>

	<dl>
		<dt><label for="intitule">{$lang.Intitule} :</label></dt>
		<dd><input type="text" name="projet[intitule]" id="intitule" required class="validate[required]" size="50"/>
	</dl>

	<dl>
		<dt><label for="observation">{$lang.Observations} :</label></dt>
		<dd><textarea name="projet[observation]" cols="50" rows="4" required class="validate[required]"></textarea></dd>
	</dl>

	<dl>
		<dt><label for="projection_cycle">{$lang.Projection_cycle} :</label></dt>
		<dd><textarea name="projet[projection_cycle]" cols="50" rows="4" required class="validate[required]"></textarea></dd>
	</dl>

	<div class="center">
		<input type="hidden" name="projet[joueur_id]" value="{$Joueur_id}" />
		<input type="hidden" name="projet[auteur_id]" value="{$smarty.session.utilisateur.identifiant}" />
		<input type="hidden" name="projet[creat_on]" value="{$smarty.now}" />
		<input type="hidden" name="projet[edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" class="btn btn-primary" />
	</div>

</form>

<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});
</script>