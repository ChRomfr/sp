{if $smarty.session.acl.gest_structure == true}
<script>
function deleteStructure(cid){
    if( confirm('{$lang.Confirm_suppression_structure} ?') ){
        window.location.href = '{getLink("structure/delete/'+cid+'")}';
    }
}
</script>
{/if}
{strip}
{if $smarty.const.BREAD}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	{$lang.Structure}
</div>
{/if}

<div class="showData">
	<div class="fright">
		<a href="{getLink("structure/add")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Structure}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<td>{$lang.Structure}</td>
			<td>{$lang.Ville}</td>
			<td>{$lang.Telephone}</td>
			<td>{$lang.Action}</td>
		</thead>
		<tbody>
			{foreach $Structures as $Row}
			<tr>
				<td>{$Row.nom}</td>
				<td>{$Row.ville}</td>
				<td>{$Row.telephone}</td>
				<td class="center">
					<a href="{getLink("structure/edit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" /></a>
					<a href="javascript:deleteStructure({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>{/strip}