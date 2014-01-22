{strip}
<ul class="breadcrumb">
    <li><a href="{getLink("index")}" title="">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li><a href="{getLink("test")}" title="">{$lang.Tests}</a><span class="divider">/</span></li>
    <li>{$lang.Nouveau}</li>
</ul>

<form method="post" action="#" id="formAdd" class="form-horizontal well">
	<fieldset>
	<legend>{$lang.Nouveau_test}</legend>
	<div class="control-group">
		<label class="control-label">{$lang.Date} :</label>
		<div class="controls"><input type="text" name="test[date_test]" id="date_test" class="validate[required,custom[date]]" required/></div>
	</div>
	<table class="table table-bordered table-striped table-condensed">
		<thead>
			<tr>
				<th>{$lang.Joueur}</th>
				<th>{$lang.Present}</th>
				{foreach $Exercices as $Row}
				<th>{$Row.nom}</th>
				{/foreach}
			</tr>
		</thead>
		<tbody>
			{foreach $Joueurs as $Joueur name=foo}
			<tr>
				<td>
					<input type="hidden" name="test[{$smarty.foreach.foo.index}][joueur_id]" value="{$Joueur.id}" />
					{$Joueur.nom} {$Joueur.prenom}
				</td>
				<td style="text-align: center">
					{* CHECKBOX POUR ELIMINER LES JOUEURS ABS *}
					<input type="checkbox" name="test[{$smarty.foreach.foo.index}][present]" value="1" checked="checked" />
				</td>
				{* Boucle sur les exercices *}
				{foreach $Exercices as $Exo}
				<td>
					<input type="hidden" name="test[{$smarty.foreach.foo.index}][exo_{$Exo.id}][exercice_id]" value="{$Exo.id}" />
					<input type="text" name="test[{$smarty.foreach.foo.index}][exo_{$Exo.id}][resultat]" value="" size="3" class="input-mini"/>
				</td>
				{/foreach}				
			</tr>
			{/foreach}
		</tbody>
	</table>
	</fieldset>
	<div class="form_submit center">
        <input type="hidden" name="test[creat_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="test[edit_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="test[creat_on]" value="{$smarty.now}" />
        <input type="hidden" name="test[edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" class="btn btn-primary"/>
	</div>
</form>
{/strip}
<script type="text/javascript">
<!--
$(function() {
	$( "#date_test" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
    $( "#date_test" ).datepicker( "option", "showAnim", "clip" );
});

jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAdd").validationEngine();
});
//-->
</script>