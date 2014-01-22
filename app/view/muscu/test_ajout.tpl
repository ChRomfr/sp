<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});
</script>

{strip}
<form method="post" action="#" class="form" id="formAdd">
	<h1>{$lang.Nouveau_test}</h1>
    <dl>
        <dt><label>{$lang.Date} :</label></dt>
        <dd><input type="text" name="test[date_test]" id="date_test" class="validate[required,custom[date]]" required/></dd>
    </dl>
    <table class="tadmin">
        <thead>
            <tr>
                <td>{$lang.Joueur}</td>
                <td>{$lang.Present}</td>
                {foreach $Exercices as $Row}
                <td>{$Row.nom}</td>
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
                <td>
					{* CHECKBOX POUR ELIMINER LES JOEURS ABS *}
					<input type="checkbox" name="test[{$smarty.foreach.foo.index}][present]" value="1" checked="checked" />
				</td>
                {* Boucle sur les exercices *}
                {foreach $Exercices as $Exo}
                <td>
                    <input type="hidden" name="test[{$smarty.foreach.foo.index}][exo_{$Exo.id}][exercice_id]" value="{$Exo.id}" />
                    <input type="text" name="test[{$smarty.foreach.foo.index}][exo_{$Exo.id}][resultat]" value="" size="3"/>
                </td>
                {/foreach}                
            </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="form_submit center">
        <input type="hidden" name="test[creat_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="test[edit_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="test[creat_on]" value="{$smarty.now}" />
        <input type="hidden" name="test[edit_on]" value="{$smarty.now}" />
		<input type="hidden" name="test[exo_liste]" value="{$exo_liste}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>
{/strip}

<script type="text/javascript">
<!--
    $(function() {
        $( "#date_test" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_test" ).datepicker( "option", "showAnim", "clip" );
    });
//-->
</script>