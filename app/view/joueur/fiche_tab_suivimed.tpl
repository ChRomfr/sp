<script>
$(function() {
    $('a#fbaddformsm').fancybox();
    $('a.fbdetailsm').fancybox();
    $('a.fbeditformsm').fancybox();
});

function deleteSuivi( id ){
	if( confirm('{$lang.Confirm_suppression_suivi_med} ?') ){
		window.location.href = '{getLink("suiviMedical/delete/'+ id +'")}';
	}
}

</script>
{strip}
<div class="well">
    {if $smarty.session.acl.gest_suivimed == 1}
    <div class="fright">
        <a href="{getLink("suiviMedical/add/{$joueur_id}?joueur_id={$joueur_id}&nohtml")}" id="fbaddformsm" class="btn btn-small"><i class="icon-plus"></i></a>
    </div>
    <div style="clear:both;"></div>
    {/if}

{if $DispoRugby > $smarty.now}<div class="alert alert-error">{$lang.Joueur_insdipo_entrai_rugby}</div><br/>{/if}
{if $DispoMuscu > $smarty.now}<div class="alert alert-error">{$lang.Joueur_insdipo_muscu}</div><br/>{/if}

<table class="table table-bordered table-striped table-condensed">
    <thead>
        <tr>
            <th>{$lang.Date}</th>
            <th>{$lang.Type}</th>
            <th>{$lang.Suivi}</th>
            <th>{$lang.Arret_rugby}</th>
            <th>{$lang.Arret_musculation}</th>
			{if $smarty.session.acl.gest_suivimed == 1}<th>{$lang.Action}</th>{/if}
        </tr>
    </thead>
{foreach $SuivisMedical as $Row}
    <tr>
        <td>{$Row.date_medical|date_format:$config.format_date_day}</td>
        <td><a href="{getLink("suiviMedical/getDetail?suivi_id={$Row.id}&nohtml")}" class="fbdetailsm">{$Row.type}</a>{if $Row.NbCommentaire > 0}&nbsp;<small><em>({$Row.NbCommentaire})</em></small>{/if}</td>
        <td>{$Row.suivi|truncate:15}</td>
        <td>{if $Row.dispo_rugby == 0}{$lang.Non}{else}{if $Row.dispo_rugby > time()}<span style="color:red">{$Row.dispo_rugby|date_format:$config.format_date_day}</span>{else}{$lang.Arret_fini}<small>({$Row.dispo_rugby|date_format:$config.format_date_day})</small>{/if}{/if}</td>
        <td>{if $Row.dispo_muscu == 0}{$lang.Non}{else}{if $Row.dispo_muscu > time()}<span style="color:red">{$Row.dispo_muscu|date_format:$config.format_date_day}</span>{else}{$lang.Arret_fini}<small>({$Row.dispo_rugby|date_format:$config.format_date_day})</small>{/if}{/if}</td>
		{if $smarty.session.acl.gest_suivimed == 1}
		<td>
            <a href="{getLink("suiviMedical/edit/{$Row.id}?suivi_id={$Row.id}&nohtml")}" class="fbeditformsm"><i class="icon-pencil"></i></a>
			<a href="javascript:deleteSuivi({$Row.id});" title="{$lang.Supprimer}"><i class="icon-trash"></i></a>
		</td>
		{/if}
    </tr>
{/foreach}
</table>

</div>
{/strip}