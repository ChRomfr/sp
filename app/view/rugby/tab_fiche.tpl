<table class="tadmin">
	<ul>
		<li>{$lang.Temps_de_jeu_mois_en_cour} : <strong>{$TpsMois.temps}</strong> min</li>
		<li>{$lang.Temps_de_jeu_moyen} : <strong>{$AvgMatch.temps|round}</strong> min</li>
	</ul>
	<thead>
		<tr>
			<td>{$lang.Date}</td>
			<td>{$lang.Equipe} A</td>
			<td>{$lang.Equipe} B</td>
			<td>{$lang.Temps_de_jeu}</td>
			<td>{$lang.Points}</td>
			<td>{$lang.Poste}</td>
			<td>{$lang.Commentaire}</td>
		</tr>
	</thead>
	<tbody>
		{foreach $Matchs as $Row}
		<tr>
			<td><a href="{getLink("rugby/matchDetail/{$Row.m_id}")}" title="">{$Row.m_date|date_format:$config.format_date_day}</a></td>
			<td>{if $Row.equipe == 'A'}<strong>{/if}{$Row.equipe_a}{if $Row.equipe == 'A'}</strong>{/if} ({$Row.score_a})</td>
			<td>{if $Row.equipe == 'B'}<strong>{/if}{$Row.equipe_b}{if $Row.equipe == 'B'}</strong>{/if} ({$Row.score_b})</td>
			<td>{$Row.temps_jeu} min</td>
			<td>{$Row.points}</td>
			<td>{$Row.poste}</td>
			<td>{$Row.commentaire|nl2br}</td>
		</tr>
		{/foreach}
	</tbody>
</table>