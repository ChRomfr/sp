<script type="text/javascript">
<!--
function deleteActu(actu_id){
	if( confirm('{$lang.Confirm_suppression_actualite} ?') ){
		window.location.href = '{getLink("administration/actuDelete/'+ actu_id +'")}';
	}
}
//->
</script>

<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Actualite}
</div>

<div class="showData">
	<div class="fright">
		<a href="{getLink("administration/actuAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Actualite}</h1>
	
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Titre}</td>
				<td>{$lang.Auteur}</td>
				<td>{$lang.Date}</td>
				<td>{$lang.Action}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Actus as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td>{$Row.titre}</td>
				<td>{$Row.auteur}</td>
				<td>{$Row.creat_on|date_format:$config.format_date}</td>
				<td class="center">
					<a href="{getLink("administration/actuEdit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>
					<a href="javascript:deleteActu({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>

