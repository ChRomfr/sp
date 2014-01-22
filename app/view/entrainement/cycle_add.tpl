<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
    jQuery('#date_debut').mask('99/99/9999');
    jQuery('#date_fin').mask('99/99/9999');
});
//-->
</script>
{strip}
<div class="well">
    <h4>{$lang.Nouveau_cycle}</h4>
    <form method="post" action="{getLink("entrainement/addCycle/{$joueur_id}")}" id="formAdd" class="form form-horizontal">

        {if $config.entrainement_type == 1 && $InfosInstall.i_type == 'full'}
    	<div class="control-group">
    	   <label for="type" class="control-label">{$lang.Type} :</label>
    		<div class="controls">
    			<select name="cycle[type]" required id="type">
    				<option></option>	
    				{foreach $TCYC as $Row}
    				<option value="{$Row.value}">{$Row.libelle}</option>
    				{/foreach}
    			</select>				
    		</div>
    	</div>
        {else}
        <input type="hidden" name="cycle[type]" value="0" />
        {/if}

        <div class="control-group">
            <label for="nom" class="control-label">{$lang.Nom} :</label>
            <div class="controls">
                <input type="text" name="cycle[nom]" id="nom" class="validate[required]" size="60"/>
            </div>
        </div>

        <div class="control-group">
            <label for="nom" class="control-label">{$lang.Description} :</label>
            <div class="controls"><textarea name="cycle[description]" id="description" class="validate[required]" cols="50" rows="4"></textarea></div>
        </dl>

        <div class="control-group">
            <label for="objectif" class="control-label">{$lang.Objectif} :</label>
            <div class="controls"><textarea cols="50" rows="3" name="cycle[objectif]" id="objectif" class="validate[required]" cols="50" rows="4"></textarea></div>
        </div>

        <div class="control-group">
            <label class="control-label" for="date_debut">{$lang.Date_debut} :</label>
            <div class="controls"><input type="text" name="cycle[date_debut]" id="date_debut" placeholder="JJ/MM/AAAA" class="validate[required[date]]" size="10"/></div>
        </div>

        <div class="control-group">
            <label class="control-label" for="date_fin">{$lang.Date_fin} :</label>
            <div class="controls"><input type="text" name="cycle[date_fin]" id="date_fin" placeholder="JJ/MM/AAAA" class="validate[required[date]]" size="10"/></div>
        </div>

        <div class="form_submit center">
            <input type="hidden" name="cycle[joueur_id]" value="{$joueur_id}" />
            <button type="input" class="btn">{$lang.Enregistrer}</button>
        </div>
    </form>
</div>
{/strip}
<script type="text/javascript">
<!--
    $(function() {
        $( "#date_debut" ).datepicker({ dateFormat: 'dd/mm/yy' });
        $( "#date_fin" ).datepicker({ dateFormat: 'dd/mm/yy' });
    });
//-->
</script>