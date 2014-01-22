<h3>{$lang.Detail_seance} : # {$seance_id}</h3>
<table class="tadmin">
	<thead>
		<tr>
			<td>{$lang.Exercice}</td>
			<td>{$lang.Poids}</td>
			<td>{$lang.Repetition}</td>
			<td>{$lang.Serie}</td>
		</tr>
	</thead>
	<tbody>
		{foreach $Exercices as $Row}
			<tr>
				<td>{$Row.ME_NOM}</td>
				<td>{$Row.poids}</td>
				<td>{$Row.repetition}</td>
				<td>{$Row.serie}</td>
			</tr>
		{/foreach}
	</tbody>
</table>