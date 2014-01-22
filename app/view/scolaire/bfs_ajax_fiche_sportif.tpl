<!--
Affiche des BFSs dans la fiche scolaire du sportif
//-->{strip}
<table class="table table-bordered table-condensed table-striped">
	<caption><h4>{$lang.Bilan_fin_saison}</h4></caption>
	<thead>
		<tr>
			<th>#</th>
			<th>{$lang.Annee}</th>
			<th>{$lang.Date}
			{if $smarty.session.acl.gest_joueur == 1}<th></th>{/if}
	</thead>
	<tbody>
	{foreach $BFSs as $Row}
		<tr>
			<td>{$Row.id}</td>
			<td>{$Row.annee}</td>
			<td>{$Row.date_bfs}</td>
			{if $smarty.session.acl.gest_joueur == 1}
			<td class="center">
				<a href="{getLink("scolaire/printBFS/{$Row.id}?nohtml&print")}" title="Print" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/Print.png" alt="" style="width:16px;"/></a>&nbsp;&nbsp;
				<a href="javascript:getFormEditBfs({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;&nbsp;
				<a href="javascript:deleteBfs({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
			</td>
			{/if}
	{/foreach}
	</tbody>
</table>{/strip}