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
</script>{strip}

{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/siteIndex")}" title="{$lang.Site}">{$lang.Site}</a>&nbsp;>>&nbsp;
	{$lang.Edition}
</div>
{/if}

<form method="post" id="formEdit" class="form">
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="site[nom]" id="nom" class="validate[required]" required size="40" value="{$Site.nom}"/></dd>
    </dl>
    <dl>
        <dt><label for="adresse">{$lang.Adresse} :</label></dt>
        <dd><textarea name="site[adresse]" id="adresse" rows="3" cols="40">{$Site.adresse}</textarea></dd>
    </dl>
    <dl>
        <dt><label for="code_postal">{$lang.Code_postal} :</label></dt>
        <dd><input type="text" name="site[code_postal]" id="code_postal" size="6" required value="{$Site.code_postal}"/></dd>
    </dl>
    <dl>
        <dt><label for="ville">{$lang.Ville} :</label></dt>
        <dd><input type="text" name="site[ville]" id="ville" size="40" required value="{$Site.ville}" /></dd>
    </dl>
    <dl>
        <dt><label for="telephone">{$lang.Telephone} :</label></dt>
        <dd><input type="text" name="site[telephone]" id="telephone"  size="10" value="{$Site.telephone}" /></dd>
    </dl>
    <div class="form_submit center">
		<input type="hidden" name="site[id]" value="{$Site.id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>