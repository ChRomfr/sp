<script type="text/javascript">
<!--
function clearAclCache(){
	$.get(
        '{getLink("administration/aclAjaxClear")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#result_ajax_query').html(data); }
    )
    {/literal}	
}

function aclChange(typeAccount, aclName, aclValeur){
	$('#result_ajax_query').html('');
	
	$.get(
		'{getLink("administration/aclAjaxChange")}',{literal}
		{typeAccount:typeAccount,aclName:aclName,aclValeur:aclValeur,nohtml:'nohtml'},
		function(data){
			$('#result_ajax_query').html('Acl changed');{/literal}
			window.location.href = '{getLink("administration/aclIndex")}';
		}
	)
}
//-->
</script>{strip}

<div class="showData">
	<h1>ACLs</h1>
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Type}</td>
				<td>{$lang.Gestion_joueur}</td>
				<td>{$lang.Gestion_muscu}</td>
				<td>{$lang.Gestion_club}</td>
				<td>{$lang.Gestion_entrainement}</td>
				<td>{$lang.Gestion_structure}</td>
				<td>{$lang.Gestion_match}</td>
				<td>{$lang.Gestion_programmation}</td>
				<td>{$lang.Gestion_documents}</td>
				<td>{$lang.Voir_toute_les_fiches}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $ACLs as $Row}
			<tr>
				<td>{$Row.account_type}</td>
				<!-- JOUEUR -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_joueur',{$Row.gest_joueur})" title="">
					{if $Row.gest_joueur == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- MUSUCU -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_muscu',{$Row.gest_joueur})" title="">
					{if $Row.gest_muscu == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- CLUB -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_club',{$Row.gest_joueur})" title="">
					{if $Row.gest_club == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- ENTRAINEMENT -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_entrainement',{$Row.gest_joueur})" title="">
					{if $Row.gest_entrainement == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- STRUCTURE -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_structure',{$Row.gest_joueur})" title="">
					{if $Row.gest_structure == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- MATCH -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_match',{$Row.gest_joueur})" title="">
					{if $Row.gest_match == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- PROGRAMMATION -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_programmation',{$Row.gest_programmation})" title="">
					{if $Row.gest_programmation == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- DOCUMENTS -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','gest_document',{$Row.gest_document})" title="">
					{if $Row.gest_document == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
				<!-- VOIR TOUTE LES FICHES -->
				<td class="center">
					<a href="javascript:aclChange('{$Row.account_type}','view_all_fiche',{$Row.gest_joueur})" title="">
					{if $Row.view_all_fiche == 1}
						<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{else}
						<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
					</a>
				</td>
			{/foreach}
		</tbody>
	</table>
	
	<!-- Liste des actions sur les ACLs -->
	<br/><br/>
	<div><a href="javascript:clearAclCache()" title="" class="submit">{$lang.Reinitialiser_les_acls}</a></div>
	
	<!-- Conteneur pour resultat des requetes AJAX -->
	<div id="result_ajax_query"></div>
</div>{/strip}