{if count($Formations) > 0}
	<form class="form" method="post" action="{getLink("scolaire/bfsAdd/{$Sportif.id}")}">
		<h1>{$lang.Nouveau_bfs}</h1>
		
		<!-- Annee -->
		<dl>
			<dt><label for="annee">{$lang.Annee} :</label></dt>
			<dd><input type="text" name="bfs[annee]" placeholder="2012/2013" id="annee" size="10" required class="validate[required]"/>
		</dl>
		
		<!-- Date du BFS -->
		<dl>
			<dt><label for="date_bfs">{$lang.Date}</label></dt>
			<dd><input type="text" name="bfs[date_bfs]" value="" id="date_bfs" size="10"/></dd>
		</dl>
		
		<!-- Liste des formations en cour ... -->
		<dl>
			<dt><label for="formation_id">{$lang.Formation} :</label></dt>
			<dd>			
				<select name="bfs[formation_id]" id="formation_id" required class="validate[required]">
					<option value=""></option>
					{foreach $Formations as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>			
			</dd>
		</dl>
		
		<!-- Attendu -->
		<dl>
			<dt><label for="attendu">{$lang.Attendu} :</dt>
			<dd><textarea name="bfs[attendu]" id="attendu" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Modifie -->
		<dl>
			<dt><label for="modifie">{$lang.Modifie} :</dt>
			<dd><textarea name="bfs[modifie]" id="modifie" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Resultat -->
		<dl>
			<dt><label for="resultat">{$lang.Resultat} :</dt>
			<dd><textarea name="bfs[resultat]" id="resultat" cols="50" rows="4"></textarea></dd>
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
			<dd><textarea name="bfs[remarque]" id="remarque" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Avis equipe pedago -->
		<dl>
			<dt><label for="avis_equipe_peda">{$lang.Avis_equipe_pedagogique} :</dt>
			<dd><textarea name="bfs[avis_equipe_peda]" id="avis_equipe_peda" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Submit et champs caches -->
		<div class="center">
			<input type="hidden" name="bfs[add_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="bfs[add_on]" value="{$smarty.now}" />
			<input type="hidden" name="bfs[edit_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="bfs[edit_on]" value="{$smarty.now}" />
			<input type="hidden" name="token" value="{$smarty.session.token}" />
			<input type="submit" value="{$lang.Enregistrer}" />
		</div>
	</form>
	
	<script type="text/javascript">
	<!--
		$(function() {
			$( "#date_bfs" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
			$( "#date_bfs" ).datepicker( "option", "showAnim", "clip" );
		});
	//-->
	</script>
	
{else}
	{$lang.Vous_devez_d_abord_ajouter_une_formation_au_sportif}		
{/if}