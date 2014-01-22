<script type="text/javascript">
<!--
function pastDate(){
	$("#date_end").val( $("#date_start").val() );
}
//-->
</script>

<div class="showData">
	<h1>{$lang.Calendrier}</h1>
	<div class="fleft" style="width:800px;">
		<iframe src="https://www.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src={$smarty.session.utilisateur.gmail_adr}&amp;color=%232952A3&amp;ctz=Europe%2FParis" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe>
	</div>
	<div>
		<form method="post" action="{getLink("gcalendar/add")}">
			<h1>{$lang.Nouvel_evenement}</h1>
			<dl>
				<dt><label for="title">{$lang.Titre}</label></dt>
				<dd><input type="text" name="event[title]" id="title" required /></dd>
			</dl>
			<dl>
				<dt><label for="description">{$lang.Description}</label></dt>
				<dd><textarea name="event[description]" id="description" required cols="40" rows="5"></textarea></dd>
			</dl>
			<dl>
				<dt><label for="date_start">{$lang.Date_debut}</label></dt>
				<dd>
					<input type="text" name="event[date_start]" size="10" id="date_start" onchange="pastDate();" />
					<select name="event[heure_start]" id="heure_start">
						<option></option>
						<option value="00:00">00:00</option>
						<option value="00:30">00:30</option>
						<option value="01:00">01:00</option>
						<option value="01:30">01:30</option>
						<option value="02:00">02:00</option>
						<option value="02:30">02:30</option>
						<option value="03:00">03:00</option>
						<option value="03:30">03:30</option>
						<option value="04:00">04:00</option>
						<option value="04:30">04:30</option>
						<option value="05:00">05:00</option>
						<option value="05:30">05:30</option>
						<option value="06:00">06:00</option>
						<option value="06:30">06:30</option>
						<option value="07:00">07:00</option>
						<option value="07:30">07:30</option>
						<option value="08:00">08:00</option>
						<option value="08:30">08:30</option>
						<option value="09:00">09:00</option>
						<option value="09:30">09:30</option>
						<option value="10:00">10:00</option>
						<option value="10:30">10:30</option>
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="12:00">12:00</option>
						<option value="12:30">12:30</option>
						<option value="13:00">13:00</option>
						<option value="13:30">13:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>
						<option value="18:00">18:00</option>
						<option value="18:30">18:30</option>
						<option value="19:00">19:00</option>
						<option value="19:30">19:30</option>
						<option value="20:00">20:00</option>
						<option value="20:30">20:30</option>
						<option value="21:00">21:00</option>
						<option value="21:30">21:30</option>
						<option value="22:00">22:00</option>
						<option value="22:30">22:30</option>
						<option value="23:00">23:00</option>
						<option value="23:30">23:30</option>						
					</select>
				</dd>
			</dl>
			<dl>
				<dt><label for="date_end">{$lang.Date_fin}</label></dt>
				<dd>
					<input type="text" name="event[date_end]" size="10" id="date_end" />				
					<select name="event[heure_end]" id="heure_end">
						<option></option>
						<option value="00:00">00:00</option>
						<option value="00:30">00:30</option>
						<option value="01:00">01:00</option>
						<option value="01:30">01:30</option>
						<option value="02:00">02:00</option>
						<option value="02:30">02:30</option>
						<option value="03:00">03:00</option>
						<option value="03:30">03:30</option>
						<option value="04:00">04:00</option>
						<option value="04:30">04:30</option>
						<option value="05:00">05:00</option>
						<option value="05:30">05:30</option>
						<option value="06:00">06:00</option>
						<option value="06:30">06:30</option>
						<option value="07:00">07:00</option>
						<option value="07:30">07:30</option>
						<option value="08:00">08:00</option>
						<option value="08:30">08:30</option>
						<option value="09:00">09:00</option>
						<option value="09:30">09:30</option>
						<option value="10:00">10:00</option>
						<option value="10:30">10:30</option>
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="12:00">12:00</option>
						<option value="12:30">12:30</option>
						<option value="13:00">13:00</option>
						<option value="13:30">13:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>
						<option value="18:00">18:00</option>
						<option value="18:30">18:30</option>
						<option value="19:00">19:00</option>
						<option value="19:30">19:30</option>
						<option value="20:00">20:00</option>
						<option value="20:30">20:30</option>
						<option value="21:00">21:00</option>
						<option value="21:30">21:30</option>
						<option value="22:00">22:00</option>
						<option value="22:30">22:30</option>
						<option value="23:00">23:00</option>
						<option value="23:30">23:30</option>						
					</select>
				</dd>
			</dl>
			<div class="center">
				<input type="submit" value="{$lang.Enregistrer}" />
			</div>
		</form>
	</div>
	<div class="clear"></div>
</div>
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_start" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_start" ).datepicker( "option", "showAnim", "clip" );
		$( "#date_end" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_end" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>