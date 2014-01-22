<div class="showData">
	<h1>{$lang.Sportif_dans_l_equipe} {$Equipe.nom}</h1>
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Sportif}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Joueurs as $Row}
			<tr>
				<td>{$Row.prenom} {$Row.nom}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>