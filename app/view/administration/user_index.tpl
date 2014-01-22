<script type="text/javascript">
<!--
function deleteUser(user_id){
	if( confirm('{$lang.Confirm_suppression_utilisateur} ?') ){
		window.location.href = '{getLink("administration/userDelete/'+ user_id +'")}';
	}
}

{* Function JS permettant active/desactiver le compte utilisateur *}
function changeStatutAccount(user_id){
	$.get(
        '{getLink("administration/userChangeStatutAccount/'+ user_id +'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#actif_'+user_id).html(data); }
    )
    {/literal}
}

//--->
</script>{strip}

<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Utilisateurs}
</div>

<div class="showData">

    <div class="fright">
        <a href="{getLink("administration/userAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
    </div>

	<h1>{$lang.Utilisateurs}</h1>

    <div class="clear"></div>
    
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Identifiant}</td>
				<td>{$lang.Type}</td>
				<td>{$lang.Actif}</td>
				<td>{$lang.Suivi_med_prive}</td>
				<td>{$lang.Commentaire_suivi_med}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Utilisateurs as $Utilisateur}
			<tr>
				<td>{$Utilisateur.id}</td>
				<td>{$Utilisateur.identifiant}</td>
				<td>{$Utilisateur.type}</td>
				<td class="center">
					<span id="actif_{$Utilisateur.id}">
					{if $Utilisateur.actif == 1}
						<a href="javascript:changeStatutAccount({$Utilisateur.id})"><img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" /></a></span>
					{elseif $Utilisateur.actif == 0}
						<a href="javascript:changeStatutAccount({$Utilisateur.id})"><img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" /></a></span>
					{/if}
					</span>
				</td>				
				<td class="center">
					{if $Utilisateur.suivi_medical_show_prive == 1}
					<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{elseif $Utilisateur.suivi_medical_show_prive == 0}
					<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
				</td>
				<td class="center">
					{if $Utilisateur.suivi_medical_add_commentaire == 1}
					<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
					{elseif $Utilisateur.suivi_medical_add_commentaire == 0}
					<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
					{/if}
				</td>				
				<td class="center">
					<a href="{getLink("administration/userEdit/{$Utilisateur.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;&nbsp;
					<a href="javascript:deleteUser({$Utilisateur.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>