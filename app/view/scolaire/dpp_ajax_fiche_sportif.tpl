<!--
Affiche des DPPs dans la fiche scolaire du sportif
//-->{strip}
<table class="table table-bordered table-condensed table-striped">
	<caption><h4>{$lang.Definition_projet_professionnel}</h4></caption>
	<thead>
		<tr>
			<th>#</th>
			<th>{$lang.Date}</th>
			{if $smarty.session.acl.gest_joueur == 1}<th></th>{/if}
	</thead>
	<tbody>
	{foreach $DPPs as $Row}
		<tr>
			<td>{$Row.id}</td>
			<td>{$Row.date_dpp}</td>
			{if $smarty.session.acl.gest_joueur == 1}
			<td class="center">
				<a href="{getLink("scolaire/printDPP/{$Row.id}?nohtml&print")}" title="Print" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/Print.png" alt="" style="width:16px;"/></a>&nbsp;&nbsp;
				<a href="javascript:getFormEditDpp({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;&nbsp;
				<a href="javascript:deleteDpp({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
			</td>
			{/if}
	{/foreach}
	</tbody>
</table>{/strip}