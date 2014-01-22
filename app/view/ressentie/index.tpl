<script>
<!--
$(function() {
    $( "#diag-ressenti" ).dialog({ autoOpen: false, width:800 });
});

function getGraphiqueRessenti(semaine, year, sportif){

	$("#diag-ressenti").dialog('open');
	$('#diag-ressenti').html('<img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" />');
	
    $.get(
        '{getLink("ressentie/ajaxGetGraph")}',{literal}
        {sportif:sportif,semaine:semaine,year:year, nohtml:'nohtml'},
        function(data){ $('#diag-ressenti').html(data); }
    )
    {/literal}
}
//-->
</script>{strip}
{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    {$lang.Ressentie}
</div>
{/if}

<div class="showData">
    {if $smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_joueur == 1}
    <div class="fright">
        <a href="{getLink("ressentie/add?year={$year}&semaine={$semaine}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt=""/></a>
    </div>
    {/if}
    <h1>{$lang.Ressentie} {$lang.Semaine} {$semaine} {$year} - {$Lundi} {$lang.Au} {$Dimanche}</h1>
    <div style="width:95%;margin:auto;">
        <div class="fleft"><a href="{getLink("ressentie?year={$Previous.Year}&semaine={$Previous.Semaine}")}"><<</a></div>		
		<div class="fright"><a href="{getLink("ressentie?year={$Next.Year}&semaine={$Next.Semaine}")}">>></a></div>
		<div class="clear"></div>
    </div>
    <table class="tadmin">
        <thead>
            <tr>
                <td>{$lang.Sportif}</td>
                {for $it=1 to $MaxSequence}
                <td>S {$it}</td>
                {/for}
				<td></td>
            </tr>
        </thead>
        <tbody>
            {foreach $Sportifs as $Row name=foo}
            <tr>
                <td>
                   <a href="{getLink("joueur/fiche/{$Row.sportif_id}?tab=ressenti")}" title="">{$Row.prenom} {$Row.nom}</a>
                </td>
                {* BOUCLE SUR LES SEQUENCES *}
                {foreach $Row.sequences as $sequence name=its}
                <td class="center">
                    {if isset($sequence) && !empty($sequence.note)}
                    {$sequence.note}
                    {/if}
                </td>
                {/foreach}
				<td class="center"><a href="javascript:getGraphiqueRessenti({$semaine},{$year},{$Row.sportif_id});" /><img src="{$config.url}{$config.url_dir}web/images/graph.png" alt="" style="width:16px;" /></a></td>
            </tr>
            {/foreach}
        </tbody>
    </table>
</div>
<div id="diag-ressenti"></div>{/strip}