{strip}
{if $smarty.const.BREAD == 1}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("matchBasket/index")}" title="{$lang.Match}">{$lang.Match}</a>&nbsp;>>&nbsp;
	{$lang.Detail}
</div>
{/if}

<div class="showData">
	<h1>{if !empty($Match.structure)}{$Match.structure}&nbsp;-&nbsp;{/if}{$Match.equipe} VS {$Match.adversaire}</h1>
	<ul>
		<li>{$lang.Date} : <strong>{$Match.date_timestamp|date_format:$config.format_date_day}</strong></li>
		<li>{$lang.Score} : <span {if $Match.score_equipe > $Match.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Match.score_equipe < $Match.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Match.score_equipe == $Match.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if} >{$Match.score_equipe} - {$Match.score_adversaire}</span></li>
		<li>{$lang.Observation} : <strong>{$Match.observation|nl2br}</strong></lI>
	</ul>
	<div style="overflow:auto;">
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Sportif}</td>
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
			{foreach $Joueurs as $Row}
			<tr>
				<td><a href="{getLink("joueur/fiche/{$Row.joueur_id}")}" title="">{$Row.prenom} {$Row.nom}</a></td>
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
				<td class="center">{$Row.observation|nl2br}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
</div>{/strip}