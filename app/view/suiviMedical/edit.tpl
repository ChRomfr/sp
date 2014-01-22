{* FORMULAIRE EDITION SUIVI *}
<script>
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formEditSuivi").validationEngine();
});
</script>

<form method="post" action="{getLink("suiviMedical/edit/{$Suivi.id}")}" id="formEditSuivi" class="form">
	<dl>
		<dt><label for="date_medical">{$lang.Date} :</label></dt>
		<dd><input type="text" name="suivi[date_medical]" id="date_medical" placeholder="JJ/MM/AAAA" class="validate[required[date]]" size="10" value="{$Suivi.date_medical|date_format:$config.format_date_day}"/></dd>
	</dl>
	<dl>
		<dt><label for="type">{$lang.Type} :</label></dt>
		<dd>
			<select name="suivi[type]" id="type" class="validate[required]">
				<option value=""></option>
				<option value="blessure" {if $Suivi.type == 'blessure'}selected="selected"{/if}>{$lang.Blessure}</option>
				<option value="maladie" {if $Suivi.type == 'maladie'}selected="selected"{/if}>{$lang.Maladie}</option>
				<option value="psychologique" {if $Suivi.type == 'psychologique'}selected="selected"{/if}>{$lang.Psychologique}</option>
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label for="suivi">{$lang.Suivi} :</label></dt>
		<dd><textarea name="suivi[suivi]" cols="40" rows="4" class="validate[required]" id="suivi">{$Suivi.suivi}</textarea></dd>
	</dl>
	{if $smarty.session.utilisateur.suivi_medical_show_prive == 1}
	<dl>
		<dt><label for="suivi_prive">{$lang.Suivi_prive} :</label></dt>
		<dd><textarea name="suivi[suivi_prive]" cols="40" rows="4">{$Suivi.suivi_prive}</textarea></dd>
	</dl>
	{/if}
	<dl>
		<dt><label for="">{$lang.Date_reprise} :</label></dt>
		<dd><input type="text" name="suivi[dispo_rugby]" id="dispo_sport" size="10" class="validate[custom[date]]" {if !empty($Suivi.dispo_rugby)}value="{$Suivi.dispo_rugby|date_format:$config.format_date_day}"{/if}/><span>{$lang.Laisser_vide_si_non_suspendu}</span></dd>
	</dl>
	<dl>
		<dt><label for="">{$lang.Date_reprise_musculation} :</label></dt>
		<dd><input type="text" name="suivi[dispo_muscu]" id="dispo_muscu" size="10" class="validate[custom[date]]" {if !empty($Suivi.dispo_muscu)}value="{$Suivi.dispo_muscu|date_format:$config.format_date_day}"{/if}/><span>{$lang.Laisser_vide_si_non_suspendu}</span></dd>
	</dl>
	<div class="form_submit center">
		<input type="hidden" name="suivi[id]" value="{$Suivi.id}" />
		<input type="hidden" name="suivi[joueur_id]" value="{$Suivi.joueur_id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>
	
<script type="text/javascript">
<!--
	$(function() {
		$( "#dispo_sport" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$( "#dispo_muscu" ).datepicker({ dateFormat: 'dd/mm/yy' });
		$( "#date_medical" ).datepicker({ dateFormat: 'dd/mm/yy' });
	});
//-->
</script>
