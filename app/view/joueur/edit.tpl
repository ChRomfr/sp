<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
    
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
    
});

function checkForm(){
    var alerte = "";
    var error = 0; 
    
    if( error > 0 ){
        alert(alerte);
        return false;
    }
    
    return true;
}

</script>
{strip}
{if $smarty.const.BREAD == 1}
    <ul class="breadcrumb">
        <li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
        <li><a href="{getLink("joueur/index")}" title="{$lang.Joueur}">{$lang.Joueur}</a><span class="divider">/</span></li>
        <li><a href="{getLink("joueur/fiche/{$Joueur->id}")}" title="{$Joueur->prenom} {$Joueur->nom}">{$Joueur->prenom} {$Joueur->nom}</a><span class="divider">/</span>
        <li>{$lang.Edition}</li>
    </ul>
{/if}

<div class="well">
    <form id="formEdit" method="post" onsubmit="return checkForm();" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>

			{if $config.multi_site == 1}
			<div class="control-group">
				<label class="control-label" for="site_id">{$lang.Site}* :</label>
				<div class="controls">
					<select name="joueur[site_id]" id="site_id" class="validate[required]">
						<option></option>
						{foreach $Sites as $Row}
						<option value="{$Row.id}" {if $Row.id == $Joueur->site_id}selected="selected"{/if}>{$Row.nom}</option>
						{/foreach}
					</select>
				</div>
			</div>
			{/if}

            <legend>{$lang.Joueur}</legend>

            <div class="container">
                <div class="row-fluid">
                    <div class="span5">

                        <div class="control-group">
                            <label class="control-label" for="nom">{$lang.Nom} :</label>
                            <div class="controls"><input type="text" name="joueur[nom]" id="nom" value="{$Joueur->nom}" class="validate[required]"/></div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="prenom">{$lang.Prenom} :</label>
                            <div class="controls"><input type="text" name="joueur[prenom]" id="prenom" value="{$Joueur->prenom}" class="validate[required]"/></div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="sexe">{$lang.Sexe} :</label>
                            <div class="controls">
                                <select name="joueur[sexe]" id="sexe" class="validate[required]">
                                    <option value=""></option>
                                    <option value="h" {if $Joueur->sexe == "h"}selected="selected"{/if}>{$lang.Homme}</option>
                                    <option value="f" {if $Joueur->sexe == "f"}selected="selected"{/if}>{$lang.Femme}</option>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="date_naissance">{$lang.Date_de_naissance} :</label>
                            <div class="controls"><input type="text" name="joueur[date_naissance]" id="date_naissance" value="{$Joueur->date_naissance|date_format:$config.format_date_day}" class="validate[required,custom[date]]"/></div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label" for="lieu_naissance">{$lang.Lieu_de_naissance} :</label>
                            <div class="controls"><input type="text" name="joueur[lieu_naissance]" id="lieu_naissance" value="{$Joueur->lieu_naissance}" class="validate[required]"/></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="adresse">{$lang.Adresse} :</label>
                            <div class="controls"><textarea name="joueur[adresse]" id="adresse" class="validate[required]" rows="3" cols="40">{$Joueur->adresse}</textarea></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="code_postal">{$lang.Code_postal} :</label>
                            <div class="controls"><input type="text" name="joueur[code_postal]" id="code_postal" value="{$Joueur->code_postal}" class="validate[required]"/></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="ville">{$lang.Ville} :</label>
                            <div class="controls"><input type="text" name="joueur[ville]" id="ville" value="{$Joueur->ville}" class="validate[required]"/></div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label" for="telephone">{$lang.Telephone} :</label>
                            <div class="controls"><input type="text" name="joueur[telephone]" id="telephone" value="{$Joueur->telephone}" /></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="portable">{$lang.Portable} :</label>
                            <div class="controls"><input type="text" name="joueur[portable]" id="portable" value="{$Joueur->portable}" /></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="email">{$lang.Email} :</label>
                            <div class="controls"><input type="text" name="joueur[email]" id="email" value="{$Joueur->email}" class="validate[custom[email]]"/></div>
                        </div>


                    </div><!-- /span5 -->
                    <div class="span5">

                        <div class="control-group">
                            <label class="control-label" for="num_licence">{$lang.Numero_de_licence} :</label>
                            <div class="controls"><input type="text" name="joueur[num_licence]" id="num_licence" value="{$Joueur->num_licence}"/></div>
                        </div>

                        <!-- Numero homologation -->
                        <div class="control-group">
                            <label class="control-label" for="numero_homologation">{$lang.Numero_homologation} :</label>
                            <div class="controls"><input type="text" name="joueur[numero_homologation]" id="numero_homologation" value="{$Joueur->numero_homologation}"/></div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="date_entree">{$lang.Date_entree} :</label>
                            <div class="controls"><input type="text" name="joueur[date_entree]" id="date_entree" value="{$Joueur->date_entree|date_format:$config.format_date_day}"} class="validate[required,custom[date]]"/></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="date_sortie">{$lang.Date_de_sortie} :</label>
                            <div class="controls"><input type="text" name="joueur[date_sortie]" id="date_sortie" value="{$Joueur->date_sortie|date_format:$config.format_date_day}" class="validate[custom[date]]"/></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="actif">{$lang.Actif} :</label>
                            <div class="controls">
                                <select name="joueur[actif]" id="actif" required class="validate[required]">
                                    <option value="1" {if $Joueur->actif == 1}selected="selected"{/if}>{$lang.Oui}</option>
                                    <option value="0" {if $Joueur->actif != 1}selected="selected"{/if}>{$lang.Non}</option>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="photo">{$lang.Photo} :</label>
                            <div class="controls"><input type="file" name="photo" /></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">{$lang.Supprimer_la_photo} :</label>
                            <div class="controls"><input type="checkbox" value="1" name="delete_photo" /></div>
                        </div>

                    </div><!-- /span5 -->
                </div><!-- /row-fluid -->
            </div><!-- /container -->
        </fieldset>
    
        <!-- START PARENT -->
        <fieldset>
            <legend>{$lang.Parents}</legend>

            <div class="control-group">
                <label class="control-label" for="parent_situation">{$lang.Situation} :</label>
                <div class="controls">
                    <select name="joueur[parent_situation]" id="parent_situation">
                        <option value=""></option>
                        <option value="ensemble" {if $Joueur->parent_situation == 'ensemble'}selected="selected"{/if}>{$lang.Ensemble}</option>
                        <option value="separee" {if $Joueur->parent_situation == 'separee'}selected="selected"{/if}>{$lang.Separe}</option>
                    </select>
                </div>
            </div>

        </fieldset>
        <!-- END PARENT -->        
        
        {if $config.joueur_suivi_scolaire == 1}
		<!-- START SCOLAIRE -->
        <fieldset>
            <legend>{$lang.Scolaire}</legend>

            <div class="control-group">
                <label class="control-label" for="classe">{$lang.Classe} :</label>
                <div class="controls"><input type="text" name="joueur[classe]" id="classe"  value="{$Joueur->classe}" /></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="diplome_prepare">{$lang.Diplome_prepare} :</label>
                <div class="controls"><input type="text" name="joueur[diplome_prepare]" id="diplome_prepare" value="{$Joueur->diplome_prepare}" /></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="etab_scolaire_id">{$lang.Etablissement} :</label>
                <div class="controls">
                    <select name="joueur[etab_scolaire_id]" id="etab_scolaire_id">
                        <option></option>
                        {foreach $EtabsScolaire as $Row}
                        <option value="{$Row.id}" {if $Row.id == $Joueur->etab_scolaire_id}selected="selected"{/if}>{$Row.nom}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            {* INFORMATION POUR PORTAIL NOTE *}
            <div class="control-group">
                <label class="control-label" for="suivi_scolaire_identifiant">{$lang.Identifiant_portail_note} :</label>
                <div class="controls"><input type="text" name="joueur[suivi_scolaire_identifiant]" id="suivi_scolaire_identifiant" value="{$Joueur->suivi_scolaire_identifiant}" /></div>
            </div>
            <div class="control-group">
                <label class="control-label" for="suivi_scolaire_password">{$lang.Password_portail_note} :</label>
                <div class="controls"><input type="text" name="joueur[suivi_scolaire_password]" id="suivi_scolaire_password" value="{$Joueur->suivi_scolaire_password}" /></div>
            </div>

        <!-- END SCOLAIRE -->
        {/if}

        <fieldset>
            <legend>{$config.sport}</legend>
            {if $config.sport_champ_selection == 1}
            <div class="control-group">
                <label class="control-label" for="selection">{$lang.Selection} :</label>
                <div class="controls"><input type="text" name="joueur[selection]" id="selection" value="{$Joueur->selection}" /></div>
            </div>
            {/if}
            
            {if $config.sport_champ_poste == 1}
            <div class="control-group">
                <label class="control-label" for="poste">{$lang.Poste} :</label>
                <div class="controls"><input type="text" name="joueur[poste]" id="poste" value="{$Joueur->poste}" /></div>
            </div>
            {/if}
                
            {if $config.sport_champ_structure == 1}
            <div class="control-group">
                <label class="control-label" for="structure_id">{$lang.Structure} :</label>
                <div class="controls">
                    <select name="joueur[structure_id]" id="structure_id">
                        <option></option>
                        {foreach $Structures as $Row}
                        <option value="{$Row.id}" {if $Row.id == $Joueur->structure_id}selected="selected"{/if}>{$Row.nom}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
                {/if}
                
                {if $config.joueur_entraineur == 1}
            <div class="control-group">
                <label class="control-label" for="entraineur_id]">{$lang.Entraineur} :</label>
                <div class="controls">
                    <select name="joueur[entraineur_id]" id="entraineur_id">
                        <option></option>
                        {foreach $Entraineurs as $Row}
                        <option value="{$Row.id}" {if $Joueur->getEntraineurId() == $Row.id}selected="selected"{/if}>{$Row.nom} {$Row.prenom}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            {/if}
        </fieldset>

		{if !empty($Form)}
        <hr/>
        <div>
            {$Form}
        </div>
        {/if}
		
        <div class="center">
            <input type="hidden" name="joueur[id]" value="{$Joueur->id}" />
            <input type="hidden" name="joueur[creat_by]" value="{$Joueur->creat_by}" />
            <input type="hidden" name="joueur[edit_by]" value="{$smarty.session.utilisateur.id}" />
            <input type="hidden" name="joueur[creat_on]" value="{$Joueur->creat_on}" />
            <input type="hidden" name="joueur[edit_on]" value="{$smarty.now}" />
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