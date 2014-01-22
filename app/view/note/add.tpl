<form method="post" action="#" class="form" id="formAdd">
	<dl>
		<dt><label for="titre">{$lang.Titre}</label></dt>
		<dd><input type="text" name="note[titre]" id="titre" size="50" required class="validate[required]" /></dd>
	</dl>
	<dl>
		<dt><label for="note">{$lang.Note}</label></dt>
		<dd><textarea name="note[note]" id="note" cols="5" rows="50" required class="validate[required]"></textarea>
	</dl>
	<dl>
		<dt><label for="rappel">{$lang.Date_rappel} :</label></dt>
		<dd><input type="text" name="note[n_date]" id="rappel" size="10" /></dd>
	</dl>
	<dl>
		<dt><label for="frequence">{$lang.Frequence} :</labe></dl>
		<dd>
			<select name="frequence" id="frequence">
				<option value="">{$lang.Une_fois}</option>
				<option value="day">{$lang.Tous_les_jours}</option>
				<option value="week">{$lang.Toutes_les_semaines}</option>
				<option value="month">{$lang.Tous_les_mois}</option>
				<option value="trimestre">{$lang.Tous_les_trimestres}</option>
				<option value="year">{$lang.Tous_les_ans}</option>
			</select>
		</dd>
	</dl>
	<div class="center">
		<input type="submit"  value="{$lang.Enregistrer}" />
	</div>
</form>
<script type="text/javascript">
<!--
	$(function() {
		$( "#rappel" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#rappel" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>