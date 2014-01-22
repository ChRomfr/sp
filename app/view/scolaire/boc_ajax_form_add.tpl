{if count($Formations) > 0}
	<form class="form" method="post" action="{getLink("scolaire/bocAdd/{$Sportif.id}")}">
		<h1>{$lang.Nouveau_boc}</h1>
		
		<!-- Annee -->
		<dl>
			<dt><label for="annee">{$lang.Annee} :</label></dt>
			<dd><input type="text" name="boc[annee]" placeholder="2012/2013" id="annee" size="10" required class="validate[required]"/>
		</dl>
		
		<!-- Liste des formations en cour ... -->
		<dl>
			<dt><label for="formation_id">{$lang.Formation} :</label></dt>
			<dd>			
				<select name="boc[formation_id]" id="formation_id" required class="validate[required]">
					<option value=""></option>
					{foreach $Formations as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>			
			</dd>
		</dl>
		
		<!-- Diplome obtenu -->
		<dl>
			<dt><label for="diplome_obtenu">{$lang.Diplome_obtenu} :</dt>
			<dd><textarea name="boc[diplome_obtenu]" id="diplome_obtenu" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Formation effecue -->
		<dl>
			<dt><label for="formation_effectuee">{$lang.Formation_effectuee} :</dt>
			<dd><textarea name="boc[formation_effectuee]" id="formation_effectuee" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Objectif stagiaire -->
		<dl>
			<dt><label for="objectif_stagiaire">{$lang.Objectif_stagiaire} :</dt>
			<dd><textarea name="boc[objectif_stagiaire]" id="objectif_stagiaire" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Matiere synthese -->
		<dl>
			<dt><label for="matieres">{$lang.Matieres} :</label></dt>
			<dd>
				<table>
					<tr>
						<td>{$lang.Matiere}</td>
						<td>{$lang.Note}</td>
					</tr>
					<!-- Listing des matieres -->
					{foreach $Matieres as $Row name=foo}
					<tr>
						<td>{$Row.matiere}</td>
						<td>
							<input type="hidden" name="matieres[{$smarty.foreach.foo.index}][matiere_id]" value="{$Row.id}" />
							<input type="text" name="matieres[{$smarty.foreach.foo.index}][note]" size="2" />
						</td>
					</tr>
					{/foreach}
				</table>
			</dd>
		</dl>
		
		<!-- Remarque -->
		<dl>
			<dt><label for="remarque">{$lang.Remarque} :</dt>
			<dd><textarea name="boc[remarque]" id="remarque" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Experience pro -->
		<dl>
			<dt><label for="experience_pro">{$lang.Experiences_professionnelles} :</dt>
			<dd><textarea name="boc[experience_pro]" id="experience_pro" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Avis equipe pedago -->
		<dl>
			<dt><label for="avis_equipe_peda">{$lang.Avis_equipe_pedagogique} :</dt>
			<dd><textarea name="boc[avis_equipe_peda]" id="avis_equipe_peda" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Submit et champs caches -->
		<div class="center">
			<input type="hidden" name="boc[add_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="boc[add_on]" value="{$smarty.now}" />
			<input type="hidden" name="boc[edit_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="boc[edit_on]" value="{$smarty.now}" />
			<input type="hidden" name="token" value="{$smarty.session.token}" />
			<input type="submit" value="{$lang.Enregistrer}" />
		</div>
	</form>
	<!--
	<script>
		CKEDITOR.replace( 'boc[diplome_obtenu]' );
		CKEDITOR.replace( 'boc[avis_equipe_peda]' );
	</script>
	//-->
{else}
	{$lang.Vous_devez_d_abord_ajouter_une_formation_au_sportif}		
{/if}