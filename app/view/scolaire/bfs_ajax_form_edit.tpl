{if count($Formations) > 0}{strip}
	<form class="form" method="post" action="{getLink("scolaire/bfsEdit/{$Bfs.id}")}">
		<h1>{$lang.Edition_bfs} #{$Bfs.id}</h1>
		
		<!-- Annee -->
		<dl>
			<dt><label for="annee">{$lang.Annee} :</label></dt>
			<dd><input type="text" name="bfs[annee]" placeholder="2012/2013" id="annee" size="10" required class="validate[required]" value="{$Bfs.annee}" />
		</dl>
		
		<!-- Date du BFS -->
		<dl>
			<dt><label for="date_bfs">{$lang.Date}</label></dt>
			<dd><input type="text" name="bfs[date_bfs]" value="{$Bfs.date_bfs}" id="date_bfs" size="10"/></dd>
		</dl>
		
		<!-- Liste des formations en cour ... -->
		<dl>
			<dt><label for="formation_id">{$lang.Formation} :</label></dt>
			<dd>			
				<select name="bfs[formation_id]" id="formation_id" required class="validate[required]">
					<option value=""></option>
					{foreach $Formations as $Row}
					<option value="{$Row.id}" {if $Row.id == $Bfs.formation_id}selected="selected"{/if}>{$Row.nom}</option>
					{/foreach}
				</select>			
			</dd>
		</dl>
		
		<!-- Attendu -->
		<dl>
			<dt><label for="attendu">{$lang.Attendu} :</dt>
			<dd><textarea name="bfs[attendu]" id="attendu" cols="50" rows="4">{$Bfs.attendu}</textarea></dd>
		</dl>
		
		<!-- Modifie -->
		<dl>
			<dt><label for="modifie">{$lang.Modifie} :</dt>
			<dd><textarea name="bfs[modifie]" id="modifie" cols="50" rows="4">{$Bfs.modifie}</textarea></dd>
		</dl>
		
		<!-- Resultat -->
		<dl>
			<dt><label for="resultat">{$lang.Resultat} :</dt>
			<dd><textarea name="bfs[resultat]" id="resultat" cols="50" rows="4">{$Bfs.resultat}</textarea></dd>
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
							<input type="text" name="matieres[{$smarty.foreach.foo.index}][note]" size="2" 
							{foreach $Notes as $data}
								{if $data.matiere_id == $Row.id}value="{$data.note}"{/if}
							{/foreach}
							/>
						</td>
					</tr>
					{/foreach}
				</table>
			</dd>
		</dl>
		
		<!-- Remarque -->
		<dl>
			<dt><label for="remarque">{$lang.Remarque} :</dt>
			<dd><textarea name="bfs[remarque]" id="remarque" cols="50" rows="4">{$Bfs.remarque}</textarea></dd>
		</dl>
		
		<!-- Avis equipe pedago -->
		<dl>
			<dt><label for="avis_equipe_peda">{$lang.Avis_equipe_pedagogique} :</dt>
			<dd><textarea name="bfs[avis_equipe_peda]" id="avis_equipe_peda" cols="50" rows="4">{$Bfs.avis_equipe_peda}</textarea></dd>
		</dl>
		
		<!-- Submit et champs caches -->
		<div class="center">
			<input type="hidden" name="bfs[edit_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="bfs[edit_on]" value="{$smarty.now}" />
			<input type="hidden" name="token" value="{$smarty.session.token}" />
			<input type="hidden" name="bfs[id]" value="{$Bfs.id}" />
			<input type="hidden" name="bfs[sportif_id]" value="{$Bfs.sportif_id}" />
			<input type="submit" value="{$lang.Enregistrer}" />
		</div>
	</form>
	{/strip}
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