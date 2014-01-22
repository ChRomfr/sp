<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
});
//-->
</script>
{if $smarty.const.BREAD == 1}
<ul class="breadcrumb">
    <li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li><a href="{getLink("entrainement/index")}" title="{$lang.Entrainement}">{$lang.Entrainement}</a><span class="divider">/</span></li>
    <li>{$lang.Edition}</li>
</ul>
{/if}

<div class="well">

<form method="post" id="formEdit" class="form-horizontal">
    <fieldset>
	<legend>{$lang.Entrainement_edition}</legend>

    {if $config.entrainement_type == 1 && $InfosInstall.i_type == 'full'}
	<div class="control-group">
		<label class="control-label" for="type">{$lang.Type} :</label>
		<div class="controls">
			<select name="entrainement[type]" id="type" required class="validate[required]">
				<option></option>
				{foreach $TENT as $Row}
				<option value="{$Row.value}" {if $Entrainement.type == $Row.value}selected="selected"{/if}>{$Row.libelle}</option>
				{/foreach}
			</select>
		</div>
	</div>
    {/if}

	<div class="control-group">
        <label class="control-label" for="date_entrainement">{$lang.Date}</label>
        <div class="controls"><input type="text" id="date_entrainement" name="entrainement[date_entrainement]" value="{$Entrainement.date_entrainement|date_format:$config.format_date_day}" class="validate[required,custom[date]]"/></div>    
    </div>

    <div class="control-group">
        <label class="control-label" for="description">{$lang.Description}</label>
        <div class="controls"><textarea cols="60" rows="5" name="entrainement[description]" id="description">{$Entrainement['description']}</textarea></div>   
    </div>


    <div id="list_joueur">
        
        <table class="table">
            {foreach $Joueurs as $Row}
            <tr>
                <td style="vertical-align:top;">{$Row.prenom} {$Row.nom}</td>
                <td style="vertical-align:top;">
                    <select name="joueur[{$Row.id}][presence]">
                        <option></option>
                        <option value="present" {if isset($Row.entrainement.presence) && $Row.entrainement.presence == "present"}selected="selected"{/if}>{$lang.Present}</option>
                        <option value="abs" {if isset($Row.entrainement.presence) && $Row.entrainement.presence == "abs"}selected="selected"{/if}>{$lang.Absent}</option>
                        <option value="blesse" {if isset($Row.entrainement.presence) && $Row.entrainement.presence == "blesse"}selected="selected"{/if} >{$lang.Blesse}</option>
                    </select>
                </td>
                <td style="vertical-align:top;">
                    <textarea name="joueur[{$Row.id}][suivi]" rows="3" cols="40">{if isset($Row.entrainement.suivi)}{$Row.entrainement.suivi}{/if}</textarea>
                    <input type="hidden" name="joueur[{$Row.id}][joueur_id]" value="{$Row.id}" />
                </td>
                {if $smarty.const.USE_ENTRAINEMENT_CYCLE == TRUE}
                <td style="vertical-align:top;">
                {if !empty($Row.cycle)}
                    <select name="joueur[{$Row.id}][cycle_id]"> 
                        <option></option>
                        {foreach $Row.cycle as $cycle}
                        <option value="{$cycle.id}" {if isset($Row.entrainement)}{if $Row.entrainement.cycle_id == $cycle.id}selected="selected"{/if}{/if}>{$cycle.nom}</option>
                        {/foreach}
                    </select>
                {/if}
                </td>
                {/if}
            </tr>
            {/foreach}
        </table>
    </div>
        <div class="center">
            <input type="hidden" name="entrainement[id]" value="{$Entrainement.id}" />
            <input type="submit" value="{$lang.Enregistrer}" class="btn" />
        </div>
        </fieldset>
    </form>
</div>
{literal}
<script type="text/javascript">
<!--
    $(function() {
        $( "#date_entrainement" ).datepicker({ dateFormat: 'dd/mm/yy' });
    });
//-->
</script>
{/literal}