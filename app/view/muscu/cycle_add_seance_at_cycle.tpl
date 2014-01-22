{* Affiche le formulaire permettant l ajout d une seance effectue a un cycle *}

<script>
function getExoAndJoueurs(){
	$.get(
		'{getLink("muscu/getSeanceAndJoueur")}',{literal}
		{seance_id: $('#seance_id').val(), cycle_id:{/literal}{$Cycle.id}, {literal}nohtml:'nohtml'},
		function(data){ $('#exo-liste').html(data); }
        )
    {/literal}
}
</script>{strip}

{if $smarty.const.BREAD == 1}
<div id="bread">
    <a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
    <a href="{getLink("muscu/cycleListe")}" title="{$lang.Cycle}">{$lang.Cycle}</a>&nbsp;>>&nbsp;
    <a href="{getLink("muscu/detailCycle/{$Cycle.id}")}" title="{$Cycle.nom}">{$Cycle.nom}</a>&nbsp;>>&nbsp;
	{$lang.Ajout_d_une_seance}
</div>
{/if}

<form method="post" class="form">
	<h1>{$lang.Ajout_d_une_seance} - #{$Cycle.nom}</h1>
	<div>{$Cycle.description|nl2br}</div>
	<dl>
		<dt><label>{$lang.Seances}</label> :</dt>
		<dd>
			<select id="seance_id" onchange="getExoAndJoueurs();" name="seance[seance_id]">
				<option></option>
				{foreach $Seances as $Data}
				<option value="{$Data.id}">{$Data.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label>{$lang.Date}</label> :</dt>
		<dd><input type="text" name="seance[date]" id="date_seance" class="validate[required,custom[date]]" size="10"></dd>
	</dl>
	<div id="exo-liste"></div>
	<div class="center form_submit">
		<input type="hidden" name="list_joueurs" value='{$List_joueurs}' />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>
{/strip}
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_seance" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_seance" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>