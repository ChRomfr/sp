<ul class="breadcrumb">
	<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li><a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a><span class="divider">/</span></li>
	<li>{$lang.Preferences}</li>
</ul>
<div class="well">
<form class="form" method="post">
	
	<fieldset>
		<legend>{$lang.Structure}</legend>
		<dl>
			<dt><label for="config_structure_name">{$lang.Structure} :</label></dt>
			<dd><input type="text" name="config[structure_name]" id="config_structure_name" value="{$config.structure_name}" size="50" required/></dd>
		</dl>
		
		<dl>
			<dt><label for="multi_site">{$lang.Multi_site} :</label></dt>
			<dd>
				<select name="config[multi_site]" id="multi_site">
					<option value="1" {if $config.multi_site == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.multi_site == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
				<a href="#" class="info"><img src="{$config.url}{$config.url_dir}web/images/helpinfo.png" alt="?" /><span>{$lang.help_multi_site}</span></a>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="sport_structure">{$lang.Multi_structure_club} :</label></dt>
			<dd>
				<select name="config[sport_champ_structure]" id="sport_structure">
					<option value="1" {if $config.sport_champ_structure == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.sport_champ_structure == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
				<a href="#" class="info"><img src="{$config.url}{$config.url_dir}web/images/helpinfo.png" alt="?" /><span>{$lang.help_champ_structure}</span></a>
			</dd>
		</dl>
				
		<dl>
			<dt><label for="config_email_expediteur">{$lang.Adresse_email_pour_les_envoies} :</label></dt>
			<dd>
				<input type="email" name="config[email_expediteur]" id="config_email_expediteur" value="{$config.email_expediteur}" size="50" class="validate[required,custom[email]]" required/>
				<a href="#" class="info"><img src="{$config.url}{$config.url_dir}web/images/helpinfo.png" alt="?" /><span>{$lang.help_email_setting}</span></a>
			</dd>
		</dl>
	</fieldset>	
	
	<fieldset>
		<legend>{$lang.Discipline}</legend>
		<dl>
			<dt><label for="config_sport">{$lang.Sport} :</label></dt>
			<dd>
				<input type="text" name="config[sport]" id="config_sport" value="{$config.sport}" size="50" required/>
				<a href="#" class="info"><img src="{$config.url}{$config.url_dir}web/images/helpinfo.png" alt="?" /><span>{$lang.help_sport_pratique}</span></a>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="sport_selection">{$lang.Champ_selection} :</label></dt>
			<dd>
				<select name="config[sport_champ_selection]" id="sport_selection">
					<option value="1" {if $config.sport_champ_selection == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.sport_champ_selection == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
			</dd>
		</dl>
		
		<dl>
			<dt><label for="sport_poste">{$lang.Champ_poste} :</label></dt>
			<dd>
				<select name="config[sport_champ_poste]" id="sport_selection">
					<option value="1" {if $config.sport_champ_poste == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.sport_champ_poste == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
			</dd>
		</dl>
	</fieldset>
	
	
	<fieldset>
		<legend>{$lang.Joueurs}</legend>
		<dl>
			<dt><label for="">{$lang.Environnement_familiale} :</label></dt>
			<dd>
				<select name="config[joueur_form_show_parent]">
					<option value="1" {if $config.joueur_form_show_parent == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.joueur_form_show_parent == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
			</dd>
		</dl>
		{if $InfosInstall.i_type == 'full'}
		<dl>
			<dt><label for="">{$lang.Suivi_scolaire} :</label></dt>
			<dd>
				<select name="config[joueur_suivi_scolaire]">
					<option value="1" {if $config.joueur_suivi_scolaire == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.joueur_suivi_scolaire == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
			</dd>
		</dl>
		{else}
			<input type="hidden" name="config[joueur_suivi_scolaire]" value="0" />
		{/if}
				
		<dl>
			<dt><label for="">{$lang.Entraineur} :</label></dt>
			<dd>
				<select name="config[joueur_entraineur]">
					<option value="1" {if $config.joueur_entraineur == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.joueur_entraineur == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
				<a href="#" class="info"><img src="{$config.url}{$config.url_dir}web/images/helpinfo.png" alt="?" /><span>{$lang.help_entraineurs_setting}</span></a>
			</dd>		
		</dl>
	</fieldset>
	<!-- Parametrage des entraintements -->
	<fieldset>
		<legend>{$lang.Configuration_des_entrainements}</legend>
		{if $InfosInstall.i_type == 'full'}
		<dl>
			<dt><label for="">{$lang.Differencier_les_types_entraintements} :</label></dt>
			<dd>
				<select name="config[entrainement_type]" id="entrainement_type">
					<option value="0">{$lang.Non}</option>
					<option value="1">{$lang.Oui}</option>
				</select>
			</dd>
		</dl>
		{/if}
		<dl>
			<dt><label for="">{$lang.Filtrer_les_sportifs_par_annee} :</label></dt>
			<dd>
				<select name="config[entrainement_filtre_annee]" id="entrainement_filtre_annee">
					<option value="0">{$lang.Non}</option>
					<option value="1">{$lang.Oui}</option>
				</select>
			</dd>
		</dl>

		<dl>
			<dt><label for="">{$lang.Filtrer_les_sportifs_par_equipe} :</label></dt>
			<dd>
				<select name="config[entrainement_filtre_equipe]" id="entrainement_filtre_equipe">
					<option value="0">{$lang.Non}</option>
					<option value="1">{$lang.Oui}</option>
				</select>
			</dd>
		</dl>
	</fieldset>

	{* PARAMETRAGE TEST *}
	<fieldset>
		<legend>{$lang.Test_physique}</legend>
		<dl>
			<dt><label for="show_graph_detail_test">{$lang.Graphique_test_adm}</label></dt>
			<dd>
				<select name="config[show_graph_detail_test]">
					<option value="1" {if $config.show_graph_detail_test == 1}selected="selected"{/if}>{$lang.Oui}</option>
					<option value="0" {if $config.show_graph_detail_test == 0}selected="selected"{/if}>{$lang.Non}</option>
				</select>
			</dd>
		</dl>
	</fieldset>
	<div class="center">
		{if $InfosInstall.i_type == 'light'}
		<input type="hidden" name="config[entrainement_type]" value="0" />
		{/if}
		<input type="submit" value="{$lang.Enregistrer}" class="btn" />
	</div>
</form>
</div>