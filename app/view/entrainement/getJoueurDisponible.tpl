{strip}
<table class="table">
{foreach $Joueurs as $Row}
<tr>
    <td><label>{$Row.prenom} {$Row.nom} :</label></td>
    <td>
        <select name="joueur[{$Row.id}][presence]">
            <option></option>
            <option value="present">{$lang.Present}</option>
            <option value="abs">{$lang.Absent}</option>
            <option value="blesse" {if $Row.dispo_rugby > time()}selected="selected"{/if}>{$lang.Blesse}</option>
        </select>
    </td>
    <td>
        
        <textarea name="joueur[{$Row.id}][suivi]" rows="3" cols="40"></textarea>
    </td>
    <td>
        <input type="hidden" name="joueur[{$Row.id}][joueur_id]" value="{$Row.id}" />
    </td>
    <td>
        
        {if !empty($Row.cycle)}
        <select name="joueur[{$Row.id}][cycle_id]"> 
            <option></option>
            {foreach $Row.cycle as $cycle}
            <option value="{$cycle.id}">{$cycle.nom}</option>
            {/foreach}
        </select>
        {/if}
    </td>
</tr>
{/foreach}
</table>
{/strip}
<script type="text/javascript">
<!--
    $(function() {
        $('#list_joueur select').css('vertical-align','top');
    });
    
//-->
</script>