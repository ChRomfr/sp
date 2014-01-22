<!-- START view/widget/blessure.tpl -->
{strip}
{if count($Blessures) > 0}
    {foreach $Blessures as $Row}
        <span><i class="fa fa-ambulance"></i>&nbsp;<a href="{$Helper->getLink("joueur/fiche/{$Row.jid}?tab=suivimedical")}" title="View detail">{$Row.prenom} {$Row.nom}</a> - {$Row.type} - {$Row.dispo_rugby|date_format:$config.format_date_day}</span><br/>
    {/foreach}    
{/if}
{/strip}
<!-- END view/widget/blessure.tpl -->