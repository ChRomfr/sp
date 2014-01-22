{if count($Formations) > 0 && count($Personnes) > 0}
	<form class="form" method="post" action="{getLink("scolaire/dppAdd/{$Sportif.id}")}">
		<h1>{$lang.Nouveau_dpp}</h1>
		<!-- Date du DPP -->
		<dl>
			<dt><label for="date">{$lang.Date}</label></dt>
			<dd><input type="text" name="dpp[date_dpp]" value="" id="date_dpp" size="10"/></dd>
		</dl>
		
		<!-- Personnes du cf rencontre -->
		<dl>
			<dt><label for="">{$lang.Personnes_rencontrees_cf}</dt>
			<dd>
				<select name="dpp[personne_cf_1]" id="personne_cf_1" class="validate[required]" requeried>
					<option value=""></option>
					{foreach $Personnes as $Row}
					<option value="{$Row.id}">{$Row.nom} {$Row.prenom}</option>
					{/foreach}
				</select>
				<br/>
				<select name="dpp[personne_cf_2]" id="personne_cf_2">
					<option value=""></option>
					{foreach $Personnes as $Row}
					<option value="{$Row.id}">{$Row.nom} {$Row.prenom}</option>
					{/foreach}
				</select>
				<br/>
				<select name="dpp[personne_cf_3]" id="personne_cf_3">
					<option value=""></option>
					{foreach $Personnes as $Row}
					<option value="{$Row.id}">{$Row.nom} {$Row.prenom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		
		<!-- personne conseil peda -->
		<dl>
			<dt><label for="personne_conseil_ped">{$lang.Personnes_rencontrees_cp} :</dt>
			<dd><textarea name="dpp[personne_conseil_ped]" id="personne_conseil_ped" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Liste des formations en cour ... -->
		<dl>
			<dt><label for="formation_id">{$lang.Formation} :</label></dt>
			<dd>			
				<select name="dpp[formation_id_current]" id="formation_id" required class="validate[required]">
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
			<dd><textarea name="dpp[diplome_obtenu]" id="diplome_obtenu" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Formation effecue -->
		<dl>
			<dt><label for="formation_effectuee">{$lang.Formation_effectuee} :</dt>
			<dd><textarea name="dpp[formation_effectuee]" id="formation_effectuee" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Definition du projet -->
		<dl>
			<dt><label for="definition_projet">{$lang.Definition_du_projet} :</dt>
			<dd><textarea name="dpp[definition_projet]" id="definition_projet" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- objectif_plan_formation -->
		<dl>
			<dt><label for="objectif_plan_formation">{$lang.Objectif} :</dt>
			<dd><textarea name="dpp[objectif_plan_formation]" id="objectif_plan_formation" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- plan 0 -->
		<dl>
			<dt><label for="plan_n0">{$lang.Plan_n} 0 :</dt>
			<dd><textarea name="dpp[plan_n0]" id="plan_n0" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- plan +1 -->
		<dl>
			<dt><label for="plan_n0">{$lang.Plan_n} +1 :</dt>
			<dd><textarea name="dpp[plan_n1]" id="plan_n1" cols="50" rows="4"></textarea></dd>
		</dl>
		
		<!-- Submit et champs caches -->
		<div class="center">
			<input type="hidden" name="dpp[add_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="dpp[add_on]" value="{$smarty.now}" />
			<input type="hidden" name="dpp[edit_by]" value="{$smarty.session.utilisateur.id}" />
			<input type="hidden" name="dpp[edit_on]" value="{$smarty.now}" />
			<input type="hidden" name="token" value="{$smarty.session.token}" />
			<input type="submit" value="{$lang.Enregistrer}" />
		</div>
	</form>
	
	<script type="text/javascript">
	<!--
		$(function() {
			$( "#date_dpp" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
			$( "#date_dpp" ).datepicker( "option", "showAnim", "clip" );
		});
	//-->
	</script>
	
{else}
	{$lang.Vous_devez_d_abord_ajouter_une_formation_au_sportif}		
{/if}