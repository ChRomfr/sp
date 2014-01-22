<script type="text/javascript">
<!--
function deleteType(tid){
	if( confirm('{$lang.Confirm_suppression_type_prog} ?') ){
		window.location.href = '{getLink("administration/programmationTypeDelete/'+ tid +'")}';
	}
}
//-->
</script>

{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Type_de_programmation}
</div>
{/if}

<div class="showData">
	<div class="fright">
		<a href="{getLink("administration/programmationTypeAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Type_de_programmation}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Type}</td>
				<td>{$lang.Action}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Types as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td>{$Row.nom}</td>
				<td class="center">
					<a href="{getLink("administration/programmationTypeEdit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>
					&nbsp;
					<a href="javascript:deleteType({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>