<script>
function getSportif(){
	
	var equipe_id;
	var date;	
	
	equipe_id = $("#equipe").val();
	date = $("#date_match").val();
	
	if( equipe_id != '' && date != ''){
		$.get(
	        '{getLink("matchBasket/ajaxGetJoueurAddMatch")}',{literal}
	        {equipe_id: equipe_id,date: date,nohtml:'nohtml'},
	        function(data){ $('#tabJoueurMatch').html(data); }
	    )
	    {/literal}
    }
    
}
</script>
{if $smarty.const.BREAD == 1}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("matchBasket/index")}" title="{$lang.Match}">{$lang.Match}</a>&nbsp;>>&nbsp;
	{$lang.Nouveau}
</div>
{/if}
<form method="post" action="" id="formAddMatch" class="form">
	<div class="fleft" style="width:50%;">
		<dl>
			<dt><label for="equipe">{$lang.Equipe} :</label></dt>
			<dd>
				<select name="match[equipe_id]" id="equipe" onchange="getSportif()">
					<option></option>
					{foreach $Equipes as $Row}
					<option value="{$Row.id}">{$Row.nom} {if !empty($Row.structure)} - {$Row.structure}{/if}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
	</div>
	<div>
		<dl>
			<dt><label for="score_equipe">{$lang.Score} :</label></dt>
			<dd><input type="text" name="match[score_equipe]" id="score_equipe" size="3" /></dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="fleft" style="width:50%;">
		<dl>
			<dt><label for="adversaire">{$lang.Adversaire} :</label></dt>
			<dd><input type="text" name="match[adversaire]" id="adversaire"  /></dd>
		</dl>
	</div>
	<div>
		<dl>
			<dt><label for="score_adversaire">{$lang.Score} :</label></dt>
			<dd><input type="text" name="match[score_adversaire]" id="score_adversaire" size="3" /></dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div class="fleft" style="width:50%;">
		<dl>
			<dt><label for="date_match">{$lang.Date} :</label></dt>
			<dd><input type="text" size="10" name="match[date_match]" id="date_match" required onchange="getSportif()" /></dd>
		</dl>
	</div>
	<div>
		<dl>
			<dt><label for="observation">{$lang.Observation} :</label></dt>
			<dd><textarea name="match[observation]" id="observation" rows="3" cols="40"></textarea></dd>
		</dl>
	</div>
	<div class="clear"></div>
	<div id="tabJoueurMatch"></div>
	<div class="center">
		<input type="hidden" name="match[creat_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="match[edit_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="match[creat_on]" value="{$smarty.now}" />
		<input type="hidden" name="match[edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_match" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_match" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>