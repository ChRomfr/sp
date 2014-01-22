<!-- test/get_all_result... .tpl -->
{strip}
<div class="well">
	<h4>{$Joueur.prenom} {$Joueur.nom} - {$Exercice.nom}</h4>
	<table class="table">
		<thead>
			<tr>
				<th>{$lang.Date}</th>
				<th>{$lang.Resultat}</th>
			</tr>
		</thead>
		<tbody>
			{foreach $Resultats as $Row}
			<tr>
				<td>{$Row.date_test|date_format:$config.format_date_day}</td>
				<td>{$Row.resultat}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
	<br/><br/>
	<div style="text-align:center"><img src="{getLink("test/graph?nohtml&joueur={$Joueur.id}&exercice={$Exercice.id}&width=500")}" alt="" /></div>
</div>
{/strip}