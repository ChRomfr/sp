{* RUGBY MATCH INDEX *}
<div class="showData">
	<h1>{$lang.Match}</h1>
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Date}</td>
				<td>{$lang.Equipe} A</td>
				<td>{$lang.Equipe} B</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Matchs as $Row}
			<tr>
				<td><a href="{getLink("rugby/matchDetail/{$Row.id}")}" title="">{$Row.m_date|date_format:$config.format_date_day}</a></td>
				<td>{$Row.equipe_a} ({$Row.score_a})</td>
				<td>{$Row.equipe_b} ({$Row.score_b})</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>