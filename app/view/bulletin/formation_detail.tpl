<form class="form">
	<h1>{$lang.Formation}</h1>
	<!-- etablissement -->
	<dl>
		<dt><label for="etablissement_id">{$lang.Etablissement} :</label></dt>
		<dd>{$Formation.etablissement}</dd>
	</dl>	
	
	<dl>
		<dt><label for="formation">{$lang.Formation} :</label></dt>
		<dd>{$Formation.nom}</dd>
	</dl>
	
	<dl>
		<dt><label for="description">{$lang.Description} :</label></dt>
		<dd>{$Formation.description|nl2br}</dd>
	</dl>
	
	<!-- RESULTAT -->
	<dl>
		<dt><label for="resultat">{$lang.Resultat} :</label></dt>
		<dd>
			{if $Formation.resultat == 0}{$lang.En_cour}{/if}
			{if $Formation.resultat == 1}{$lang.Reussie}{/if}
			{if $Formation.resultat == 2}{$lang.Echec}{/if}			
		</dd>
	</dl>
	
	<!-- BILAN -->
	<dl>
		<dt><label for="bilan">{$lang.Bilan} :</label></dt>
		<dd>{$Formation.bilan|nl2br}</dd>
	</dl>
	
	<!-- Duree -->
	<dl>
		<dt><label for="duree">{$lang.Duree} :</label></dt>
		<dd>{$Formation.duree}</dd>
	</dl>
	
	<!-- Date -->
	<dl>
		<dt><label for="date_debut">{$lang.Date_debut}* :</label></dt>
		<dd>{$Formation.timestamp_debut|date_format:$config.format_date_day}</dd>
	</dl>
	<dl>
		<dt><label for="date_fin">{$lang.Date_fin}* :</label></dt>
		<dd>{$Formation.timestamp_fin|date_format:$config.format_date_day}</dd>
	</dl>
</form>