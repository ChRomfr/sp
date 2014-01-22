<h1>{$lang.Ressentie} {$lang.Semaine} {$Semaine} {$Year}</h1>
<table style="margin:auto;">
	<thead>
		<tr>
			<td>Fatigue</td>
			<td>Entrainement</td>
			<td>Entraineur</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="center"><img src="{getLink("ressentie/getGraphique?nohtml&semaine={$Semaine}&sportif={$Joueur_id}&year={$Year}&type=fatigue")}" alt="" /></td>
			<td class="center"><img src="{getLink("ressentie/getGraphique?nohtml&semaine={$Semaine}&sportif={$Joueur_id}&year={$Year}&type=entrainement")}" alt="" /></td>
			<td class="center"><img src="{getLink("ressentie/getGraphique?nohtml&semaine={$Semaine}&sportif={$Joueur_id}&year={$Year}&type=entraineur")}" alt="" /></td>
		</tr>
	</tbody>
</table>
</div>
<h1>Annuel</h1>
<table style="margin:auto;">
	<thead>
		<tr>
			<td>Fatigue</td>
			<td>Entrainement</td>
			<td>Entraineur</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="center"><img src="{getLink("ressentie/graphAnnuel?nohtml&year={$Year}&sportif={$Joueur_id}&type=fatigue")}" alt="" /></td>
			<td class="center"><img src="{getLink("ressentie/graphAnnuel?nohtml&year={$Year}&sportif={$Joueur_id}&type=entrainement")}" alt="" /></td>
			<td class="center"><img src="{getLink("ressentie/graphAnnuel?nohtml&year={$Year}&sportif={$Joueur_id}&type=entraineur")}" alt="" /></td>
		</tr>
	</tbody>
</table>