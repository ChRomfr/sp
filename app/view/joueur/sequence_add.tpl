<script>
function getNumSemaine(){

	$.get(
        '{getLink("ajax/getNumSemaine")}',{literal}
        {nohtml:'nohtml', date:$("#date").val()},
        function(data){ $("#semaine").val(data); getNumSeance(data); getEntrainementAndMuscu($("#date").val());}
    )
    {/literal}
	
	
}

function getNumSeance(numsemaine){
	$.get(
        '{getLink("joueur/getNumSequence")}',{literal}
        {nohtml:'nohtml', semaine:numsemaine, joueur:{/literal}{$joueur_id}{literal}},
        function(data){ $("#numero").val(data); $("#numero_de_la_sequence").html(data);}
    )
    {/literal}
}

function getEntrainementAndMuscu(date){
	$.get(
        '{getLink("joueur/getForSequenceEntrainementEtSeance")}',{literal}
        {nohtml:'nohtml', date:date, joueur:{/literal}{$joueur_id}{literal}},
        function(data){ $("#entrainement_muscu_seance").html(data);}
    )
    {/literal}
}
</script>

<form method="post" action="{getLink("ressentie/sequenceAdd")}" id="formAddSequence" class="form">
	<dl>
		<dt><label for="numero">{$lang.Sequence} : </label></dt>
		<dd><span id="numero_de_la_sequence"></span></dd>
	</dl>
	<dl>
		<dt><label for="date">{$lang.Date} :</label></dt>
		<dd><input type="text" name="sequence[date_s]" id="date" onchange="getNumSemaine();" /></dd>
	</dl>
	<dl>
		<dt><label for="fatigue">{$lang.Fatigue} :</label></dt>
		<dd>
			<select name="sequence[fatigue]" id="fatigue" required>
				<option></option>
				{for $it=1 to $ECHELLE}
                <option value="{$it}">{$it}</option>
                {/for}
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label for="ressentie_entrainement">{$lang.Intensite_entrainement} :</label></dt>
		<dd>
			<select name="sequence[ressentie_entrainement]" id="ressentie_entrainement" required>
				<option></option>
				{for $it=1 to $ECHELLE}
                <option value="{$it}">{$it}</option>
                {/for}
			</select>
		</dd>
	</dl>
	<div id="entrainement_muscu_seance"></div>
	<div class="center">
		<input type="hidden" name="sequence[numero]" value="" id="numero"/>
		<input type="hidden" name="sequence[semaine]" value="" id="semaine"/>
		<input type="hidden" name="sequence[sportif_id]" value="{$smarty.session.utilisateur.id_liaison}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>

<script type="text/javascript">
<!--
	$(function() {
		$( "#date" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>