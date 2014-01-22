<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
});
</script>{strip}

{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/equipeIndex")}" title="{$lang.Site}">{$lang.Equipe}</a>&nbsp;>>&nbsp;
	{$lang.Edition}
</div>
{/if}

<form method="post" id="formEdit" class="form">
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="equipe[nom]" id="nom" class="validate[required]" required size="40" value="{$Equipe.nom}"/></dd>
    </dl>
    <dl>
        <dt><label for="description">{$lang.Description} :</label></dt>
        <dd><textarea name="equipe[description]" id="description" rows="3" cols="40">{$Equipe.description}</textarea></dd>
    </dl>
    {if count($Structures) > 0}
	<dl>
		<dt><label>{$lang.Structure} :</label></dt>
		<dd>
			<select name="equipe[structure_id]" id="structure_id">
				<option></option>
				{foreach $Structures as $Row}
				<option value="{$Row.id}" {if $Row.id == $Equipe.structure_id}selected="selected"{/if}>{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	{/if}
    <div class="form_submit center">
		<input type="hidden" name="equipe[creat_by]" value="{$Equipe.creat_by}" />
		<input type="hidden" name="equipe[edit_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="equipe[creat_on]" value="{$Equipe.creat_on}" />
		<input type="hidden" name="equipe[edit_on]" value="{$smarty.now}" />
		<input type="hidden" name="equipe[id]" value="{$Equipe.id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>