<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
	
	$('#help_cycle').qtip({
      // Simply use an HTML img tag within the HTML string
      content: '{$lang.Help_musculation_cycle_tpl_edit}'
   });
	
});
</script>

{if $smarty.const.BREAD == 1}
<div id="bread">
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;-&gt;&nbsp;
<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;-&gt;&nbsp;
<a href="{getLink("musculation/indexCycleTemplate")}" title="{$lang.Modele_cycle}">{$lang.Modele_cycle}</a>&nbsp;-&gt;&nbsp;
{$lang.Edition_modele_cycle}
</div>
{/if}
<div class="fright">
	<img src="{$config.url}{$config.url_dir}web/images/smallhelp.png" alt="" id="help_cycle"/>
</div>
<h3>{$lang.Edition_modele_cycle}</h3>
<form id="formEdit" method="post">
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="cycle[nom]" id="nom" class="validate[required]" size="60" value="{$Cycle.nom}"/></dd>
    </dl>
    <dl>
        <dt><label for="description">{$lang.Description} :</label></dt>
        <dd><textarea cols="50" rows="3" name="cycle[description]" id="description" class="validate[required]">{$Cycle.description}</textarea></dd>
    </dl>
    <table class="tadmin" style="width:100%">
        <thead>
            <tr>
                <td>{$lang.Exercice}</td>
                <td>{$lang.Repetition}</td>
                <td>{$lang.Serie}</td>
            </tr>
        </thead>
        <tbody>
        {foreach $Exercices as $Row}
        <tr>
            <td>{$Row.nom} <input type="hidden" name="exercice[{$Row.id}][exercice_id]" value="{$Row.id}" />{if isset($Row.data)}<input type="hidden" name="exercice[{$Row.id}][ligne_db_id]" value="{$Row.data.id}" />{/if}</td>
            <td><input type="text" name="exercice[{$Row.id}][repetition]" {if isset($Row.data)}value="{$Row.data.repetition}"{/if}/></td>
            <td><input type="text" name="exercice[{$Row.id}][serie]" {if isset($Row.data)}value="{$Row.data.serie}"{/if}/></td>
        </tr>
        {/foreach}
        </tbody>
    </table>
    <div class="form_submit center">
        <br/>
        <input type="hidden" name="cycle[id]" value="{$Cycle.id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>

<script type="text/javascript">
<!--
    $(function() {
        $( "#date_debut" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_fin" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_debut" ).datepicker( "option", "showAnim", "clip" );
        $( "#date_fin" ).datepicker( "option", "showAnim", "clip" );
    });
//-->
</script>