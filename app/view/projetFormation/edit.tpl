<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});
</script>
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("joueur/index")}" title="{$lang.Joueur}">{$lang.Joueur}</a>&nbsp;>>&nbsp;
	<a href="{getLink("joueur/fiche/{$Joueur->id}")}" title="{$Joueur->prenom} {$Joueur->nom}">{$Joueur->prenom} {$Joueur->nom}</a>&nbsp;>>&nbsp;
	{$lang.Projet_formation}
</div>

<form method="post" id="formAdd" class="form">
	<h1>{$lang.Projet_formation}</h1>
	<dl>
		<dt><label for="year">{$lang.Annee} :</label></dt>
		<dd>
			<select name="projet[year]" id="year" class="validate[required]" required>
				<option></option>
				<option value="1" {if $projet->year == 1}selected="selected"{/if}>1</option>
				<option value="2" {if $projet->year == 2}selected="selected"{/if}>2</option>
				<option value="3" {if $projet->year == 3}selected="selected"{/if}>3</option>
			</select>
		</dd>
	</dl>
	
	<dl>
		<dt><label for="terme">{$lang.Terme} :</label></dt>
		<dd>
			<select name="projet[terme]" id="terme" class="validate[required]" required>
				<option></option>
				<option value="1" {if $projet->terme == 1}selected="selected"{/if}>{$lang.Court}</option>
				<option value="2" {if $projet->terme == 2}selected="selected"{/if}>{$lang.Moyen}</option>
				<option value="3" {if $projet->terme == 3}selected="selected"{/if}>{$lang.Long}</option>
			</select>
		</dd>
	</dl>

	<dl>
		<dt><label for="intitule">{$lang.Intitule} :</label></dt>
		<dd><input type="text" name="projet[intitule]" id="intitule" required class="validate[required]" size="50" value="{$projet->intitule}"/>
	</dl>

	<dl>
		<dt><label for="observation">{$lang.Observations} :</label></dt>
		<dd><textarea name="projet[observation]" cols="50" rows="4" required class="validate[required]">{$projet->observation}</textarea></dd>
	</dl>

	<dl>
		<dt><label for="projection_cycle">{$lang.Projection_cycle} :</label></dt>
		<dd><textarea name="projet[projection_cycle]" cols="50" rows="4" required class="validate[required]">{$projet->projection_cycle}</textarea></dd>
	</dl>

	<div class="center">
		<input type="hidden" name="projet[joueur_id]" value="{$projet->joueur_id}" />
		<input type="hidden" name="projet[auteur_id]" value="{$projet->auteur_id}" />
		<input type="hidden" name="projet[creat_on]" value="{$projet->creat_on}" />
		<input type="hidden" name="projet[edit_on]" value="{$smarty.now}" />
		<input type="hidden" name="projet[id]" value="{$projet->id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>

</form>