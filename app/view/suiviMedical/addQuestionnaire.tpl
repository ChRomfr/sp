{* FORMULAIRE  D AJOUT QUESTIONNAIRE MEDICAL *}
<script type="text/javascript">
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formQuestionnaire").validationEngine();
});
</script>

<div id="bread">
	<a href="{getLink('index/index')}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink('suiviMedical/listQuestionnaire')}" title="">{$lang.Questionnaire}</a>&nbsp;>>&nbsp;
	{$lang.Nouveau}
</div>

<form method="post" action="#" class="form" id="formQuestionnaire">
	<h1>{$lang.Nouveau_questionnaire}</h1>
	<dl>
		<dt><label for="name">{$lang.Nom} :</label></dt>
		<dd><input type="text" name="Questionnaire[name]" id="name" value="" placeholder="" size="50" class="validate[required]"/></dd>
	</dl>
	<dl>
		<dt><label for="description">{$lang.Description} :</label></dt>
		<dd><textarea name="Questionnaire[description]" id="description" rows="3" cols="50"></textarea></dd>
	</dl>
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>