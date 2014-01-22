<script type="text/javascript">
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAddFormation").validationEngine();
});
</script>

<form method="post" class="form" action="{getLink("bulletin/formationAdd/{$Sportif_id}")}" id="formAddFormation">
	<h1>{$lang.Nouvelle_formation}</h1>
	<!-- Choix etablissement -->
	{if count($Etabs) > 0}
	<dl>
		<dt><label for="etablissement_id">{$lang.Etablissement} :</label></dt>
		<dd>
			<select name="formation[etablissement_id]" id="etablissement_id">
				<option></option>
				{foreach $Etabs as $Row}
				<option value="{$Row.id}">{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>	
	{/if}
	
	<dl>
		<dt><label for="formation">{$lang.Formation} :</label></dt>
		<dd><input type="text" name="formation[nom]" id="formation" size="50" class="validate[required]" /></dd>
	</dl>
	
	<dl>
		<dt><label for="description">{$lang.Description} :</label></dt>
		<dd><textarea name="formation[description]" id="description" rows="4" cols="40"></textarea></dd>
	</dl>
	
	<!-- Duree -->
	<dl>
		<dt><label for="duree">{$lang.Duree} :</label></dt>
		<dd>
			<select name="formation[duree]" id="duree">
				<option></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</dd>
	</dl>
	
	<!-- Date -->
	<dl>
		<dt><label for="date_debut">{$lang.Date_debut}* :</label></dt>
		<dd><input type="text" name="formation[date_debut]" id="date_debut" class="validate[required,custom[date]]"/></dd>
	</dl>
	<dl>
		<dt><label for="date_fin">{$lang.Date_fin}* :</label></dt>
		<dd><input type="text" name="formation[date_fin]" id="date_fin" class="validate[custom[date]]"/></dd>
	</dl>
	
	<div class="form_submit center">    
		<input type="hidden" name="formation[resultat]" value="0" />
		<input type="hidden" name="formation[bilan]" value="" />
		<input type="hidden" name="formation[sportif_id]" value="{$Sportif_id}" />
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