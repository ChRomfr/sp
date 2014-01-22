<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEditStructure").validationEngine();
    
    $('#structure_code_postal').autocomplete({
		source:'{getLink("ajax/getVilleByCp?nohtml=nohtml")}',
		minLength:3,
		dataType:"json",
		delay:0,
		select: function(e,ui){			
			$("#strucutre_ville").val(ui.item.label);	
			$("#structure_code_postal").val(ui.item.value);		
			return false;
		}		
	});
});
</script>{strip}

{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("structure/index")}" title="{$lang.Structure}">{$lang.Structure}</a>&nbsp;>>&nbsp;
	{$lang.Edition}
</div>
{/if}

<form method="post" id="formEditStructure"  class="form">
    <dl>
        <dt><label for="structure_nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="structure[nom]" id="structure_nom" class="validate[required]" value="{$Structure->nom}" size="40"/></dd>
    </dl>
    <dl>
        <dt><label for="structure_adresse">{$lang.Adresse} :</label></dt>
        <dd><textarea name="structure[adresse]" id="structure_adresse" rows="3" cols="40">{$Structure->adresse}</textarea></dd>
    </dl>
    <dl>
        <dt><label for="structure_code_postal">{$lang.Code_postal} :</label></dt>
        <dd><input type="text" name="structure[code_postal]" id="structure_code_postal" value="{$Structure->code_postal}" size="5"/></dd>
    </dl>
    <dl>
        <dt><label for="structure_ville">{$lang.Ville} :</label></dt>
        <dd><input type="text" name="structure[ville]" id="structure_ville" value="{$Structure->ville}" size="40" /></dd>
    </dl>
    <dl>
        <dt><label for="structure_telephone">{$lang.Telephone} :</label></dt>
        <dd><input type="text" name="structure[telephone]" id="telephone" value="{$Structure->telephone}" size="10" /></dd>
    </dl>
    <div class="form_submit center">
        <input type="hidden" name="structure[id]" value="{$Structure->id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>{/strip}