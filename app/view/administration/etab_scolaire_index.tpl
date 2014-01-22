<script type="text/javascript">
<!--
function deleteEtab(etab_id){
	if( confirm('{$lang.Confirm_suppression_etablissement} ?') ){
		window.location.href = '{getLink("administration/etabScolairedelete/'+ etab_id +'")}';
	}
}
//-->
</script>
{strip}
<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Etablissement_scolaire}
</div>

<div class="showData">
	<h1>{$lang.Etablissement_scolaire}</h1>
	
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Etablissement}</td>
				<td>{$lang.Telephone}</td>
				<td>{$lang.Ville}</td>
				<td>{$lang.Logiciel_suivi_note}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Etabs as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td>{$Row.nom}</td>
				<td>{$Row.telephone}</td>
				<td>{$Row.ville}</td>
				<td class="center">{if !empty($Row.url_portail_note)}<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />{else}<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />{/if}</td>
				<td class="center">
					<a href="{getLink("administration/etabScolaireEdit/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>
					&nbsp;&nbsp;
					<a href="javascript:deleteEtab({$Row.id});" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>	
	</table>
</div>
{/strip}