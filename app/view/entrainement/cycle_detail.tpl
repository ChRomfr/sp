{if $smarty.session.acl.gest_entrainement == 1}
<script type="text/javascript">
    function deleteCycle(){
        if( confirm('{$lang.Confirm_suppression_cycle} ?') ){
            window.location.href = '{getLink("entrainement/cycleDelete/{$Cycle.id}")}';
        }
    }
</script>
{/if}
{strip}
<div class="well">
{if isset($smarty.get.nohtml)}
    {if $smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_entrainement == 1}
    <div class="fright">
        {if $smarty.session.acl.gest_entrainement == 1}<a href="{getLink("entrainement/cycleEdit/{$Cycle.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>{/if}&nbsp;&nbsp;
        {if $smarty.session.acl.gest_entrainement == 1}<a href="javascript:deleteCycle()" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>{/if}&nbsp;&nbsp;
    </div>
    <div style="clear:both;"></div>
    {/if}
    <table class="table">
        <tr>
            <td>{$lang.Cycle} :</td>
            <td>{$Cycle.nom}</td>
        </tr>
        <tr>
            <td>{$lang.Description} :</td>
            <td>{$Cycle.description|nl2br}</td>
        </tr>
        <tr>
            <td>{$lang.Objectif} :</td>
            <td>{$Cycle.objectif|nl2br}</td>
        </tr>
        <tr>
            <td>{$lang.Resultat} :</td>
            <td>{$Cycle.resultat|nl2br}</td>
        </tr>
        <tr>
            <td>{$lang.Date_debut} :</td>
            <td>{$Cycle.date_debut|date_format:$config.format_date_day}</td>
        </tr>
        <tr>
            <td>{$lang.Date_fin} :</td>
            <td>{$Cycle.date_fin|date_format:$config.format_date_day}</td>
        </tr>
        <tr>
            <td>{$lang.Nombre_entrainement} :</td>
            <td>{count($Entrainements)}</td>
        </tr>
    </table>
    {if count($Entrainements) > 0}
    
    <table class="table table-bordered table-striped table-condensed">
        <caption><h4>{$lang.Entrainements}</h4>
        <thead>
            <tr>
                <th>{$lang.Date}</th>
                <th>{$lang.Presence}</th>
                <th>{$lang.Entrainement}</th>
                <th>{$lang.Cycle}</th>
            </tr>
        </thead>
        <tbody>
        {foreach $Entrainements as $Row}
            {if $Row.presence != ''}
            <tr>
                <td>{$Row.date_entrainement|date_format:$config.format_date_day}</td>
                <td>{$Row.presence}</td>
                <td>{$Row.description|nl2br}</td>
                <td>{$Row.cycle}</td>
            </tr>
            {/if}
        {/foreach}
        </tbody>
    </table>
    {/if}
{else}

{/if}
</div>
{/strip}