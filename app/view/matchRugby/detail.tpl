{strip}

{if $smarty.const.BREAD == 1}
<ul class="breadcrumb">
	<li><a href="{getLink("index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li><a href="{getLink("matchRugby")}" title="{$lang.Match}">{$lang.Match}</a><span class="divider">/</span></li>
	{$lang.Detail}
</ul>
{/if}

<div class="well">
	<h4>{if !empty($Match.structure)}{$Match.structure}&nbsp;-&nbsp;{/if}{$Match.equipe} VS {$Match.adversaire}</h4>

	<ul class="unstyled">
		<li>{$lang.Date} : <strong>{$Match.date_timestamp|date_format:$config.format_date_day}</strong></li>
		<li>{$lang.Score} : <span {if $Match.score_equipe > $Match.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Match.score_equipe < $Match.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Match.score_equipe == $Match.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if} >{$Match.score_equipe} - {$Match.score_adversaire}</span></li>
		{if !empty($Match.observation)}<li>{$lang.Observation} : <strong>{$Match.observation|nl2br}</strong></li>{/if}
	</ul>

	<!-- Stats du matchs des deux equipes -->
	<table class="table table-bordered table-condensed table-striped">
		<tr>
			<td></td>
			<td>{$lang.Touches}</td>
			<td>{$lang.Melees}</td>
			<td>{$lang.Penalite}</td>
			<td>{$lang.Ruck}</td>
			<td>CP Envoie</td>
			<td>BC</td>
			<td>Franchissements</td>
		</tr>
		<tr>
			<td>{if !empty($Match.structure)}{$Match.structure}&nbsp;-&nbsp;{/if}{$Match.equipe}</td>
			<td>{$Match.eq_touche}</td>
			<td>{$Match.eq_melee}</td>
			<td>{$Match.eq_penalite}</td>
			<td>{$Match.eq_ruck}</td>
			<td>{$Match.eq_cp_envoie}</td>
			<td>{$Match.eq_bc}</td>
			<td>{$Match.eq_franchissement}</td>
		</tr>
		<tr>
			<td>{$Match.adversaire}</td>
			<td>{$Match.ad_touche}</td>
			<td>{$Match.ad_melee}</td>
			<td>{$Match.ad_penalite}</td>
			<td>{$Match.ad_ruck}</td>
			<td>{$Match.ad_cp_envoie}</td>
			<td>{$Match.ad_bc}</td>
			<td>{$Match.ad_franchissement}</td>
		</tr>
		</tr>
	</table>
	
	<!-- Stats des joueurs présents -->
	<table class="table table-bordered table-condensed table-striped">
		<thead>
			<tr>
				<th>{$lang.Sportif}</th>
				<th>{$lang.Temps_de_jeu}</th>
				<th>{$lang.Poste}</th>
				<th>{$lang.Essai}</th>
				<th>{$lang.Passes}</th>
				<th>{$lang.Plaquage}</th>
				<th>{$lang.Enavant}</th>
				<th>{$lang.Transformation}</th>
				<th>{$lang.Penalite}</th>
				<th>{$lang.Carton}</th>
			</tr>
		</thead>
		<tbody>
			{foreach $Joueurs as $Row}
			<tr>
				<td><a href="{getLink("joueur/fiche/{$Row.joueur_id}")}" title="">{$Row.prenom} {$Row.nom}</a></td>
				<td>{$Row.temps_jeu}</td>
				<td>{$Row.poste}</td>
				<td>{$Row.essaie}</td>
				<td>{$Row.passes}</td>
				<td>{$Row.plaquage}</td>
				<td>{$Row.enavant}</td>
				<td>{$Row.transformation}</td>
				<td>{$Row.penalite}</td>
				<td class="center">
					{if $Row.c_jaune > 0}<img src="{$config.url}{$config.url_dir}web/images/cjaune.png" />{/if}
					{if $Row.c_rouge > 0}<img src="{$config.url}{$config.url_dir}web/images/crouge.png" />{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}