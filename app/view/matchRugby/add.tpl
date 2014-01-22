<ul class="breadcrumb">
	<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li><a href="{getLink("matchRugby/index")}" title="{$lang.Match}">{$lang.Match}</a><span class="divider">/</span></li>
	<li>{$lang.Nouveau}</li>
</ul>

<form method="post" action="" id="formAddMatch" class="form well">
	<div class="pull-left" style="width:50%;">
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
			<dd><input type="text" name="match[score_equipe]" id="score_equipe" size="3" class="input-small"/></dd>
		</dl>
	</div>
	<div class="clearfix"></div>
	<div class="pull-left" style="width:50%;">
		<dl>
			<dt><label for="adversaire">{$lang.Adversaire} :</label></dt>
			<dd><input type="text" name="match[adversaire]" id="adversaire"  /></dd>
		</dl>
	</div>
	<div>
		<dl>
			<dt><label for="score_adversaire">{$lang.Score} :</label></dt>
			<dd><input type="text" name="match[score_adversaire]" id="score_adversaire" size="3" class="input-small"/></dd>
		</dl>
	</div>
	<div class="clearfix"></div>
	<div class="fleft" style="width:50%;">
		<dl>
			<dt><label for="date_match">{$lang.Date} :</label></dt>
			<dd><input type="text" size="10" name="match[date_match]" id="date_match" required onchange="getSportif()" class="input-small"/></dd>
		</dl>
	</div>
	<div>
		<dl>
			<dt><label for="observation">{$lang.Observation} :</label></dt>
			<dd><textarea name="match[observation]" id="observation" rows="3" class="input-xlarge"></textarea></dd>
		</dl>
	</div>
	<div class="clear"></div>
	<!-- Donnees collective -->
	<table class="table table-condensed table-bordered table-striped table-hover">
		<tbody>
			<tr>
				<th></th>
				<th>Touche</th>
				<th>Melee</th>
				<th>Penalite</th>
				<th>Ruck</th>
				<th>CP envoie</th>
				<th>BC</th>
				<th>Franchissement</th>
			</tr>
			<tr>
				<td>Equipe</td>
				<td><input type="text" name="match[eq_touche]" id="eq_touche" class="input-mini" /></td>
				<td><input type="text" name="match[eq_melee]" id="eq_melee" class="input-mini" /></td>
				<td><input type="text" name="match[eq_penalite]" id="eq_penalite" class="input-mini" /></td>
				<td><input type="text" name="match[eq_ruck]" id="eq_ruck" class="input-mini" /></td>
				<td><input type="text" name="match[eq_cp_envoie]" id="eq_cp_envoie" class="input-mini" /></td>
				<td><input type="text" name="match[eq_bc]" id="eq_bc" class="input-mini" /></td>
				<td><input type="text" name="match[eq_franchissement]" id="eq_franchissement" class="input-mini" /></td>
			</tr>
			<tr>
				<td>Adversaire</td>
				<td><input type="text" name="match[ad_touche]" id="ad_touche" class="input-mini" /></td>
				<td><input type="text" name="match[ad_melee]" id="ad_melee" class="input-mini" /></td>
				<td><input type="text" name="match[ad_penalite]" id="ad_penalite" class="input-mini" /></td>
				<td><input type="text" name="match[ad_ruck]" id="ad_ruck" class="input-mini" /></td>
				<td><input type="text" name="match[ad_cp_envoie]" id="ad_cp_envoie" class="input-mini" /></td>
				<td><input type="text" name="match[ad_bc]" id="ad_bc" class="input-mini" /></td>
				<td><input type="text" name="match[ad_franchissement]" id="ad_franchissement" class="input-mini" /></td>
			</tr>
		</tbody>
	</table>

	<div id="tabJoueurMatch"></div>
	<div class="form-actions">
		<input type="hidden" name="match[creat_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="match[edit_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="match[creat_on]" value="{$smarty.now}" />
		<input type="hidden" name="match[edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" class="btn btn-primary" />
	</div>
</form>
<script type="text/javascript">
<!--
function getSportif(){
	
	var equipe_id;
	var date;	
	
	equipe_id = $("#equipe").val();
	date = $("#date_match").val();
	
	if( equipe_id != '' && date != ''){
		$.get(
	        '{getLink("matchRugby/ajaxGetJoueurAddMatch")}',{literal}
	        {equipe_id: equipe_id,date: date,nohtml:'nohtml'},
	        function(data){ $('#tabJoueurMatch').html(data); }
	    )
	    {/literal}
    }
}

$(function() {
	$( "#date_match" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
    $( "#date_match" ).datepicker( "option", "showAnim", "clip" );
});
//-->
</script>