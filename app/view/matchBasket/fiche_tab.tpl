<script>
<!--
$(function() {
    $( "#diag-matchBasket" ).dialog({ autoOpen: false, width:800 });
});

function getMatchBasketObservation(id){
	$('#diag-matchBasket').html("");
	$.get(
	        '{getLink("matchBasket/ajaxGetObservation/'+ id +'")}',{literal}
	        {nohtml:'nohtml'},
	        function(data){ $('#diag-matchBasket').html(data); }
	    )
	    {/literal}
		$( "#diag-matchBasket" ).dialog('open');
}

//-->
</script>{strip}
<div class="showData">
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Equipe}</td>
				<td>{$lang.Adversaire}</td>
				<td>{$lang.Score}</td>
				<td>{$lang.Date}</td>
				<td>{$lang.Temps_de_jeu}</td>
				<td>{$lang.Poste}</td>
				<td>{$lang.Points}</td>
				<td>{$lang.Tir}</td>
				<td>{$lang.Tir_reussis}</td>
				<td>{$lang.Lancer_franc}</td>
				<td>{$lang.Lancer_franc_reussis}</td>
				<td>{$lang.Rebond}</td>
				<td>{$lang.Passe_decissive}</td>
				<td>{$lang.Interception}</td>
				<td>{$lang.Contre}</td>
				<td>{$lang.Balle_perdu}</td>
				<td>{$lang.Faute}</td>
                <td>{$lang.Evaluation}</td>
				<td>{$lang.Observation}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Matchs as $Row}
			<tr>
				<td><a href="{getLink("matchBasket/detail/{$Row.match_id}")}" title="">{if !empty($Row.structure)}{$Row.structure}&nbsp;-&nbsp;{/if}{$Row.equipe}</a></td>
				<td>{$Row.adversaire}</td>
				<td class="center" {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if}><span {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if} >{$Row.score_equipe} - {$Row.score_adversaire}</span></td>
				<td>{$Row.date_timestamp|date_format:$config.format_date_day}</td>
				<td>{$Row.temps_jeu}</td>
				<td>{$Row.poste}</td>
				<td class="center">{$Row.points}</td>
				<td class="center">
					2 : {$Row.tir_2}<br/>
					3 : {$Row.tir_3}
				</td>
				<td class="center">
					2 : {$Row.tir_2_reussis} - {$Row.tir_2_percent}%<br/>
					3 : {$Row.tir_3_reussis} - {$Row.tir_3_percent}%
				</td>
				<td class="center">{$Row.lfranc}</td>
				<td class="center">{$Row.lfranc_reussis} - {$Row.lfranc_percent}%</td>
				<td class="center">
						O : {$Row.rebond_offensif}<br/>
						D : {$Row.rebond_deffensif}<br/>
						TOTAL : {$Row.rebond_total}
				</td>
				<td>{$Row.passe_decissive}</td>
				<td>{$Row.interception}</td>
				<td>{$Row.contre}</td>
				<td>{$Row.balle_perdu}</td>
				<td>
					{$Row.faute}<br/>
					P : {$Row.faute_provoquee}			
				</td>
                <td>{$Row.evaluation}</td>
				<td class="center">{if !empty($Row.observation)}<a href="javascript:getMatchBasketObservation({$Row.mrj_id});">{$Row.observation|truncate:30}</a>{/if}</td>
			</tr>
			{/foreach}
		</tbody>
		{*<tfoot>
			<tr>
				<td>{$lang.Stats}</td>
				<td class="center">{$Matchs|count}</td>
				<td></td>
				<td></td>
				<td class="center">{$Stats.tot_tps_jeu} / {$Stats.avg_tps_jeu|round}</td>
				<td></td>
				<td class="center">{$Stats.tot_essai} / {$Stats.avg_essai|round}</td>
				<td class="center">{$Stats.tot_transformation|round} / {$Stats.avg_transformation|round}</td>
				<td class="center">{$Stats.tot_penalite} / {$Stats.avg_penalite|round}</td>
				<td></td>
				<td></td>
			</tr>
		</tfoot>*}
	</table>
</div>
<div id="diag-matchBasket"></div>{/strip}