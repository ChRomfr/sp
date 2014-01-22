<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
});
</script>

{strip}
<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("test/index")}" title="">{$lang.Test}</a>&nbsp;>>&nbsp;
	<a href="{getLink("test/indexExercice")}" title="">{$lang.Exercices}</a>&nbsp;>>&nbsp;
	{$lang.Edition}
</div>

<form method="post" action="#" id="formEdit" class="form">
	<h1>{$lang.Edition_exercice}</h1>
	<dl>
		<dt><label>{$lang.Nom} :</label></dt>
		<dd><input type="text" name="exercice[nom]" class="validate[required]" id="nom" value="{$Exercice.nom}" /></dd>
	</dl>
	<dl>
		<dt><label>{$lang.Description} :</label></dt>
		<dd><textarea name="exercice[description]" id="description" cols="50" rows="3">{$Exercice.description}</textarea></dd>
	</dl>
	<dl>
		<dt><label>{$lang.Unite} :</label></dt>
		<dd><input type="text" name="exercice[unite]" class="validate[required]" id="unite" value="{$Exercice.unite}" /></dd>
	</dl>
	<dl>
		<dt><label>{$lang.Progression} :</label></dt>
		<dd>
			<select name="exercice[progression]" id="progression" class="validate[required]">
				<option></option>
				<option value="1" {if $Exercice.progression == 1}selected="selected"{/if}>{$lang.A_la_baisse}</option>
				<option value="2" {if $Exercice.progression == 2}selected="selected"{/if}>{$lang.A_la_hausse}</option>
			</select>			
		</dd>
	</dl>
	<div class="form_submit center">
		<input type="hidden" name="exercice[id]" value="{$Exercice.id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>