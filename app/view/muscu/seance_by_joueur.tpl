<script>
	jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAdd").validationEngine();
	});
	
	var ligne_seance_{$seance_number} = 0;	// Correspond au nombre d exercice
	
	function {literal}addLigneSeance{/literal}{$seance_number}{literal}(){{/literal}
	
		ligne_seance_{$seance_number} = ligne_seance_{$seance_number} + 1;
		$.get(
            '{getLink("muscu/getLigneForTabExo")}',{literal}
            {ligne_number: ligne_seance_{/literal}{$seance_number}{literal},seance_number: {/literal}{$seance_number}{literal}, nohtml:'nohtml'},
            function(data){ $("#exercice_seance_{/literal}{$seance_number}{literal}").append(data); }
        )
		{/literal}
	}	
	
	function {literal}loadModel{/literal}{$seance_number}{literal}(){{/literal}
		
		$.get(
            '{getLink("muscu/getModelSeance")}',{literal}
            {seance_id: $("#seance_model_id_{/literal}{$seance_number}{literal}").val(),seance_number: {/literal}{$seance_number}{literal}, nohtml:'nohtml'},
            function(data){ $("#seance_number_{/literal}{$seance_number}{literal}").html(data); }
        )
		{/literal}
		
	}
	
	function checkForm(){
		if( ligne_seance_{$seance_number} == 0 ){
			return false;
		}
		
		return true;
	}
	
</script>
{strip}

{if $smarty.const.BREAD}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;-&gt;&nbsp;
	<a href="{getLink("joueur/index")}" title="{$lang.Joueur}">{$lang.Joueur}</a>&nbsp;-&gt;&nbsp;
	<a href="{getLink("joueur/fiche/{$joueur.id}")}" title="">{$joueur.nom} {$joueur.prenom}</a>&nbsp;-&gt;&nbsp;
	{$lang.Nouvelle_seance}
</div>
{/if}

<form method="post" id="formAdd" onsubmit="return checkForm();" class="form">
	
		<h1>{$lang.Seance}</h1>
		
		{* START Bouton nouvelle seance *}
		<div class="fright">
			<a href="javascript:addLigneSeance{$seance_number}();" title="{$lang.Ajouter_exercice}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="{$lang.Ajouter_exercice}" /></a>
		</div>
		<div class="clear"></div>
		{* END Bouton nouvelle seance *}
		
		{* START Liste des exercices *}
		<table class="tadmin" id="exercice_seance_{$seance_number}">
			<thead>
				<tr>
					<td>{$lang.Exercice}</td>
					<td>{$lang.Poids}</td>
					<td>{$lang.Repetition}</td>
					<td>{$lang.Serie}</td>
				</tr>
			</thead>
			<tbody></tbody>
		</table>	
		{* END Liste des exercices *}
		
		{* START Nom & Description *}
		<dl>
			<dt><label>{$lang.Date} :</label></dt>
			<dd><input type="text" name="cycle[seance][{$seance_number}][date_seance]" id="date_seance" class="validate[required,custom[date]]" /></dd>
		</dl>
		{*<dl>
			<dt><label>{$lang.Nom} :</label></dt>
			<dd><input type="text" name="cycle[seance][{$seance_number}][modele_nom]" id="cycle_nom_seance_{$seance_number}" class="validate[required]" /></dd>
		</dl>
		<dl>
			<dt><label>{$lang.Description} :</label></dt>
			<dd><textarea cols="50" rows="3" name="cycle[seance][{$seance_number}][description]" id=""></textarea></dd>
		</dl>*}
		{* END Nom & Description *}

	<div class="center form_submit"><input type="submit" value="{$lang.Enregistrer}" /></div>
</form>
{/strip}
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_seance" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_seance" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>