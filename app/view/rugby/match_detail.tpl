{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("rugby/index")}" title="">{$lang.Rugby}</a>&nbsp;>>&nbsp;
    <a href="{getLink("rugby/matchIndex")}" title="">{$lang.Match}</a>&nbsp;>>&nbsp;
    {$Match.equipe_a} vs {$Match.equipe_b}
</div>
{/if}

<div class="showData">
	<h1>{$Match.equipe_a} vs {$Match.equipe_b} - {$Match.m_date|date_format:$config.format_date_day}</h1>
	<table class="tab_match">
		{* EQUIPE *}
		<tr>
			<td class="tab_match_head">{$lang.Equipe}</td>
			<td>{$Match.equipe_a}</td>
			<td>{$Match.equipe_b}</td>
		</tr>
		{* SCORE *}
		<tr>
			<td class="tab_match_head">{$lang.Score}</td>
			<td>{$Match.score_a}</td>
			<td>{$Match.score_b}</td>
		</tr>
		{* JOUEURS *}
		<tr>
			<td class="tab_match_head">{$lang.Joueur}</td>
			<td>
				{foreach $Joueurs as $Row}
					{if $Row.equipe == A}
					<li>{$Row.nom} {$Row.prenom}
						<br/>>>{$lang.Temps_de_jeu} :<strong>{$Row.temps_jeu}</strong> min
						<br/>>>{$lang.Points} :<strong>{$Row.points}</strong>
						<br/>>>{$lang.Poste} :<strong>{$Row.poste}</strong>
						<br/>>>{$lang.Commentaire} :<strong>{$Row.commentaire|nl2br}</strong>
					</li>
					<hr/>
					{/if}
				{/foreach}
			</td>
			<td>
				{foreach $Joueurs as $Row}
					{if $Row.equipe == B}
					<li>{$Row.nom} {$Row.prenom}
						<br/>>>{$lang.Temps_de_jeu} :<strong>{$Row.temps_jeu}</strong> min
						<br/>>>{$lang.Points} :<strong>{$Row.points}</strong>
						<br/>>>{$lang.Poste} :<strong>{$Row.poste}</strong>
						<br/>>>{$lang.Commentaire} :<strong>{$Row.commentaire|nl2br}</strong>
					</li>
					{/if}
				{/foreach}
			</td>
		</tr>
	</table>
</div>