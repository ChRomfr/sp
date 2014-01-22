<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
	
	// Code JQUERY suppression ligne a la vole
	$('td img.delete').live('click', function(){
		$(this).parent().parent().remove();
	});
	
});

function checkForm(){
	if( seance_number == 0 ){
		alert('{$lang.Mini_une_seance}');
		return false;
	}
}

var seance_number = 0;

function addSeance(){
	seance_number = seance_number + 1;	
	$.get(
            '{getLink("muscu/cycleSeanceAdd")}',{literal}
            {seance_number: seance_number, nohtml:'nohtml'},
            function(data){ $("#form_end").before(data); }
        )
    {/literal}
	
	//$("#form_end").before('<p>Un test' + seance_number  + '</p>');
}
//-->
</script>
{strip}
{if $smarty.const.BREAD == 1}
<div id="bread">
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
{$lang.Nouveau_cycle}
</div>
{/if}

<form id="formAdd" method="post" onsubmit="return checkForm();" class="form">
	<h1>{$lang.Nouveau_cycle}</h1>
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="cycle[nom]" id="nom" class="validate[required]" size="60"/></dd>
    </dl>
    <dl>
        <dt><label for="description">{$lang.Description} :</label></dt>
        <dd><textarea cols="50" rows="3" name="cycle[description]" id="description" class="validate[required]"></textarea></dd>
    </dl>
     
    <dl>
        <dt><label for="date_debut">{$lang.Date_debut} :</label></dt>
        <dd><input type="text" name="cycle[date_debut]" id="date_debut" class="validate[required,custom[date]]" size="10" /></dd>
    </dl>
    <dl>
        <dt><label for="date_fin">{$lang.Date_fin} :</label></dt>
        <dd><input type="text" name="cycle[date_fin]" id="date_fin" class="validate[required,custom[date]]" size="10" /></dd>
    </dl>
	{* AFFICHAGE DES JOUEURS DISPONIBLES *}
	{if isset($Joueurs) AND is_array($Joueurs)}
	<table style="width:100%;">
		<tr>
			{foreach $Joueurs as $Row name=foo}
			<td><input type="checkbox" name="joueurs[]" class="validate[minCheckbox[1]] checkbox" id="j_{$Row.id}" value="{$Row.id}" /><label for="j_{$Row.id}">{$Row.nom} {$Row.prenom}</label></td>
			{if $smarty.foreach.foo.iteration % 3 == 0}</tr><tr>{/if}
			{/foreach}
		</tr>
	</table>
	{/if}
	
	{* AFFICHAGE DES SEANCES *}
	<div class="fright"><a href="javascript:addSeance()" title="{$lang.Ajouter_une_seance}" class="submit">{$lang.Ajouter_une_seance}</a></div>
	<div class="clear"></div>
	
	<br/><br/>
	<div class="form_submit center" id="form_end"><input type="submit" value="{$lang.Enregistrer}" /></div>
</form>
{/strip}
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_fin" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
		$( "#date_debut" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_fin" ).datepicker( "option", "showAnim", "clip" );
        $( "#date_debut" ).datepicker( "option", "showAnim", "clip" );
	});
//-->
</script>