<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAddStructure").validationEngine();
    
    $('#structure_code_postal').autocomplete({
		source:'{getLink("ajax/getVilleByCp?nohtml=nohtml")}',
		minLength:3,
		dataType:"json",
		delay:0,
		select: function(e,ui){			
			$("#structure_ville").val(ui.item.label);	
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
	{$lang.Nouvelle}
</div>
{/if}

<form method="post" id="formAddStructure" class="form">
    <dl>
        <dt><label for="structure_nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="structure[nom]" id="structure_nom" class="validate[required]" required size="40"/></dd>
    </dl>
    <dl>
        <dt><label for="structure_adresse">{$lang.Adresse} :</label></dt>
        <dd><textarea name="structure[adresse]" id="structure_adresse" rows="3" cols="40">{if isset($smarty.post.structure.adresse) && $smarty.post.structure.adresse != ""}{$smarty.post.structureadresse}{/if}</textarea></dd>
    </dl>
    <dl>
        <dt><label for="structure_code_postal">{$lang.Code_postal} :</label></dt>
        <dd><input type="text" name="structure[code_postal]" id="structure_code_postal" {if isset($smarty.post.structure.code_postal) && $smarty.post.structure.code_postal != ""}value="{$smarty.post.structurecode_postal}"{/if} size="6" required/></dd>
    </dl>
    <dl>
        <dt><label for="structure_ville">{$lang.Ville} :</label></dt>
        <dd><input type="text" name="structure[ville]" id="structure_ville" {if isset($smarty.post.structure.ville) && $smarty.post.structure.ville != ""}value="{$smarty.post.structureville}"{/if} size="40" required/></dd>
    </dl>
    <dl>
        <dt><label for="structure_telephone">{$lang.Telephone} :</label></dt>
        <dd><input type="text" name="structure[telephone]" id="structure_ville" {if isset($smarty.post.structure.telephone) && $smarty.post.structure.telephone != ""}value="{$smarty.post.structure.telephone}"{/if} size="10" /></dd>
    </dl>
    <div class="form_submit center">
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>