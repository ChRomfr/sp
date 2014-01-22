<script type="text/javascript">
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAddSuivi").validationEngine();
});
</script>

<form method="post" class="form" action="{getLink("bulletin/suiviAdd/{$Trimestre.id}")}" id="formAddSuivi">
	<h1>{$lang.Nouveau_suivi} : {$Trimestre.num} {$Trimestre.annee}</h1>
	<dl>
		<dt><label for="date_suivi">{$lang.Date}* :</label></dt>
		<dd><input type="text" name="suivi[date_suivi]" id="date_suivi" class="validate[required,custom[date]]"/></dd>
	</dl>
	<dl>
		<dt><label for="observation_etablissement">{$lang.Observation_etablissement} :</label></dt>
		<dd><textarea name="suivi[observation_etablissement]" id="observation_etablissement" rows="4" cols="40"></textarea></dd>
	</dl>
	<dl>
		<dt><label for="observation_structure">{$lang.Observation_structure} :</label></dt>
		<dd><textarea name="suivi[observation_structure]" id="observation_structure" rows="4" cols="40"></textarea></dd>
	</dl>
	<dl>
		<dt><label for="remarque">{$lang.Remarque} :</label></dt>
		<dd><textarea name="suivi[remarque]" id="remarque" rows="4" cols="40"></textarea></dd>
	</dl>
	<div class="form_submit center">    
		<input type="hidden" name="suivi[add_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="suivi[edit_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="suivi[add_on]" value="{$smarty.now}" />
		<input type="hidden" name="suivi[edit_on]" value="{$smarty.now}" />
		<input type="hidden" name="suivi[trimestre_id]" value="{$Trimestre.id}" />	
		<input type="hidden" name="suivi[sportif_id]" value="{$Trimestre.joueur_id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>

<script type="text/javascript">
<!--
	$(function() {
		$( "#date_suivi" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_suivi" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>