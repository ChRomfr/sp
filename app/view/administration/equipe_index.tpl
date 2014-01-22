<script>
function deleteEquipe(cid){
    if( confirm('{$lang.Confirm_suppression_equipe} ?') ){
        window.location.href = '{getLink("administration/equipeDelete/'+cid+'")}';
    }
}
</script>

{strip}
{if $smarty.const.BREAD}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Equipe}
</div>
{/if}

<div class="showData">
	<div class="fright">
		<a href="{getLink("administration/equipeAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Equipe}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<td>#</td>
			<td>{$lang.Equipe}</td>
			<td>{$lang.Structure}</td>
			<td>{$lang.Action}</td>
		</thead>
		<tbody>
			{foreach $Equipes as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td>{$Row.nom}</td>
				<td>{$Row.structure}</td>
				<td class="center">
					<a href="{getLink("administration/equipeEdit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" /></a>
					<a href="javascript:deleteEquipe({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>{/strip}