<html>
	<head></head>
	<body>
		<table style="width:75%; margin:auto;">
			<tr>
				<td>{$lang.Nom} : </td>
				<td>{$Joueur.nom}</td>
				<td>{$lang.Prenom} :</td>
				<td>{$Joueur.prenom}</td>
			</tr>
			
			<tr><td colspan="4">&nbsp;</td></tr>
			
			<tr>
				<td style="vertical-align:top">{$lang.Adresse} :</td>
				<td>{$Joueur.adresse}<br/>{$Joueur.code_postal} {$Joueur.ville}</td>
				<td colspan="2"></td>
			</tr>
			
			<tr><td colspan="4">&nbsp;</td></tr>
			
			<tr>
				<td colspan="4" style="text-align:center;"><strong>{$lang.Contact}</strong></td>
			</tr>
			{if $Joueur.telephone != ''}
			<tr>
				<td>{$lang.Telephone} :</td>
				<td>{$Joueur.telephone}</td>
				<td colspan="2"></td>
			</tr>
			{/if}
			
			{if $Joueur.portable != ''}
			<tr>
				<td>{$lang.Portable} :</td>
				<td>{$Joueur.portable}</td>
				<td colspan="2"></td>
			</tr>
			{/if}
			
			{if $Joueur.email != ''}
			<tr>
				<td>{$lang.Email} :</td>
				<td>{$Joueur.email}</td>
				<td colspan="2"></td>
			</tr>
			{/if}
			
			<tr><td colspan="4">&nbsp;</td></tr>
			
			{* Donnee morphologique *}
			<tr>
				<td colspan="4" style="text-align:center;"><strong>{$lang.Morphologie}</strong></td>
			</tr>
			<tr>
				<td>{$lang.Taille} :</td>
				<td>{$Joueur.taille} cm</td>
				<td>{$lang.Poids} :</td>
				<td>{$Joueur.poids} kg</td>
			</tr>
			
			<tr><td colspan="4">&nbsp;</td></tr>
			
			{* Donnee structure *}
			<tr>
				<td colspan="4" style="text-align:center;"><strong>{$lang.Structure}</strong></td>
			</tr>
			<tr>
				<td>{$lang.Structure} :</td>
				<td>{$Club.nom}</td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>{$lang.Entraineur} :</td>
				<td>{$Entraineur.nom} {$Entraineur.prenom}</td>
				<td colspan="2"></td>
			</tr>
			
			<tr><td colspan="4">&nbsp;</td></tr>
			
			{* Donnee scolaire *}
			<tr>
				<td colspan="4" style="text-align:center;"><strong>{$lang.Scolaire}</strong></td>
			</tr>
			<tr>
				<td>{$lang.Etablissement} :</td>
				<td>{$Etab.nom}</td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>{$lang.Diplome_prepare} :</td>
				<td>{$Joueur.diplome_prepare}</td>
				<td colspan="2"></td>
			</tr>
		</table>
		
		<pagebreak type="NEXT-ODD" resetpagenum="1" pagenumstyle="i" suppress="off" />
		
		{* START PROJET DE FORMATIONS *}
		
		<h1>{$lang.Projet_formation}</h1>
		<table style="width:100%">
			<tr>
				<td style="width:10%;"></td>
				<td style="width:30%;">{$lang.Premiere_annee}</td>
				<td style="width:30%;">{$lang.Deuxieme_annee}</td>
				<td style="width:30%;">{$lang.Troisieme_annee}</td>
			</tr>
			
			{* LISTES A COURT TERME *}
			<tr>
				<td>{$lang.Court_terme}</td>
				<td>
					{if !empty($Projets.0)}
					<strong>{$Projets.0.intitule}</strong>
					{/if}
				</td>
				<td>
					{if !empty($Projets.1)}
					<strong>{$Projets.1.intitule}</strong>
					{/if}
				</td>
				<td>
					{if !empty($Projets.2)}
					<<strong>{$Projets.2.intitule}</strong>
					{/if}
				</td>
			</tr>
			
			{* LISTES A MOYEN TERME *}
			<tr>
				<td>{$lang.Moyen_terme}</td>
				<td>
					{if !empty($Projets.3)}
					<strong>{$Projets.3.intitule}</strong>
					{/if}
				</td>
				<td>
					{if !empty($Projets.4)}
					<strong>{$Projets.4.intitule}</strong>
					{/if}
				</td>
				<td>
					{if !empty($Projets.5)}
					<strong>{$Projets.5.intitule}</strong>
					{/if}
				</td>
			</tr>
			
			{* LISTES A LONG TERME *}
			<tr>
				<td>{$lang.Long_terme}</td>
				<td>
					{if !empty($Projets.6)}
					<stronf>{$Projets.6.intitule}</strong>
					{/if}
				</td>
				<td>
					{if !empty($Projets.7)}
					<strong>{$Projets.7.intitule}</strong>
					{/if}
				</td>
				<td>
					{if !empty($Projets.8)}
					<strong>{$Projets.8.intitule}</strong>
					{/if}
				</td>
			</tr>
			
		</table>
		
		{* END PROJET DE FORMATIONS *}
		
	</body>
</html>