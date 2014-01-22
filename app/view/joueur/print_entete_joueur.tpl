<div id="fiche_detail" class="showData">
	<h1>{$Joueur.prenom} {$Joueur.nom}</h1>
	
    {if !empty($Joueur.photo_id)}
        <div class="fleft" style="width:50%">
            <div class="center"><img src="{$config.url}{$config.url_dir}web/upload/joueurs/{$Joueur.id}/photo_id/{$Joueur.photo_id}" style="width:150px;" /></div>
        </div>
        <div class="fright" style="width:50%">
    {/if}

	<table class="tadmin" style="width:100%;">
		{if $config.multi_site == 1}
		<tr>
			<td>{$lang.Site} :</td>
			<td>{$Site.nom}</td>
		</tr>
		{/if}
		<tr>
			<td>{$lang.Nom} :</td>
			<td>{$Joueur.nom}</td>
		</tr>
		<tr>
			<td>{$lang.Prenom} :</td>
			<td>{$Joueur.prenom}</td>
		</tr>
		<tr>
			<td>{$lang.Date_de_naissance} :</td>
			<td>{$Joueur.date_naissance|date_format:$config.format_date_day}</td>
		</tr>
		<tr>
			<td>{$lang.Lieu_de_naissance} :</td>
			<td>{$Joueur.lieu_naissance}</td>
		</tr>
		<tr>
			<td>{$lang.Adresse}</td>
			<td>{$Joueur.adresse}<br/>{$Joueur.code_postal} {$Joueur.ville}</td>
		</tr>
		<tr>
			<td>{$lang.Contact}</td>
			<td>
				<ul>
					{if $Joueur.telephone != ''}<li>{$Joueur.telephone}</li>{/if}
					{if $Joueur.portable != ''}<li>{$Joueur.portable}</li>{/if}
					{if $Joueur.email != ''}<li><a href="mailto:{$Joueur.email}">{$Joueur.email}</a></li>{/if}
				</ul>
			</td>
		</tr>
		{if $config.sport_champ_structure == 1}
		<tr>
			<td>{$lang.Structure} :</td>
			<td><a href="javascript:showTab(1)" title="">{$Structure.nom}</a></td>
		</tr>
		{/if}
		
		{if $Joueur.taille != ''}
		<tr>
			<td>{$lang.Taille} :</td>
			<td>{$Joueur.taille} cm</td>
		</tr>
		{/if}
		
		{if $Joueur.poids != ''}
		<tr>
			<td>{$lang.Poids} :</td>
			<td>{$Joueur.poids} kg</td>
		</tr>
		{/if}
		
		<tr>
			<td>{$lang.Date_entree} :</td>
			<td>{$Joueur.date_entree|date_format:$config.format_date_day}</td>
		</tr>
		{if $Joueur.date_sortie > 0}
		<tr>
			<td>{$lang.Date_de_sortie} :</td>
			<td>{$Joueur.date_sortie|date_format:$config.format_date_day}</td>
		</tr>
		{/if}
	</table>


{if !empty($Joueur.photo_id)}
    </div>
    <div class="clear"></div>
{else}
    </div>
{/if}