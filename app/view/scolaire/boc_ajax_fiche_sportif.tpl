<!--
Affiche des BOCs dans la fiche scolaire du sportif
//-->{strip}
<table class="table table-bordered table-condensed table-striped">
	<caption><h4>{$lang.Bilan_orientation_competences}</h4></caption>
	<thead>
		<tr>
			<td>#</td>
			<td>{$lang.Annee}</td>
			{if $smarty.session.acl.gest_joueur == 1}<td></td>{/if}
	</thead>
	<tbody>
	{foreach $BOCs as $Row}
		<tr>
			<td>{$Row.id}</td>
			<td>{$Row.annee}</td>
			{if $smarty.session.acl.gest_joueur == 1}
			<td class="center">
				<a href="{getLink("scolaire/printBOC/{$Row.id}?nohtml&print")}" title="Print" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/Print.png" alt="" style="width:16px;" /></a>&nbsp;&nbsp;
				<a href="javascript:getFormEditBoc({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;&nbsp;
				<a href="javascript:deleteBoc({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>&nbsp;&nbsp;
			</td>
			{/if}
	{/foreach}
	</tbody>
</table>{/strip}