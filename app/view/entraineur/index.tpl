{if !isset($smarty.get.nohtml)}
<script type="text/javascript">
<!--
function deleteEntraineur( eid ){
	if( confirm('{$lang.Confirm_suppression_entraineur} ?') ){
		window.location.href = '{getLink("entraineur/delete/'+ eid +'")}';
	}
}
//-->
</script>
{strip}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    {$lang.Entraineur}
</div>

<div class="showData">
	<div class="fright">
		<a href="{getLink("entraineur/add")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Entraineur}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Entraineur}</td>
				<td>{$lang.Telephone}</td>
                <td>{$lang.Email}</td>
                <td>{$lang.Structure}</td>
				<td>{$lang.Action}</td>
            </tr>
		</thead>
		<tbody>
			{foreach $Entraineurs as $Row}
			<tr>
				<td>{$Row.prenom} {$Row.nom}</td>
				<td>{$Row.telephone}</td>
                <td><a href="mailto:{$Row.email}">{$Row.email}</a></td>
                <td>{$Row.structure}</td>
				<td class="center">
					<a href="{getLink("entraineur/edit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;
					<a href="javascript:deleteEntraineur({$Row.id});" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}
{else}
{strip}
<div class="showData">
	<table class="tadmin">
		<thead>
			<tr>
				<td><{$lang.Entraineur}</td>
				<td>{$lang.Telephone}</td>
				<td>{$lang.Email}</td>
				<td>{$lang.Structure}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Entraineurs as $Row}
			<tr>
				<td><a href="{getLink("entraineur/edit/{$Row.id}")}" title="">{$Row.prenom} {$Row.nom}</a></td>
				<td>{$Row.telephone}</td>
				<td><a href="mailto:{$Row.email}">{$Row.email}</a></td>
				<td>{$Row.structure}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}
{/if}