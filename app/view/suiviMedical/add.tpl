<script>
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAddSuivi").validationEngine();
});
</script>
<form method="post" action="{getLink("suiviMedical/add/{$joueur_id}")}" id="formAddSuivi" class="form">
	<dl>
		<dt><label for="date_medical">{$lang.Date} :</label></dt>
		<dd><input type="text" name="suivi[date_medical]" id="date_medical" placeholder="JJ/MM/AAAA" class="validate[required[date]]" size="10"/></dd>
	</dl>
	<dl>
		<dt><label for="">{$lang.Type} :</label></dt>
		<dd>
			<select name="suivi[type]" id="type" class="validate[required]">
				<option value=""></option>
				<option value="blessure">{$lang.Blessure}</option>
				<option value="maladie">{$lang.Maladie}</option>
				<option value="psychologique">{$lang.Psychologique}</option>
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label for="">{$lang.Suivi} :</label></dt>
		<dd><textarea name="suivi[suivi]" cols="40" rows="4" class="validate[required]" id="suivi"></textarea></dd>
	</dl>
	<dl>
		<dt><label for="">{$lang.Suivi_prive} :</label></dt>
		<dd><textarea name="suivi[suivi_prive]" cols="40" rows="4"></textarea></dd>
	</dl>
	<dl>
		<dt><label for="">{$lang.Date_reprise} :</label></dt>
		<dd><input type="text" name="suivi[dispo_rugby]" id="dispo_rugby" size="10" class="validate[custom[date]]"/><span>{$lang.Laisser_vide_si_non_suspendu}</span></dd>
	</dl>
	<dl>
		<dt><label for="">{$lang.Date_reprise_musculation} :</label></dt>
		<dd><input type="text" name="suivi[dispo_muscu]" id="dispo_muscu" size="10" class="validate[custom[date]]"/><span>{$lang.Laisser_vide_si_non_suspendu}</span></dd>
	</dl>
	<div class="form_submit center"><input type="submit" value="{$lang.Enregistrer}" /></div>
</form>
<script type="text/javascript">
<!--
	$(function() {
		$( "#dispo_rugby" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$( "#dispo_muscu" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$( "#date_medical" ).datepicker({ dateFormat: 'dd/mm/yy' });
	});
//-->
</script>