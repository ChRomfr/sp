<script type="text/javascript">
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formEditFormation").validationEngine();
});
</script>

<form method="post" class="form" action="{getLink("bulletin/formationEdit/{$Formation.id}")}" id="formEditFormation">
	<h1>{$lang.Nouvelle_formation}</h1>
	<!-- Choix etablissement -->
	{if count($Etabs) > 0}
	<dl>
		<dt><label for="etablissement_id">{$lang.Etablissement} :</label></dt>
		<dd>
			<select name="formation[etablissement_id]" id="etablissement_id">
				<option></option>
				{foreach $Etabs as $Row}
				<option value="{$Row.id}" {if $Formation.etablissement_id == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>	
	{/if}
	
	<dl>
		<dt><label for="formation">{$lang.Formation} :</label></dt>
		<dd><input type="text" name="formation[nom]" id="formation" size="50" class="validate[required]" value="{$Formation.nom}" /></dd>
	</dl>
	
	<dl>
		<dt><label for="description">{$lang.Description} :</label></dt>
		<dd><textarea name="formation[description]" id="description" rows="4" cols="40">{$Formation.description}</textarea></dd>
	</dl>
	
	<!-- RESULTAT -->
	<dl>
		<dt><label for="resultat">{$lang.Resultat} :</label></dt>
		<dd>
			<select name="formation[resultat]" id="resultat">
				<option value="0" {if $Formation.resultat == 0}selected="selected"{/if}>{$lang.En_cour}</option>
				<option value="1" {if $Formation.resultat == 1}selected="selected"{/if}>{$lang.Reussie}</option>
				<option value="2" {if $Formation.resultat == 2}selected="selected"{/if}>{$lang.Echec}</option>
			</select>
		</dd>
	</dl>
	
	<!-- BILAN -->
	<dl>
		<dt><label for="bilan">{$lang.Bilan} :</label></dt>
		<dd><textarea name="formation[bilan]" id="bilan" rows="4" cols="40">{$Formation.bilan}</textarea></dd>
	</dl>
	
	<!-- Duree -->
	<dl>
		<dt><label for="duree">{$lang.Duree} :</label></dt>
		<dd>
			<select name="formation[duree]" id="duree">
				<option></option>
				<option value="1" {if $Formation.duree == 1}selected="selected"{/if}>1</option>
				<option value="2" {if $Formation.duree == 2}selected="selected"{/if}>2</option>
				<option value="3" {if $Formation.duree == 3}selected="selected"{/if}>3</option>
				<option value="4" {if $Formation.duree == 4}selected="selected"{/if}>4</option>
				<option value="5" {if $Formation.duree == 5}selected="selected"{/if}>5</option>
			</select>
		</dd>
	</dl>
	
	<!-- Date -->
	<dl>
		<dt><label for="date_debut">{$lang.Date_debut}* :</label></dt>
		<dd><input type="text" name="formation[date_debut]" id="date_debut" class="validate[required,custom[date]]" value="{$Formation.timestamp_debut|date_format:$config.format_date_day}"/></dd>
	</dl>
	<dl>
		<dt><label for="date_fin">{$lang.Date_fin}* :</label></dt>
		<dd><input type="text" name="formation[date_fin]" id="date_fin" class="validate[custom[date]]" value="{$Formation.timestamp_fin|date_format:$config.format_date_day}"/></dd>
	</dl>
	
	<div class="form_submit center">    
		<input type="hidden" name="formation[id]" value="{$Formation.id}" />
		<input type="hidden" name="formation[sportif_id]" value="{$Formation.sportif_id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>

<script type="text/javascript">
<!--
	$(function() {
		$( "#date_debut" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_debut" ).datepicker( "option", "showAnim", "clip" );
		$( "#date_fin" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_fin" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>