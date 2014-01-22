{strip}
<div class="well">
	<table class="table table-bordered table-striped table-condensed">
		<thead>
			<tr>
				<th>{$lang.Equipe}</th>
				<th>{$lang.Adversaire}</th>
				<th>{$lang.Score}</th>
				<th>{$lang.Date}</th>
				<th>{$lang.Temps_de_jeu}</th>
				<th>{$lang.Poste}</th>
				<th>{$lang.Essai}</th>
				<th>{$lang.Transformation}</th>
				<th>{$lang.Penalite}</th>
				<th>{$lang.Carton}</th>
				<th>{$lang.Observation}</th>
			</tr>
		</thead>
		<tbody>
			{foreach $Matchs as $Row}
			<tr>
				<td><a href="{getLink("matchRugby/detail/{$Row.match_id}")}" title="">{if !empty($Row.structure)}{$Row.structure}&nbsp;-&nbsp;{/if}{$Row.equipe}</a></td>
				<td>{$Row.adversaire}</td>
				<td class="center" {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if}><span {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if} >{$Row.score_equipe} - {$Row.score_adversaire}</span></td>
				<td>{$Row.date_timestamp|date_format:$config.format_date_day}</td>
				<td>{$Row.temps_jeu}</td>
				<td>{$Row.poste}</td>
				<td>{$Row.essaie}</td>
				<td>{$Row.transformation}</td>
				<td>{$Row.penalite}</td>
				<td style="text-align:center">
					{if $Row.c_jaune > 0}<img src="{$config.base_url}web/images/cjaune.png" />{/if}
					{if $Row.c_rouge > 0}<img src="{$config.base_url}web/images/crouge.png" />{/if}
				</td>
				<td style="text-align:center">{if !empty($Row.observation)}<a class="fbshowobservation" href="{getLink("matchRugby/ajaxGetObservation/{$Row.mrj_id}?nohtml")}">{$Row.observation|truncate:30}</a>{/if}</td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
			<tr>
				<th>{$lang.Stats}</th>
				<th style="text-align:center">{$Matchs|count}</th>
				<th></th>
				<th></th>
				<th style="text-align:center">{$Stats.tot_tps_jeu} / {$Stats.avg_tps_jeu|round}</th>
				<th></th>
				<th style="text-align:center">{$Stats.tot_essai} / {$Stats.avg_essai|round}</th>
				<th style="text-align:center">{$Stats.tot_transformation|round} / {$Stats.avg_transformation|round}</th>
				<th style="text-align:center">{$Stats.tot_penalite} / {$Stats.avg_penalite|round}</th>
				<th></th>
				<th></th>
			</tr>
		</tfoot>
	</table>
</div>
<div id="diag-matchRugby"></div>{/strip}
<script type="text/javascript">
<!--
$(function() {
    $( "#diag-matchRugby" ).dialog({ autoOpen: false, width:800 });
    $('a.fbshowobservation').fancybox();
});

function getMatchRugbyObservation(id){
	$('#diag-matchRugby').html("");
	$.get(
	        '{getLink("matchRugby/ajaxGetObservation/'+ id +'")}',{literal}
	        {nohtml:'nohtml'},
	        function(data){ $('#diag-matchRugby').html(data); }
	    )
	    {/literal}
		$( "#diag-matchRugby" ).dialog('open');
}

//-->
</script>