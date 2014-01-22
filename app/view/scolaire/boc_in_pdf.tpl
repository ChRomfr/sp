<html>
	<head>
	
	</head>
	<body>
		<h1>{$lang.Bilan_orientation_competences}</h1>
		<div style="text-align:right;">{$Boc.annee}</div>

		<!-- Tab info joueur -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Nom} :</td>
				<td style="border:1px solid black;">{$Sportif.nom}</td>
			</tr>
			<tr>
				<td style="border:1px solid black;">{$lang.Prenom} :</td>
				<td style="border:1px solid black;">{$Sportif.prenom}</td>
			</tr>
			<tr>
				<td style="border:1px solid black;">{$lang.Date_de_naissance} :</td>
				<td style="border:1px solid black;">{$Sportif.date_naissance|date_format:$config.format_date_day}</td>
			</tr>
		</table>
		<br/><br/>
		<!-- Formation en cours -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Formation_en_cour} :</td>
				<td style="border:1px solid black;">{$Boc.formation|nl2br}</td>
			</tr>
		</table>
		
		<br/><br/>
		
		<!-- Diploeme obtenus -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Diplome_obtenu} :</td>
				<td style="border:1px solid black;">{$Boc.diplome_obtenu|nl2br}</td>
			</tr>
		</table>
		<br/><br/>
		<!-- Formation effectue -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Formation_effectuee} :</td>
				<td style="border:1px solid black;">{$Boc.formation_effectuee|nl2br}</td>
			</tr>
		</table>
		
		<br/><br/>
		
		<!-- Objectif -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Objectif} :</td>
				<td style="border:1px solid black;">{$Boc.objectif_stagiaire|nl2br}</td>
			</tr>
		</table>
		
		<br/><br/>
		<!-- Notes -->
		<table style="width:80%; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black; border-collapse: collapse;">{$lang.Matiere}</td>
				<td style="border:1px solid black;">{$lang.Note}</td>
			</tr>
			<!-- Listing des matieres -->
			{foreach $Matieres as $Row name=foo}
			<tr>
				<td style="border:1px solid black;">{$Row.matiere}</td>
				<td style="border:1px solid black;">
					{foreach $Notes as $data}
						{if $data.matiere_id == $Row.id}{$data.note}{/if}
					{/foreach}
				</td>
			</tr>
			{/foreach}
		</table>
		
		<br/><br/>
		
		<!-- Remarque -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Remarque} :</td>
				<td style="border:1px solid black;">{$Boc.remarque|nl2br}</td>
			</tr>
		</table>
		
		<br/><br/>
		
		<!-- Experience pro -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Experiences_professionnelles} :</td>
				<td style="border:1px solid black;">{$Boc.experience_pro|nl2br}</td>
			</tr>
		</table>
		
		<br/><br/>
		
		<!-- Avis equipe péda -->
		<table style="width:80%; border:1px solid black; border-collapse: collapse;">
			<tr>
				<td style="width:40%; border:1px solid black;">{$lang.Avis_equipe_pedagogique} :</td>
				<td style="border:1px solid black;">{$Boc.avis_equipe_peda|nl2br}</td>
			</tr>
		</table>
		
	</body>
</html>