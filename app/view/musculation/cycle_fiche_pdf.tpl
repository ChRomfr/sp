<div class="showData">
	<h1>{$lang.Cycle} : {$Cycle.nom}</h1>

	<table class="tadmin">
		<tr>
			<td>{$lang.Cycle} :</td>
			<td>{$Cycle.nom}</td>
		</tr>
		<tr>
			<td>{$lang.Description} :</td>
			<td>{$Cycle.description|nl2br}</td>
		</tr>
		<tr>
			<td>{$lang.Date_debut} :</td>
			<td>{$Cycle.date_debut|date_format:$config.format_date_day}</td>
		</tr>
		<tr>
			<td>{$lang.Date_fin} :</td>
			<td>{$Cycle.date_fin|date_format:$config.format_date_day}</td>
		</tr>
	</table>

	{* LISTE DES EXERCICES *}
	<h3>{$lang.Exercices}</h3>
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
			<td>{$Row.exercice}</td>
			<td>{$Row.poid}</td>
			<td>{$Row.repetition}</td>
			<td>{$Row.serie}</td>
		</tr>
		{/foreach}
		</tbody>
	</table>
</div>