<script type="text/javascript">
<!--
$(function() {
    $( "#diag-details" ).dialog({ autoOpen: false, width:800 });
});

function getDetailCycle(cycle_id){
	$.get(
            '{getLink("musculation/detailCycle/'+ cycle_id +'")}',{literal}
            {nohtml:'nohtml'},
            function(data){ $('#diag-details').html(data); }
        )
    {/literal}

    $( "#diag-details" ).dialog('open');
}
//-->
</script>
{if $smarty.session.acl.gest_muscu == 1}
<div class="fright">
    <a href="{getLink("musculation/addCycle/{$joueur_id}")}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
</div>
{/if}

<div class="showData">
<h1>{$lang.Cycle}</h1>
{if count($Cycles) > 0}
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Cycle}</td>
				<td>{$lang.Date_debut}</td>
				<td>{$lang.Date_fin}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Cycles as $Row}
			<tr>
				<td><a href="javascript:getDetailCycle({$Row.id});" title="">{$Row.nom}</a></td>
				<td>{$Row.date_debut|date_format:$config.format_date_day}</td>
				<td>{$Row.date_fin|date_format:$config.format_date_day}</td>
			{/foreach}
		</tbody>
	</table>
{else}
<p class="center">{$lang.Aucun_cycle}</p>
{/if}
</div>

{if $smarty.session.acl.gest_muscu == 1}
<div class="fright">
    <a href="{getLink("musculation/seanceAdd/{$joueur_id}")}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
</div>
{/if}
<h3>{$lang.Seance}</h3>
<div id="diag-details"></div>