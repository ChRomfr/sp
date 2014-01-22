<script type="text/javascript">
function deleteTemplate(cycle_id){
	if( confirm( '{$lang.Confirm_suppression_cycle}' ) ){
		window.location.href = '{getLink("muscu/cycleDelete/' + cycle_id + '")}';
	}
}
</script>{strip}

{if $smarty.const.BREAD == 1}
<div id="bread">
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
{$lang.Cycle}
</div>
{/if}

<div class="showData">
	<div class="fright">
		<a href="{getLink("muscu/cycleAdd")}" title="{$lang.Nouveau_cycle}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>

	<h1>{$lang.Cycle}</h1>
	<div style="clear:both;"></div>

	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Cycle}</td>
				<td>{$lang.Date_debut}</td>
				<td>{$lang.Date_fin}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Cycles as $Row}
			<tr>
				<td>{$Row.nom}</td>
				<td>{$Row.date_debut|date_format:$config.format_date_day}</td>
				<td>{$Row.date_fin|date_format:$config.format_date_day}</td>
				<td class="center">
					{if $smarty.session.acl.gest_muscu == 1}
					<a href="{getLink("muscu/addSeanceAtCycle/{$Row.id}")}" title="{$lang.Ajouter_une_seance}"><img src="{$config.url}{$config.url_dir}web/images/add.png" /></a>&nbsp;&nbsp;
					{/if}
					<a href="{getLink("muscu/detailCycle/{$Row.id}")}" title="{$lang.Detail}"><img src="{$config.url}{$config.url_dir}web/images/detail.png" /></a>&nbsp;&nbsp;
					{if $smarty.session.acl.gest_muscu == 1}
					<a href="javascript:deleteTemplate({$Row.id})" title="{$lang.Supprimer}"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="{$lang.Supprimer}" /></a>&nbsp;&nbsp;
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
	<div class="fright">
		<br/>
		<span><img src="{$config.url}{$config.url_dir}web/images/add.png" /> : {$lang.Ajouter_une_seance}</span><br/>
		<span><img src="{$config.url}{$config.url_dir}web/images/detail.png" /> : {$lang.Detail}</span><br/>
		<span><img src="{$config.url}{$config.url_dir}web/images/delete.png" /> : {$lang.Supprimer}</span>
	</div>
	<div style="clear:both;"></div>
</div>{/strip}