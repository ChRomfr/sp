<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
});
//-->
</script>{strip}

{if $smarty.const.BREAD}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;-&gt;&nbsp;
    <a href="{getLink("joueur/index")}" title="">{$lang.Joueur}</a>&nbsp;-&gt;&nbsp;
    <a href="{getLink("joueur/fiche/{$Joueur.id}?tab=entrainement")}" title="">{$Joueur.prenom} {$Joueur.nom}</a>&nbsp;-&gt;&nbsp;
    {$lang.Edition_cycle}
</div>
{/if}

<form method="post" action="{getLink("entrainement/cycleEdit/{$Cycle.id}")}" id="formEdit" class="form">
	<h1>{$lang.Edition_cycle}</h1>
	<dl>
		<dt><label for="type">{$lang.Type} :</label></dt>
		<dd>
			<select name="cycle[type]" required id="type">
				<option></option>	
				{foreach $TCYC as $Row}
				<option value="{$Row.value}" {if $Cycle.type == $Row.value}selected="selected"{/if}>{$Row.libelle}</option>
				{/foreach}
			</select>				
		</dd>
	</dl>
    <dl>
        <dt><label>{$lang.Joueur} :</label></dt>
        <dd>{$Joueur.prenom} {$Joueur.nom}</dd>
    </dl>
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="cycle[nom]" id="nom" class="validate[required]" size="60" value="{$Cycle.nom}"/></dd>
    </dl>
    <dl>
        <dt><label for="nom">{$lang.Description} :</label></dt>
        <dd><textarea name="cycle[description]" id="description" class="validate[required]" cols="50" rows="4">{$Cycle.description}</textarea></dd>
    </dl>
    <dl>
        <dt><label for="objectif">{$lang.Objectif} :</label></dt>
        <dd><textarea cols="50" rows="3" name="cycle[objectif]" id="objectif" class="validate[required]" cols="50" rows="4">{$Cycle.objectif}</textarea></dd>
    </dl>
    <dl>
        <dt><label for="resultat">{$lang.Resultat} :</label></dt>
        <dd><textarea cols="50" rows="3" name="cycle[resultat]" id="resultat" cols="50" rows="4">{$Cycle.resultat}</textarea></dd>
    </dl>
    <dl>
        <dt><label for="date_debut">{$lang.Date_debut} :</label></dt>
        <dd><input type="text" name="cycle[date_debut]" id="date_debut" placeholder="JJ/MM/AAAA" class="validate[required[date]]" size="10" value="{$Cycle.date_debut|date_format:$config.format_date_day}"/></dd>
    </dl>
    <dl>
        <dt><label for="date_fin">{$lang.Date_fin} :</label></dt>
        <dd><input type="text" name="cycle[date_fin]" id="date_fin" placeholder="JJ/MM/AAAA" class="validate[required[date]]" size="10" value="{$Cycle.date_fin|date_format:$config.format_date_day}"/></dd>
    </dl>
    <div class="form_submit center">
        <input type="hidden" name="cycle[id]" value="{$Cycle.id}" />
        <input type="hidden" name="cycle[joueur_id]" value="{$Cycle.joueur_id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>
{/strip}

<script type="text/javascript">
<!--
    $(function() {
        $( "#date_debut" ).datepicker({ dateFormat: 'dd/mm/yy' });
        $( "#date_fin" ).datepicker({ dateFormat: 'dd/mm/yy' });
    });
//-->
</script>