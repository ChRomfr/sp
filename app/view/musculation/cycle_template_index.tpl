<script type="text/javascript">
function deleteTemplate(tpl_id){
	if( confirm( '{$lang.Confirm_suppression_modele}' ) ){
		window.location.href = '{getLink("musculation/deleteCycleTemplate/' + tpl_id + '")}';
	}
}
</script>

{if $smarty.const.BREAD == 1}
<div id="bread">
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;-&gt;&nbsp;
<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;-&gt;&nbsp;
{$lang.Modele_cycle}
</div>
{/if}

<h3>{$lang.Modele_cycle}</h3>
<br/>
<table class="tadmin">
	<thead>
		<tr>
			<td>{$lang.Cycle}</td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		{foreach $Cycles as $Row}
		<tr>
			<td>{$Row.nom}</td>
			<td class="center">
				{if $smarty.session.acl.musculation_cycle_template_edit == true}<a href="{getLink("musculation/editCycleTemplate/{$Row.id}")}" title="{$lang.Modifier}"><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="{$lang.Modifier}" /></a>{/if}
				{if $smarty.session.acl.musculation_cycle_template_delete == true}<a href="javascript:deleteTemplate({$Row.id})" title="{$lang.Supprimer}"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="{$lang.Supprimer}" /></a>{/if}
			</td>
		</tr>
		{/foreach}
	</tbody>
</table>