<script>
function deleteSite(cid){
    if( confirm('{$lang.Confirm_suppression_site} ?') ){
        window.location.href = '{getLink("administration/siteDelete/'+cid+'")}';
    }
}
</script>

{strip}
{if $smarty.const.BREAD}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Site}
</div>
{/if}

<div class="showData">
	<div class="fright">
		<a href="{getLink("administration/siteAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Site}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<td>{$lang.Site}</td>
			<td>{$lang.Ville}</td>
			<td>{$lang.Telephone}</td>
			<td>{$lang.Action}</td>
		</thead>
		<tbody>
			{foreach $Sites as $Row}
			<tr>
				<td>{$Row.nom}</td>
				<td>{$Row.ville}</td>
				<td>{$Row.telephone}</td>
				<td class="center">
					<a href="{getLink("administration/siteEdit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" /></a>
					<a href="javascript:deleteSite({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>{/strip}