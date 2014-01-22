<script type="text/javascript">
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAdd").validationEngine();
	$('#date_naissance').mask('99/99/9999');
	$('#date_entree').mask('99/99/9999');
	$('#date_sortie').mask('99/99/9999');
	
	$('#code_postal').autocomplete({
		source:'{getLink("ajax/getVilleByCp?nohtml=nohtml")}',
		minLength:3,
		dataType:"json",
		delay:0,
		select: function(e,ui){			
			$("#ville").val(ui.item.label);	
			$("#code_postal").val(ui.item.value);		
			return false;
		}		
	});
	
	$('#parent1_code_postal').autocomplete({
		source:'{getLink("ajax/getVilleByCp?nohtml=nohtml")}',
		minLength:3,
		dataType:"json",
		delay:0,
		select: function(e,ui){			
			$("#parent1_ville").val(ui.item.label);	
			$("#parent1_code_postal").val(ui.item.value);		
			return false;
		}		
	});
	
	$('#parent2_code_postal').autocomplete({
		source:'{getLink("ajax/getVilleByCp?nohtml=nohtml")}',
		minLength:3,
		dataType:"json",
		delay:0,
		select: function(e,ui){			
			$("#parent2_ville").val(ui.item.label);	
			$("#parent2_code_postal").val(ui.item.value);		
			return false;
		}		
	});
	
	/*.data( "autocomplete" )._renderItem = function( ul, item ) {
			return $( "<li></li>" )
			.data( "item.autocomplete", item )
			.append( "<a>" + item.value + "<br>" + item.label + "</a>" )
			.appendTo( ul );
	};*/
	
});

function CopyAdrJoueurToParent1(){
	$("#parent1_adresse").val($("#adresse").val());
	$("#parent1_code_postal").val($("#code_postal").val());
	$("#parent1_ville").val($("#ville").val());
	$("#parent1_telephone").val($("#telephone").val());
}

function CopyAdrJoueurToParent2(){
	$("#parent2_adresse").val($("#adresse").val());
	$("#parent2_code_postal").val($("#code_postal").val());
	$("#parent2_ville").val($("#ville").val());
	$("#parent2_telephone").val($("#telephone").val());
}

function CopyAdrpParent1ToParent2(){
	$("#parent2_adresse").val($("#parent1_adresse").val());
	$("#parent2_code_postal").val($("#parent1_code_postal").val());
	$("#parent2_ville").val($("#parent1_ville").val());
	$("#parent2_telephone").val($("#parent1_telephone").val());
}

function ShowFormEtab(){
	if( $("#formNewEtab").css('display') == 'none' ){
		$("#formNewEtab").css('display','block');
	}else{
		$("#formNewEtab").css('display','none');
	}
}

function ShowFormStructure(){
	if( $("#FormNewStructure").css('display') == 'none' ){
		$("#FormNewStructure").css('display','block');
	}else{
		$("#FormNewStructure").css('display','none');
	}
}

function ShowFormEntraineur(){
    if( $("#FormNewEntraineur").css('display') == 'none' ){
        $("#FormNewEntraineur").css('display','block');
    }else{
        $("#FormNewEntraineur").css('display','none');
    }
}

function checkForm(){
	var alerte = "";
	var error = 0;
	if( $("#etab_scolaire_id").val() == "" && $("#etab_nom").val() == "" ){
		alerte = "Veuillez specifier l etab scolaire\r\n";
		error++;
	}
	
	if( $("#structure_id").val() == "" && $("#structure_nom").val() == "" ){
		alerte = alerte +  "Veuillez specifier le club";
		error++;
	} 
	
	if( error > 0 ){
		alert(alerte);
		return false;
	}
	
	return true;
}

function pastName(input_id){
	$('#'+input_id).val( $('#nom').val() );
}

{if $config.sport_champ_structure == 1}
	/* Fonction de requiperation des equipes dans la structures */
	function getEquipeByClub(club_id){
		if( club_id == ''){
			club_id = 'none';
		}
		
		$.get(
			'{getLink("equipe/ajaxReloadEquipeFormJoueur/'+ club_id +'")}',{literal}
			{nohtml:'nohtml'},{/literal}
			function(data){ $('#equipes_liste').html(data); }
		)		
	}
{/if}

</script>
{strip}
{if $smarty.const.BREAD == 1}
	<ul class="breadcrumb">
		<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
		<li><a href="{getLink("joueur/index")}" title="{$lang.Joueur}">{$lang.Joueur}</a><span class="divider">/</span></li>
		<li>{$lang.Nouveau}</li>
	</ul>
{/if}

<div class="well">
	<form id="formAdd" method="post" onsubmit="return checkForm();" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<legend>{$lang.Joueur}</legend>

			<div class="container">
				<div class="row-fluid">
					<div class="span5">

						<div class="control-group">
							<label for="nom" class="control-label">{$lang.Nom} :</label>
							<div class="controls">
								<input type="text" name="joueur[nom]" id="nom" {if isset($smarty.post.joueur.nom)}value="{$smarty.post.joueur.nom}"{/if} class="validate[required]" />
							</div>
						</div>

						<div class="control-group">
							<label for="prenom" class="control-label">{$lang.Prenom} :</label>
							<div class="controls">
							<input type="text" name="joueur[prenom]" id="prenom" {if isset($smarty.post.joueur.prenom)}value="{$smarty.post.joueur.prenom}"{/if} class="validate[required]"/>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="sexe">{$lang.Sexe} :</label>
							<div class="controls">
								<select name="joueur[sexe]" id="sexe" class="validate[required]">
									<option value=""></option>
									<option value="h">{$lang.Homme}</option>
									<option value="f">{$lang.Femme}</option>
								</select>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="date_naissance">{$lang.Date_de_naissance} :</label>
							<div class="controls">
								<input type="text" name="joueur[date_naissance]" id="date_naissance" {if isset($smarty.post.joueur.date_naissance)}value="{$smarty.post.joueur.date_naissance}"{/if} class="validate[required,custom[date]]"/>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="lieu_naissance">{$lang.Lieu_de_naissance} :</label>
							<div class="controls">
								<input type="text" name="joueur[lieu_naissance]" id="lieu_naissance" {if isset($smarty.post.joueur.lieu_naissance)}value="{$smarty.post.joueur.lieu_naissance}"{/if} class="validate[required]"/>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="adresse">{$lang.Adresse}* :</label>
							<div class="controls"><textarea name="joueur[adresse]" id="adresse" class="validate[required]" rows="3" cols="40">{if isset($smarty.post.joueur.adresse)}{$smarty.post.joueur.adresse}{/if}</textarea></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="code_postal">{$lang.Code_postal}* :</label>
							<div class="controls"><input type="text" name="joueur[code_postal]" id="code_postal" {if isset($smarty.post.joueur.code_postal)}value="{$smarty.post.joueur.code_postal}"{/if} class="validate[required]" size="6"/></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="ville">{$lang.Ville}* :</label>
							<div class="controls"><input type="text" name="joueur[ville]" id="ville" {if isset($smarty.post.joueur.ville)}value="{$smarty.post.joueur.ville}"{/if} class="validate[required]" size="50"/></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="telephone">{$lang.Telephone} :</label>
							<div class="controls"><input type="text" name="joueur[telephone]" id="telephone" {if isset($smarty.post.joueur.telephone)}value="{$smarty.post.joueur.telephone}"{/if}/></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="portable">{$lang.Portable} :</label>
							<div class="controls"><input type="text" name="joueur[portable]" id="portable" {if isset($smarty.post.joueur.portable)}value="{$smarty.post.joueur.portable}"{/if}/></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="email">{$lang.Email} :</label>
							<div class="controls"><input type="text" name="joueur[email]" id="email" {if isset($smarty.post.joueur.email)}value="{$smarty.post.joueur.email}"{/if} class="validate[custom[email]]"/></div>
						</div>

					</div><!-- /span5 -->

					<div class="span5">

						{if $config.multi_site == 1}
						<div class="control-group">
							<label class="control-label" for="site_id">{$lang.Site}* :</label>
							<div class="controls">
								<select name="joueur[site_id]" id="site_id" class="validate[required]">
									<option></option>
									{foreach $Sites as $Row}
									<option value="{$Row.id}">{$Row.nom}</option>
									{/foreach}
								</select>
							</div>
						</div>
						{/if}

						<div class="control-group">
							<label class="control-label" for="num_licence">{$lang.Numero_de_licence} :</label>
							<div class="controls">
								<input type="text" name="joueur[num_licence]" id="num_licence" {if isset($smarty.post.joueur.num_licence)}value="{$smarty.post.joueur.num_licence}"{/if}/>
							</div>
						</div>

						<!-- Numero homologation -->
						<div class="control-group">
							<label class="control-label" for="numero_homologation">{$lang.Numero_homologation} :</label>
							<div class="controls">
								<input type="text" name="joueur[numero_homologation]" id="numero_homologation" {if isset($smarty.post.joueur.numero_homologation)}value="{$smarty.post.joueur.numero_homologation}"{/if}/>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="date_entree">{$lang.Date_entree}* :</label>
							<div class="controls">
								<input type="text" name="joueur[date_entree]" id="date_entree" {if isset($smarty.post.joueur.date_entree)}value="{$smarty.post.joueur.date_entree}"{/if} class="validate[required,custom[date]]"/>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="date_sortie">{$lang.Date_de_sortie} :</label>
							<div class="controls">
								<input type="text" name="joueur[date_sortie]" id="date_sortie" {if isset($smarty.post.joueur.date_sortie)}value="{$smarty.post.joueur.date_sortie}"{/if} class="validate[custom[date]]"/>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="taille">{$lang.Taille} :</label>
							<div class="controls">
								<div class="input-append">
									<input type="text" name="jtaille[taille]" id="taille" size="3"/><span class="add-on">cm</span>
								</div>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="poids">{$lang.Poids} :</label>
							<div class="controls">
								<div class="input-append">
									<input type="text" name="jpoids[poids]" id="poids" size="3"/><span class="add-on">Kg</span>
								</div>
							</div>
						</div>

						<div class="control-group">
                			<label class="control-label" for="photo">{$lang.Photo} :</label>
              				<div class="controls"><input type="file" name="photo" /></div>
            			</div>

					</div><!-- /span5 -->

				</div><!-- /row-fluid -->
			
			</div><!-- /container -->

		</fieldset>

		
		{if $config.joueur_form_show_parent == 1}
		<!-- PARENTS -->
		<fieldset>
			<div class="container">

			<legend>{$lang.Parent}</legend>
			<div class="control-group">
				<label class="control-label" for="parent_situation">{$lang.Situation} :</label>
				<div class="controls">
					<select name="joueur[parent_situation]" id="parent_situation">
						<option value=""></option>
						<option value="ensemble">{$lang.Ensemble}</option>
						<option value="separee">{$lang.Separe}</option>
					</select>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="span5">
					<h4>{$lang.Pere}</h4>
					<div class="control-group">
						<label class="control-label" for="parent1_nom">{$lang.Nom} :</label>
						<div class="controls"><input type="text" name="parent1[nom]" id="parent1_nom" /> <a href="javascript:pastName('parent1_nom');"><img src="{$config.url}{$config.url_dir}web/images/past.png" alt="" style="width:16px;" /></a></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_prenom">{$lang.Prenom} :</label>
						<div class="controls"><input type="text" name="parent1[prenom]" id="parent1_prenom" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_adresse">{$lang.Adresse} :</label>
						<div class="controls"><textarea name="parent1[adresse]" id="parent1_adresse" rows="3" cols="40"></textarea><br/><a href="javascript:CopyAdrJoueurToParent1();">{$lang.Adresse_identique_joueur}</a></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_code_postal">{$lang.Code_postal} :</label>
						<div class="controls"><input type="text" name="parent1[code_postal]" id="parent1_code_postal" size="6" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_ville">{$lang.Ville} :</label>
						<div class="controls"><input type="text" name="parent1[ville]" id="parent1_ville" size="50"/></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_telephone">{$lang.Telephone} :</label>
						<div class="controls"><input type="text" name="parent1[telephone]" id="parent1_telephone" autocomplete="off"/></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_portable">{$lang.Portable} :</label>
						<div class="controls"><input type="text" name="parent1[portable]" id="parent1_portable" autocomplete="off" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_emploi">{$lang.Profession} :</label>
						<div class="controls"><input type="text" name="parent1[emploi]" id="parent1_profession" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent1_telephone_pro">{$lang.Telephone} pro :</label>
						<div class="controls"><input type="text" name="parent1[telephone_pro]" id="parent1_telephone_pro" /></div>
					</div>
				</div><!-- /span5 -->
				<div class="span5">
				<h4>{$lang.Mere}</h4>
					<div class="control-group">
						<label class="control-label" for="parent2_nom">{$lang.Nom} :</label>
						<div class="controls"><input type="text" name="parent2[nom]" id="parent2_nom" /> <a href="javascript:pastName('parent2_nom');"><img src="{$config.url}{$config.url_dir}web/images/past.png" alt="" style="width:16px;" /></a></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_prenom">{$lang.Prenom} :</label>
						<div class="controls"><input type="text" name="parent2[prenom]" id="parent2_prenom" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_adresse">{$lang.Adresse} :</label>
						<div class="controls"><textarea name="parent2[adresse]" id="parent2_adresse" rows="3" cols="40"></textarea><br/><a href="javascript:CopyAdrJoueurToParent2();">{$lang.Adresse_identique_joueur}</a> - <a href="javascript:CopyAdrpParent1ToParent2();">{$lang.Adresse_identique_pere}</a></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_code_postal">{$lang.Code_postal} :</label>
						<div class="controls"><input type="text" name="parent2[code_postal]" id="parent2_code_postal" size="6"/></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_ville">{$lang.Ville} :</label>
						<div class="controls"><input type="text" name="parent2[ville]" id="parent2_ville" size="50" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_telephone">{$lang.Telephone} :</label>
						<div class="controls"><input type="text" name="parent2[telephone]" id="parent2_telephone" autocomplete="off" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_portable">{$lang.Portable} :</label>
						<div class="controls"><input type="text" name="parent2[portable]" id="parent2_portable" autocomplete="off"/></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_emploi">{$lang.Profession} :</label>
						<div class="controls"><input type="text" name="parent2[emploi]" id="parent2_profession" /></div>
					</div>
					<div class="control-group">
						<label class="control-label" for="parent2_telephone_pro">{$lang.Telephone} pro :</label>
						<div class="controls"><input type="text" name="parent2[telephone_pro]" id="parent2_telephone_pro" /></div>
					</div>
				</div><!-- /span5-->
			</div><!-- /row -->
		</div><!-- /container -->	
		</fieldset>
		{/if}
		
		{if $config.joueur_suivi_scolaire == 1 && $InfosInstall.i_type == 'full'}
		<fieldset>
			<legend>{$lang.Scolaire}</legend>
			<div class="container">
				<div class="row-fluid">
					<div class="span5">

						<div class="control-group">
							<label class="control-label" for="etab_scolaire">{$lang.Etablissement} :</label>
							<div class="controls">
								<select name="joueur[etab_scolaire_id]" id="etab_scolaire_id">
									<option value=""></option>
									{foreach $EtabsScolaire as $Row}
									<option value="{$Row.id}">{$Row.nom}</option>
									{/foreach}
								</select> <a href="javascript:ShowFormEtab();"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="suivi_scolaire_identifiant">{$lang.Identifiant_portail_note} :</label>
							<div class="controls"><input type="text" name="joueur[suivi_scolaire_identifiant]" id="suivi_scolaire_identifiant" value="" /></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="suivi_scolaire_password">{$lang.Password_portail_note} :</label>
							<div class="controls"><input type="text" name="suivi_scolaire_password" id="suivi_scolaire_password" value="" /></div>
						</div>
						
						<div class="control-group">
							<label class="control-label" for="classe">{$lang.Classe} :</label>
							<div class="controls"><input type="text" name="joueur[classe]" id="classe" {if isset($smarty.post.joueur.classe)}value="{$smarty.post.joueur.classe}"{/if} /></div>
						</div>

						<div class="control-group">
							<label class="control-label" for="diplome_prepare">{$lang.Diplome_prepare} :</label>
							<div class="controls"><input type="text" name="joueur[diplome_prepare]" id="diplome_prepare" {if isset($smarty.post.joueur.diplome_prepare)}value="{$smarty.post.joueur.diplome_prepare}"{/if} /></div>
						</div>

					</div><!-- /span5 -->

					<div class="span5">
						<div id="formNewEtab" style="display:none;">
							<div class="control-group">
								<label class="control-label" for="etab_nom">{$lang.Nom} :</label>
								<div class="controls"><input type="text" name="etab[nom]" id="etab_nom" /></div>
							</div>

							<div class="control-group">
								<label class="control-label" for="etab_adresse">{$lang.Adresse} :</label>
								<div class="controls"><textarea name="etab[adresse]" id="etab_adresse" rows="1">{if isset($smarty.post.etab.adresse) && $smarty.post.etab.adresse != ""}{$smarty.post.etab.adresse}{/if}</textarea></div>
							</div>

							<div class="control-group">
								<label class="control-label" for="etab_code_postal">{$lang.Code_postal} :</label>
								<div class="controls"><input type="text" name="etab[code_postal]" id="etab_code_postal" {if isset($smarty.post.etab.code_postal) && $smarty.post.etab.code_postal != ""}value="{$smarty.post.etab.code_postal}"{/if}/></div>
							</div>

							<div class="control-group">
								<label class="control-label" for="etab_ville">{$lang.Ville} :</label>
								<div class="controls"><input type="text" name="etab[ville]" id="etab_ville" {if isset($smarty.post.etab.ville) && $smarty.post.etab.ville != ""}value="{$smarty.post.etab.ville}"{/if} /></div>
							</div>
							<div class="control-group">
								<label class="control-label" for="etab_telephone">{$lang.Telephone} :</label>
								<div class="controls"><input type="text" name="etab[telephone]" id="etab_ville" {if isset($smarty.post.etab.telephone) && $smarty.post.etab.telephone != ""}value="{$smarty.post.etab.telephone}"{/if} /></div>
							</div>
							<div class="control-group">
								<label class="control-label" for="etab_url_portail_note">{$lang.Adresse_portail_note} :</label>
								<div class="controls"><input type="url" name="etab[url_portail_note]" id="etab_url_portail_note" value="" /></div>
							</div>
						
						</div><!-- /#formNewEtab -->
					</div><!-- /span5 -->

				</div><!-- /row-fluid -->
			</div><!-- /container -->
		</fieldset>
		{/if}
		
		<fieldset>
			<legend>{$config.sport}</legend>

				<div class="container">
					<div class="row-fluid">
						<div class="span5">

							{if $config.sport_champ_structure == 1}
							<div class="control-group">
								<label class="control-label" for="structure_id">{$lang.Structure_club} :</label>
								<div class="controls">
									<select name="joueur[structure_id]" id="structure_id" onchange="getEquipeByClub($('#structure_id').val())">
										<option value=""></option>
										{foreach $Structures as $Row}
										<option value="{$Row.id}">{$Row.nom}</option>
										{/foreach}
									</select> <a href="javascript:ShowFormStructure();"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
								</div>
							</div>				
							{/if}

							{if count($Equipes) > 0}				
							<div class="control-group">
								<label class="control-label" for="equipe_id">{$lang.Equipe} :</label>
								<div class="controls">
									<select name="equipe[equipe_id]" id="equipe_id">
										<option></option>
										{foreach $Equipes as $Row}
										<option value="{$Row.id}">{if !empty($Row.structure)}{$Row.structure}&nbsp;-&nbsp;{/if}{$Row.nom}</option>
										{/foreach}
									</select>
								</div>
							</div>
							{/if}

							{if $config.sport_champ_selection == 1}
							<div class="control-group">
								<label class="control-label" for="selection">{$lang.Selection} :</label>
								<div class="controls"><input type="text" name="joueur[selection]" id="selection" {if isset($smarty.post.joueur.selection)}value="{$smarty.post.joueur.selection}"{/if} /></div>
							</div>
							{/if}

							{if $config.sport_champ_poste == 1}
							<div class="control-group">
								<label class="control-label" for="poste">{$lang.Poste} :</label>
								<div class="controls"><input type="text" name="joueur[poste]" id="poste" {if isset($smarty.post.joueur.poste)}value="{$smarty.post.joueur.diplome_prepare}"{/if} /></div>
							</div>
							{/if}

						</div><!-- /span5 -->
						<div class="span5">
							{if $config.sport_champ_structure == 1}
							<div id="FormNewStructure" style="display:none;">
								<div class="control-group">
									<label class="control-label" for="structure_nom">{$lang.Nom} :</label>
									<div class="controls"><input type="text" name="structure[nom]" id="structure_nom" /></div>
								</div>
								<div class="control-group">
									<label class="control-label" for="structure_adresse">{$lang.Adresse} :</label>
									<div class="controls"><textarea name="structure[adresse]" id="structure_adresse" rows="3" cols="40">{if isset($smarty.post.structure.adresse) && $smarty.post.structure.adresse != ""}{$smarty.post.structure.adresse}{/if}</textarea></div>
								</div>
								<div class="control-group">
									<label class="control-label" for="structure_code_postal">{$lang.Code_postal} :</label>
									<div class="controls"><input type="text" name="structure[code_postal]" id="structure_code_postal" {if isset($smarty.post.structure.code_postal) && $smarty.post.structure.code_postal != ""}value="{$smarty.post.structure.code_postal}"{/if}/></div>
								</div>
								<div class="control-group">
									<label class="control-label" for="structure_ville">{$lang.Ville} :</label>
									<div class="controls"><input type="text" name="structure[ville]" id="structure_ville" {if isset($smarty.post.structure.ville) && $smarty.post.structure.ville != ""}value="{$smarty.post.structure.ville}"{/if} /></div>
								</div>
								<div class="control-group">
									<label class="control-label" for="structure_telephone">{$lang.Telephone} :</label>
									<div class="controls"><input type="text" name="structure[telephone]" id="structure_ville" {if isset($smarty.post.structure.telephone) && $smarty.post.structure.telephone != ""}value="{$smarty.post.structure.telephone}"{/if} /></div>
								</div>
							</div><!-- /#FormNewStructure -->
							{/if}
						</div><!-- /span5 -->
					</div><!-- /row-fluid -->
				</div><!-- /container -->
            </fieldset>
            
            {* ENTRAINEUR *}
            {if $config.joueur_entraineur == 1}

            <fieldset>
            	<legend>{$lang.Entraineur}</legend>
            	<div class="container">
            		<div class="row-fluid">
            			<div class="span5">
            				<div class="control-group">
			                    <label class="control-label" for="entraineur_id]">{$lang.Entraineur} :</label>
			                    <div class="controls">
			                        <select name="joueur[entraineur_id]" id="entraineur_id">
			                            <option></option>
			                            {foreach $Entraineurs as $Row}
			                            <option value="{$Row.id}">{$Row.nom} {$Row.prenom}</option>
			                            {/foreach}
			                        </select>
			                        <a href="javascript:ShowFormEntraineur();"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
			                    </div>
			                </div>
            			</div><!-- /span5 -->
            			<div class="span5">
            				<div id="FormNewEntraineur" style="display:none;">
			                    <div class="control-group">
			                        <label class="control-label" for="entraineur_nom">{$lang.Nom}</label>
			                        <div class="controls"><input type="text" name="entraineur[nom]" id="entraineur_nom" value="" size="50" /></div>
			                    </div>
			                    <div class="control-group">
			                        <label class="control-label" for="entraineur_prenom">{$lang.Prenom}</label>
			                        <div class="controls"><input type="text" name="entraineur[prenom]" id="entraineur_prenom" value="" size="50" /></div>
			                    </div>
			                    <div class="control-group">
			                        <label class="control-label" for="entraineur_telephone">{$lang.Telephone} :</label>
			                        <div class="controls"><input type="text" name="entraineur[telephone]" id="entraineur_telephone" value="" size="12"/></div>
			                    </div>
			                    <div class="control-group">
			                        <label class="control-label" for="entraineur_email">{$lang.Email} :</label>
			                        <div class="controls"><input type="email" name="entraineur[email]" id="entraineur_email" class="validate[custom[email]]" size="50" /></div>
			                    </div>
			                </div>
            			</div><!-- /span5 -->
            		</div><!-- /row_fluid -->
            	</div><!-- /container -->
            </fieldset>
			{/if}
			{if !empty($Form)}
			<hr/>
			<div>
				{$Form}
			</div>
			{/if}
		<div class="center">
            <input type="hidden" name="joueur[creat_by]" value="{$smarty.session.utilisateur.id}" />
            <input type="hidden" name="joueur[edit_by]" value="{$smarty.session.utilisateur.id}" />
            <input type="hidden" name="joueur[creat_on]" value="{$smarty.now}" />
            <input type="hidden" name="joueur[edit_on]" value="{$smarty.now}" />
			<input type="hidden" name="joueur[actif]" value="1" />
			<input type="submit" value="{$lang.Enregistrer}" class="btn btn-primary" />
		</div>
	</form>
</div>
{/strip}
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_naissance" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
		$( "#date_entree" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
		$( "#date_sortie" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_naissance" ).datepicker( "option", "showAnim", "clip" );
        $( "#date_entree" ).datepicker( "option", "showAnim", "clip" );
        $( "#date_sortie" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>