<script>
	jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
		jQuery("#formAdd").validationEngine();
	});
	$.fn.mColorPicker.defaults.imageFolder = "{$config.url}{$config.url_dir}web/images/";
</script>

{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/programmationTypeIndex")}" title="{$lang.Type_de_programmation}">{$lang.Type_de_programmation}</a>&nbsp;>>&nbsp;
	{$lang.Nouveau}
</div>
{/if}

<form method="post" action="" class="form" id="formAdd">
	<h1>{$lang.Type_de_programmation}</h1>
	<dl>
		<dt><label for="nom">{$lang.Nom} :</labeL></dt>
		<dd><input type="text" name="type[nom]" id="nom" required placeholder="" class="validate[required]" /></dd>
	</dl>
	<dl>
		<dt><label for="couleur">{$lang.Couleur} :</label></dt>
		<dd><input type="color" name="type[couleur]" id="color_0" required class="color validate[required]"  size="10" data-hex="true" data-text="hidden" style="height:20px;width:20px;"/></dd>
	</dl>
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>